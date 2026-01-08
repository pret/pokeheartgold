#ifndef GUARD_MANIFEST_H
#define GUARD_MANIFEST_H

#include "global.h"
#include "CsvFile.h"

template <typename T = unsigned, typename C = char>
C* to_array(C* buf, const T val, off_t offset = 0) {
    for (int i = 0; i < sizeof(T); i++) {
        buf[offset + i] = (val >> (8 * i * sizeof(C)));
    }
    return buf;
}

template <typename T = unsigned, typename C = char>
T from_array(const C* buf, off_t offset = 0) {
    T ret = 0;
    for (int i = 0; i < sizeof(T); i++) {
        ret |= buf[offset + i] << (8 * i * sizeof(C));
    }
    return ret;
}

template <typename T = unsigned, typename C = char>
std::vector<C> & to_array(std::vector<C> & buf, const T val, off_t offset = 0) {
    for (int i = 0; i < sizeof(T); i++) {
        buf[offset + i] = (val >> (8 * i * sizeof(C)));
    }
    return buf;
}

template <typename T = unsigned, typename C = char>
T from_array(const std::vector<C> & buf, off_t offset = 0) {
    T ret = 0;
    for (int i = 0; i < sizeof(T); i++) {
        ret |= buf[offset + i] << (8 * i * sizeof(C));
    }
    return ret;
}

class padding_warning : public std::exception {
    std::string _what;
public:
    padding_warning(const char *c) : _what(c) {}
    padding_warning(const std::string &s) : _what(s) {}
    const char * what() const noexcept { return _what.c_str(); }
};

class ColumnSpec {
    typedef int width_t;
    static const width_t u8   =   1;
    static const width_t u16  =   2;
    static const width_t u32  =   4;
    static const width_t u64  =   8;
    static const width_t s8   =  -1;
    static const width_t s16  =  -2;
    static const width_t s32  =  -4;
    static const width_t s64  =  -8;
    static const width_t skip = 256;
    static const width_t pad  = 512;

    width_t width = 0;                              // number of bytes. positive = unsigned, negative = signed
    unsigned char nbits = 0;
    std::map<std::string, int> constants; // from a C header, specified in the manifest

    void _init(int _width, const fs::path &headerfile = "", const std::string &prefix = "", int _nbits = 0);
    static void translate_width(std::string &width, int &bytes, int &bits);
public:
    ColumnSpec() = default;
    explicit ColumnSpec(int _width, const fs::path& headerfile = "", const std::string &prefix = "", int _nbits = 0);
    explicit ColumnSpec(std::string &_width, const fs::path& headerfile = "", const std::string &prefix = "");
    size_t size() const {
        if (is_skipped()) {
            return 0;
        }
        if (is_padding()) {
            return width & 0xFF;
        }
        return abs(width);
    }
    int type() const {
        if (is_skipped()) {
            return 0;
        }
        if (is_padding()) {
            return width & 0xFF;
        }
        return width;
    }
    bool is_signed() const { return width < 0; }
    bool is_init() const { return width != 0; }
    bool is_padding() const { return width > 0 && (width & ~0xFF) == pad; }
    bool is_skipped() const { return width == skip; }
    bool is_bitfield() const { return nbits != 0; }
    unsigned num_bits() const { return nbits; }
    unsigned get_alignment() const {
        if (is_skipped() || is_padding()) {
            return 1;
        }
        return size();
    }
    const std::string operator[](int i) const {
        auto it = std::find_if(constants.cbegin(), constants.cend(), [&](const auto pair) { return pair.second == i; });
        if (it == constants.end()) {
            return std::to_string(i);
        }
        return it->first;
    }
    int operator[](const std::string &key) const {
        try {
            return constants.at(key);
        } catch (std::out_of_range &e) {
            try {
                return std::stoi(key);
            } catch (std::invalid_argument &e2) {
                std::string msg = "invalid integer value: \"" + key + "\"";
                if (!constants.empty()) {
                    msg += " (not found in constants map with " + std::to_string(constants.size()) + " entries)";  
                }
                throw std::invalid_argument(msg);
            } catch (std::out_of_range &e2) {
                throw std::invalid_argument("integer value out of range: \"" + key + "\"");
            }
        }
    }
};

// File format: newline separated
class Manifest {
    std::map<std::string, ColumnSpec> mapping; // maps column name to column specification
public:
    std::vector<std::string> colnames;         // column ordering
    using manifest_iter = std::map<std::string, ColumnSpec>::iterator;
    using manifest_const_iter = std::map<std::string, ColumnSpec>::const_iterator;
    using manifest_reverse_iter = std::map<std::string, ColumnSpec>::reverse_iterator;
    using manifest_const_reverse_iter = std::map<std::string, ColumnSpec>::const_reverse_iterator;
    Manifest() = default;
    explicit Manifest(fs::path const &filename, std::vector<fs::path> &header_dirs);
    void read(fs::path const &filename, std::vector<fs::path> &header_dirs);
    ColumnSpec &operator[](const std::string &name);
    manifest_iter begin() { return mapping.begin(); }
    manifest_iter end() { return mapping.end(); }
    manifest_const_iter cbegin() { return mapping.cbegin(); }
    manifest_const_iter cend() { return mapping.cend(); }
    manifest_reverse_iter rbegin() { return mapping.rbegin(); }
    manifest_reverse_iter rend() { return mapping.rend(); }
    manifest_const_reverse_iter crbegin() { return mapping.crbegin(); }
    manifest_const_reverse_iter crend() { return mapping.crend(); }
    [[nodiscard]] size_t size(const int alignment = 4) const;
    template <typename Iter>
    void assign(Iter first, Iter last) {
        mapping.clear();
        for (auto pair = first; pair != last; pair ++) {
            mapping[pair->first] = pair->second;
        }
    }
};

