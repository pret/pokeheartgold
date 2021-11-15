#include "Manifest.h"

void ColumnSpec::_init(int _width, const fs::path &headerfile, const std::string &prefix) {
    width = _width;
    if (!headerfile.empty()) {
        std::ifstream handle(headerfile);
        std::regex pattern("#define +(" + prefix + "\\w+) +(\\d+)$");
        std::string line;
        std::smatch results;
        while (std::getline(handle, line)) {
            if (std::regex_match(line, results, pattern)) {
                constants[results[1]] = std::stoi(results[2]);
            }
        }
    }
}

ColumnSpec::ColumnSpec(int _width, const fs::path& headerfile, const std::string &prefix) {
    _init(_width, headerfile);
}

ColumnSpec::ColumnSpec(std::string &_width, const fs::path &headerfile, const std::string &prefix) {
    int sign;
    int nbit;

    if (_width == "skip") {
        _init(skip, headerfile, prefix);
        return;
    }

    if (_width.substr(0, 3) == "pad") {
        _init(pad | std::stoi(_width.substr(3)), headerfile, prefix);
        return;
    }

    switch (_width[0]) {
    case 's':
        sign = -1;
        break;
    case 'u':
        sign = 1;
        break;
    default:
        throw std::invalid_argument("width param must be a valid fixed-width type spec");
    }

    nbit = std::stoi(_width.substr(1));
    switch (nbit) {
    case 8:
    case 16:
    case 32:
    case 64:
        sign *= nbit / 8;
        break;
    default:
        throw std::invalid_argument("width param must be a valid fixed-width type spec");
    }

    _init(sign, headerfile, prefix);
}

void ColumnSpec::align(std::ifstream &strm) const {
    unsigned alignment = abs(width);
    if (alignment == 1) {
        return;
    }
    long pos = strm.tellg();
    if (pos & (alignment - 1)) {
        strm.seekg((pos + alignment - 1) & ~(alignment - 1));
    }
}

void ColumnSpec::align(std::ofstream &strm) const {
    unsigned alignment = abs(width);
    if (alignment == 1) {
        return;
    }
    long pos = strm.tellp();
    if (pos & (alignment - 1)) {
        unsigned char buffer[sizeof(long long)] = {0};
        strm.write((const char *)buffer, (unsigned)((-pos) & (alignment - 1)));
    }
}

std::string ColumnSpec::read(std::ifstream &strm, const int row_i) const {
    unsigned long long result = 0;
    unsigned nbytes = size();
    if (is_padding()) {
        char padding[nbytes];
        strm.read(padding, nbytes);
        for (int i = 0; i < nbytes; i++) {
            if (padding[i]) {
                throw padding_warning("nonzero bytes found in pad column. some data loss may occur.");
            }
        }
        return "";
    }
    if (is_skipped()) {
        if (row_i == -1) {
            return "";
        }
        result = row_i;
    } else {
        static unsigned char buffer[sizeof(long long)];
        align(strm);
        strm.read((char *)buffer, nbytes);
        for (unsigned i = 0; i < nbytes; i++) {
            result |= buffer[i] << (i * 8);
        }
        if (is_signed() && nbytes < sizeof(long long) && (buffer[nbytes - 1] & 0x80)) {
            result |= -1ull << (8 * nbytes); // sign extend
        }
    }
    std::string ret;
    if (!constants.empty()) {
        const auto mp = std::find_if(constants.cbegin(), constants.cend(), [&](const auto &my_pair) {
            return my_pair.second == result;
        });
        if (mp != constants.cend()) {
            ret = mp->first;
        }
    }
    if (ret.empty()) {
        if (is_signed()) {
            ret = std::to_string((long long)result);
        }
        else {
            ret = std::to_string(result);
        }
    }
    return ret;
}

void ColumnSpec::write(std::ofstream &strm, const std::string& data) const {
    if (is_skipped()) {
        return;
    }
    static unsigned char buffer[sizeof(long long)];
    if (is_padding()) {
        memset(buffer, 0, sizeof(long long));
        strm.write((const char *)buffer, size());
        return;
    }
    long long result;
    unsigned nbytes = size();
    if (!constants.empty()) {
        try {
            result = constants.at(data);
        } catch (const std::out_of_range &e) {
            result = std::stoll(data);
        }
    } else {
        result = std::stoll(data);
    }
    for (unsigned i = 0; i < nbytes; i++) {
        buffer[i] = result >> (8 * i);
    }
    align(strm);
    strm.write((const char *)buffer, nbytes);
}

Manifest::Manifest(const fs::path &filename, std::vector<fs::path> &header_dirs) {
    read(filename, header_dirs);
}

void Manifest::read(const fs::path &filename, std::vector<fs::path> &header_dirs) {
    std::ifstream strm(filename);
    std::string line;
    while (std::getline(strm, line)) {
        line = line.substr(0, line.find_last_not_of(" \t\r\n") + 1);
        fs::path headerfile;
        std::string prefix;
        size_t first_colon = line.find(':');
        if (first_colon == std::string::npos) {
            continue;
        }
        std::string name = line.substr(0, first_colon);
        assert(!mapping[name].is_init());
        size_t second_colon = line.find(':', first_colon + 1);
        std::string width = line.substr(first_colon + 1, (second_colon == std::string::npos) ? std::string::npos : second_colon - first_colon - 1);
        if (second_colon != std::string::npos) {
            size_t third_colon = line.find(':', second_colon + 1);
            if (third_colon != std::string::npos) {
                prefix = line.substr(third_colon + 1);
            }
            for (auto &root : header_dirs) {
                if (fs::exists(root / line.substr(second_colon + 1, (third_colon == std::string::npos) ? std::string::npos : third_colon - second_colon - 1))) {
                    headerfile = root / line.substr(second_colon + 1, (third_colon == std::string::npos) ? std::string::npos : third_colon - second_colon - 1);
                    break;
                }
            }
        }
        mapping[name] = ColumnSpec(width, headerfile, prefix);
        colnames.emplace_back(name);
    }
}

ColumnSpec &Manifest::operator[](const std::string &name) {
    return mapping[name];
}

size_t Manifest::size(const int alignment) const {
    size_t ret = 0;
    for (const auto & name : colnames) {
        size_t lsize = mapping.at(name).size();
        if (lsize != 0) {
            ret += (2 * lsize - 1);
            ret &= ~(lsize - 1);
        }
    }
    // Word align
    if (alignment != 0) {
        ret += alignment - 1;
        ret &= ~(alignment - 1);
    }
    return ret;
}
