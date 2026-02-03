#include "Manifest.h"

#include <iostream>
#include <stdexcept>

std::map<std::pair<fs::path, std::string>, std::map<std::string, int>> HeaderCache {
    {{"bool", ""}, {
         {"false", 0},
         {"true", 1}
     }}
};

void ColumnSpec::translate_width(std::string &width, int &bytes, int &bits) {
    int dotpos = width.find('.');

    try {
        bytes = std::stoi(width.substr(0, dotpos));
    } catch (std::invalid_argument &e) {
        throw std::invalid_argument("invalid width bytes value: \"" + width.substr(0, dotpos) + "\" in width spec \"" + width + "\"");
    } catch (std::out_of_range &e) {
        throw std::invalid_argument("width bytes value out of range: \"" + width.substr(0, dotpos) + "\" in width spec \"" + width + "\"");
    }
    if (dotpos == std::string::npos) {
        bits = 0;
    } else {
        try {
            bits = std::stoi(width.substr(dotpos + 1));
        } catch (std::invalid_argument &e) {
            throw std::invalid_argument("invalid width bits value: \"" + width.substr(dotpos + 1) + "\" in width spec \"" + width + "\"");
        } catch (std::out_of_range &e) {
            throw std::invalid_argument("width bits value out of range: \"" + width.substr(dotpos + 1) + "\" in width spec \"" + width + "\"");
        }
    }
}

void ColumnSpec::_init(int _width, const fs::path &headerfile, const std::string &prefix, int _nbits) {
    width = _width;
    nbits = _nbits;
    if (!headerfile.empty()) {
        try {
            constants = HeaderCache.at({headerfile, prefix});
        } catch (const std::out_of_range &e) {
            std::ifstream handle(headerfile);
            if (!handle.is_open()) {
                throw std::runtime_error("unable to open header file \"" + headerfile.string() + "\"");
            }
            std::regex pattern("#define +(" + prefix + "\\w+) +(\\d+)$");
            std::string line;
            std::smatch results;
            int line_num = 0;
            while (std::getline(handle, line)) {
                line_num++;
                while (!line.empty() && (line.back() == '\r' || line.back() == ' ' || line.back() == '\t')) {
                    line.pop_back();
                }
                if (std::regex_match(line, results, pattern)) {
                    try {
                        constants[results[1]] = std::stoi(results[2]);
                    } catch (std::invalid_argument &e2) {
                        throw std::invalid_argument("invalid constant value: \"" + results[2].str() + "\" in header file \"" + headerfile.string() + "\" line " + std::to_string(line_num));
                    } catch (std::out_of_range &e2) {
                        throw std::invalid_argument("constant value out of range: \"" + results[2].str() + "\" in header file \"" + headerfile.string() + "\" line " + std::to_string(line_num));
                    }
                }
            }
            HeaderCache[{headerfile, prefix}] = constants;
            if (constants.empty()) {
                std::cerr << "csv2bin warning: no constants found in header file \"" << headerfile.string() << "\"" << std::endl;
            }
        }
    }
}

ColumnSpec::ColumnSpec(int _width, const fs::path& headerfile, const std::string &prefix, int _nbits) {
    _init(_width, headerfile, prefix, _nbits);
}