class BufferedRowConverter {
    Manifest &manifest;
    CsvFile &csvFile;
    std::vector<unsigned char>buffer;
    off_t byte_cursor = 0;
    off_t bit_cursor = 0;
    off_t row_cursor = 0;
    unsigned char padval = 0;
public:
    BufferedRowConverter(Manifest &_manifest, CsvFile &_csvFile, unsigned char _padval = 0);
    void to_strings();
    void to_bytes();
    friend std::ifstream &operator>>(std::ifstream &strm, BufferedRowConverter &cvtr);
    friend std::ofstream &operator<<(std::ofstream &strm, BufferedRowConverter &cvtr);
    BufferedRowConverter &operator++() {
        if (row_cursor >= csvFile.nrow()) {
            throw std::out_of_range("BufferedRowConverter++");
        }
        row_cursor++;
        return *this;
    };
    BufferedRowConverter &operator++(int i) {
        if (row_cursor + i > csvFile.nrow()) {
            throw std::out_of_range("BufferedRowConverter++");
        }
        row_cursor++;
        carriage_return();
        return *this;
    };
    unsigned bitmask(unsigned nbits) const {
        return ((1ul << nbits) - 1) << bit_cursor;
    }
    void align(const unsigned alignment, const unsigned bitcount) {
        if (bitcount == 0 && bit_cursor != 0) {
            byte_cursor++;
            bit_cursor = 0;
        }
        if (alignment == 1) return;
        if (byte_cursor & (alignment - 1)) {
            byte_cursor += alignment - 1;
            byte_cursor &= ~(alignment - 1);
            bit_cursor = 0;
        }
    }
    unsigned long long get(int width, int numbits = 0) const {
        unsigned long ret;
        if (byte_cursor + abs(width) > buffer.size()) {
            throw std::out_of_range("BufferedRowConverter::get");
        }
        switch (width) {
        case 1:
            ret = from_array<uint8_t>(buffer, byte_cursor);
            break;
        case 2:
            ret = from_array<uint16_t>(buffer, byte_cursor);
            break;
        case 4:
            ret = from_array<uint32_t>(buffer, byte_cursor);
            break;
        case 8:
            ret = from_array<uint64_t>(buffer, byte_cursor);
            break;
        case -1:
            ret = from_array<int8_t>(buffer, byte_cursor);
            break;
        case -2:
            ret = from_array<int16_t>(buffer, byte_cursor);
            break;
        case -4:
            ret = from_array<int32_t>(buffer, byte_cursor);
            break;
        case -8:
            ret = from_array<int64_t>(buffer, byte_cursor);
            break;
        default:
            throw std::invalid_argument("BufferedRowConverter::get");
        }
        if (numbits != 0) {
            ret &= bitmask(numbits);
            ret >>= bit_cursor;
        }
        return ret;
    }
    void set(unsigned long long val, int width, int numbits = 0) {
        if (numbits != 0) {
            val <<= bit_cursor;
            val &= bitmask(numbits);
            val |= (get(width) & ~bitmask(numbits));
        }
        if (byte_cursor + abs(width) > buffer.size()) {
            throw std::out_of_range("BufferedRowConverter::set");
        }
        switch (width) {
        case 1:
            to_array<uint8_t>(buffer, val, byte_cursor);
            break;
        case 2:
            to_array<uint16_t>(buffer, val, byte_cursor);
            break;
        case 4:
            to_array<uint32_t>(buffer, val, byte_cursor);
            break;
        case 8:
            to_array<uint64_t>(buffer, val, byte_cursor);
            break;
        case -1:
            to_array<int8_t>(buffer, val, byte_cursor);
            break;
        case -2:
            to_array<int16_t>(buffer, val, byte_cursor);
            break;
        case -4:
            to_array<int32_t>(buffer, val, byte_cursor);
            break;
        case -8:
            to_array<int64_t>(buffer, val, byte_cursor);
            break;
        default:
            throw std::invalid_argument("BufferedRowConverter::set");
        }
    }
    void advance(int nbytes, int nbits = 0) {
        if (nbits != 0) {
            bit_cursor += nbits;
            if (bit_cursor >= nbytes * 8) {
                byte_cursor += nbytes;
                bit_cursor -= nbytes * 8;
            }
        } else {
            byte_cursor += nbytes;
            bit_cursor = 0;
        }
    }
    void carriage_return() {
        byte_cursor = 0;
        bit_cursor = 0;
        buffer.assign(buffer.size(), 0);
    }
};

#endif //GUARD_MANIFEST_H
