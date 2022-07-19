#ifndef GUARD_CSVFILE_H
#define GUARD_CSVFILE_H

#include "global.h"
#include <cstring>

class CsvFile {
    std::vector<std::string> _colnames;
    std::vector<std::vector<std::string>> _rows;
    size_t _nrow = 0;
    size_t _ncol = 0;
    bool _has_header = true;
    static void ParseRow(std::string &line, std::vector<std::string> &row, bool resize = true);
    static void WriteRow(std::ofstream &ofile, std::vector<std::string> const &row);
public:
    CsvFile() = default;
    explicit CsvFile(const fs::path & filename, bool has_header = true) { FromFile(filename, has_header); };
    void FromFile(const fs::path & filename, bool has_header = true);

    void ToFile(const fs::path & filename, bool write_header = true);
    bool GetRow(size_t i, std::vector<std::string> &row) const;
    bool GetCol(size_t i, std::vector<std::string> &col) const;
    bool GetCol(const std::string &name, std::vector<std::string> &col) const;
    bool GetCell(size_t row, size_t col, std::string &cell) const;
    bool GetCell(const std::string &colname, size_t row, std::string &cell) const;
    bool SetRow(size_t i, const std::vector<std::string> &row);
    bool SetCol(size_t i, const std::vector<std::string> &col);
    bool SetCol(const std::string &name, const std::vector<std::string> &col);
    bool SetCell(size_t row, size_t col, const std::string &cell);
    bool SetCell(const std::string &colname, size_t row, const std::string &cell);
    std::vector<std::vector<std::string>>::iterator begin() { return _rows.begin(); }
    std::vector<std::vector<std::string>>::iterator end() { return _rows.end(); }
    std::vector<std::vector<std::string>>::const_iterator cbegin() { return _rows.cbegin(); }
    std::vector<std::vector<std::string>>::const_iterator cend() { return _rows.cend(); }
    std::vector<std::vector<std::string>>::reverse_iterator rbegin() { return _rows.rbegin(); }
    std::vector<std::vector<std::string>>::reverse_iterator rend() { return _rows.rend(); }
    std::vector<std::vector<std::string>>::const_reverse_iterator crbegin() { return _rows.crbegin(); }
    std::vector<std::vector<std::string>>::const_reverse_iterator crend() { return _rows.crend(); }
    [[nodiscard]] size_t nrow() const { return _nrow; }
    [[nodiscard]] size_t ncol() const { return _ncol; }
    std::vector<std::string> &operator[](size_t i) { return _rows[i]; }
    void resize_internal() {
        _rows.resize(_nrow);
        for (auto & row : _rows) {
            row.resize(_ncol);
        }
    }
    void resize(size_t nrow, size_t ncol) {
        if (_nrow != nrow || _ncol != ncol) {
            _nrow = nrow;
            _ncol = ncol;
            resize_internal();
        }
    }
    template <typename Iter>
    void SetColnames(Iter _begin, Iter _end) {
        _colnames.assign(_begin, _end);
        if (_ncol != _colnames.size()) {
            _ncol = _colnames.size();
            resize_internal();
        }
    }
    std::vector<std::string> &GetColnames() {
        return _colnames;
    }
};


#endif //GUARD_CSVFILE_H