ColumnSpec::ColumnSpec(std::string &_width, const fs::path &headerfile, const std::string &prefix) {
    int sign;
    int nbit;
    int nbytes;

    if (_width == "skip") {
        _init(skip, headerfile, prefix);
        return;
    }

    if (_width.substr(0, 3) == "pad") {
        std::string __width = _width.substr(3);
        translate_width(__width, nbytes, nbit);
        _init(pad | nbytes, headerfile, prefix, nbit);
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

    std::string __width = _width.substr(1);
    translate_width(__width, nbytes, nbit);
    switch (nbytes) {
    case 8:
    case 16:
    case 32:
    case 64:
        sign *= nbytes / 8;
        break;
    default:
        throw std::invalid_argument("width param must be a valid fixed-width type spec");
    }

    _init(sign, headerfile, prefix, nbit);
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

        // Tokenize with colons
        std::vector<std::string> tokens;
        size_t s = 0;
        size_t e;
        do {
            e = line.find(':', s);
            tokens.emplace_back(line.substr(s, e - s));
            s = e + 1;
        } while (e != std::string::npos);

        std::string name = tokens.at(0);
        try {
            mapping.at(name);
            throw std::invalid_argument("duplicate column in manifest: " + name);
        } catch (const std::out_of_range &e) {
            // discard silently, we gucci
        }
        std::string width = tokens.at(1);
        if (tokens.size() > 2) {
            if (tokens.size() > 3) {
                prefix = tokens[3];
            }
            fs::path header_name = tokens[2];
            if (header_name == "bool") {
                headerfile = "bool";
            } else {
                for (auto &root: header_dirs) {
                    if (fs::exists(root / header_name)) {
                        headerfile = root / header_name;
                        break;
                    }
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
    size_t bitpos = 0;
    for (const auto & name : colnames) {
        auto &spec = mapping.at(name);
        if (spec.is_skipped()) {
            continue;
        }
        size_t bytect = spec.size();
        size_t aln = spec.get_alignment();
        size_t bitct = spec.num_bits();
        if (bitpos != 0 && bitct == 0) {
            bitpos = 0;
            ret++;
        }
        if (bitpos == 0 && aln != 1) {
            ret += aln - 1;
            ret &= ~(aln - 1);
        }
        if (bitct != 0) {
            bitpos += bitct;
            if (bitpos >= 8 * bytect) {
                ret += bytect;
                bitpos -= 8 * bytect;
            }
        } else {
            ret += bytect;
        }
    }
    // Word align
    if (alignment != 0) {
        ret += alignment - 1;
        ret &= ~(alignment - 1);
    }
    return ret;
}

BufferedRowConverter::BufferedRowConverter(Manifest &_manifest, CsvFile &_csvFile, unsigned char _padval):
    manifest(_manifest),
    csvFile(_csvFile),
    padval(_padval)
{
    buffer.resize(manifest.size());
    carriage_return();
    byte_cursor = 0;
    bit_cursor = 0;
    row_cursor = 0;
}

std::ifstream &operator>>(std::ifstream &strm, BufferedRowConverter &cvtr) {
    std::ios::iostate state = strm.rdstate();
    size_t pos = strm.tellg();
    strm.read((char *)cvtr.buffer.data(), cvtr.buffer.size());
    cvtr.to_strings();
    cvtr++;
    return strm;
}

std::ofstream &operator<<(std::ofstream &strm, BufferedRowConverter &cvtr) {
    cvtr.to_bytes();
    strm.write((char *)cvtr.buffer.data(), cvtr.buffer.size());
    cvtr++;
    return strm;
}

void BufferedRowConverter::to_strings() {
    if (row_cursor >= csvFile.nrow()) {
        throw std::out_of_range("invalid row idx");
    }
    std::vector<std::string> &row = csvFile[row_cursor];
    size_t column_i = 0;
    for (const auto colname : manifest.colnames) {
        const ColumnSpec &spec = manifest[colname];
        if (spec.is_skipped()) {
            row.at(column_i++) = spec[row_cursor];
            continue;
        } else {
            align(spec.size(), spec.num_bits());
            unsigned long long val = get(spec.type(), spec.num_bits());
            if (spec.is_padding()) {
                if (val != 0) {
                    std::cerr << "csv2bin warning: nonzero data in padding field may result in data loss" << std::endl;
                }
            } else {
                row.at(column_i++) = spec[val];
            }
            advance(spec.size(), spec.num_bits());
        }
    }
}

void BufferedRowConverter::to_bytes() {
    if (row_cursor >= csvFile.nrow()) {
        throw std::out_of_range("invalid row idx");
    }
    std::vector<std::string> &row = csvFile[row_cursor];
    size_t column_i = 0;
    for (const auto colname : manifest.colnames) {
        const ColumnSpec &spec = manifest[colname];
        if (spec.is_skipped()) {
            column_i++;
            continue;
        } else {
            align(spec.get_alignment(), spec.num_bits());
            unsigned long long val;
            if (spec.is_padding()) {
                val = 0;
            } else {
                // val = spec[row.at(column_i++)];
                try {
                    const std::string &cell_value = row.at(column_i);
                    val = spec[cell_value];
                    column_i++;
                } catch (std::invalid_argument &e) {
                    std::string msg = "row" + std::to_string(row_cursor + 1) + " (1-indexed), column \"" + colname + "\" (index " + std::to_string(column_i) + "): " + e.what();
                    if (column_i < row.size()) {
                        msg += " (cell value: \"" + row.at(column_i) + "\")";
                    } else {
                        msg += " (cell value: <missing>)";
                    }
                    throw std::invalid_argument(msg);
                } catch (std::out_of_range &e) {
                    std::string msg = "row" + std::to_string(row_cursor + 1) + " (1-indexed), column \"" + colname + "\" (index " + std::to_string(column_i) + "): " + e.what();
                    msg += "(row has " + std::to_string(row.size()) + "columns)";
                    throw std::invalid_argument(msg);
                }
            }
            set(val, spec.type(), spec.num_bits());
            advance(spec.size(), spec.num_bits());
        }
    }
    if (bit_cursor != 0) {
        const ColumnSpec &spec = manifest[*manifest.colnames.crbegin()];
        byte_cursor += spec.size();
    }
    while (byte_cursor < buffer.size()) {
        buffer[byte_cursor++] = padval;
    }
}
