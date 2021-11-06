#ifndef GUARD_CSVFILE_H
#define GUARD_CSVFILE_H

#include "global.h"

class CsvFile {
    std::vector<std::string> _colnames;
    std::vector<std::vector<std::string>> _rows;
    int _nrow;
    int _ncol;
    void ParseRow(std::string &line, std::vector<std::string> &row, bool resize = true);
    void WriteRow(std::ofstream &ofile, std::vector<std::string> const &row);
public:
    CsvFile() = default;
    CsvFile(const fs::path & filename, bool has_header = true) { FromFile(filename, has_header); };
    void FromFile(const fs::path & filename, bool has_header = true);

    virtual void ToFile(const fs::path & filename, bool write_header = true);
    bool GetRow(int i, std::vector<std::string> &row) const;
    bool GetCol(int i, std::vector<std::string> &col) const;
    bool GetCol(const std::string &name, std::vector<std::string> &col) const;
    bool GetCell(int row, int col, std::string &cell) const;
    bool GetCell(const std::string &colname, int row, std::string &cell) const;
    bool SetRow(int i, const std::vector<std::string> &row);
    bool SetCol(int i, const std::vector<std::string> &col);
    bool SetCol(const std::string &name, const std::vector<std::string> &col);
    bool SetCell(int row, int col, const std::string &cell);
    bool SetCell(const std::string &colname, int row, const std::string &cell);
    std::vector<std::vector<std::string>>::iterator begin() { return _rows.begin(); }
    std::vector<std::vector<std::string>>::iterator end() { return _rows.end(); }
    std::vector<std::vector<std::string>>::const_iterator cbegin() { return _rows.cbegin(); }
    std::vector<std::vector<std::string>>::const_iterator cend() { return _rows.cend(); }
    std::vector<std::vector<std::string>>::reverse_iterator rbegin() { return _rows.rbegin(); }
    std::vector<std::vector<std::string>>::reverse_iterator rend() { return _rows.rend(); }
    std::vector<std::vector<std::string>>::const_reverse_iterator crbegin() { return _rows.crbegin(); }
    std::vector<std::vector<std::string>>::const_reverse_iterator crend() { return _rows.crend(); }
    int nrow() const { return _nrow; }
    int ncol() const { return _ncol; }
    std::vector<std::string> &operator[](int i) { return _rows[i]; }
    void resize_internal() {
        _rows.resize(_nrow);
        for (auto & row : _rows) {
            row.resize(_ncol);
        }
    }
    void resize(int nrow, int ncol) {
        _nrow = nrow;
        _ncol = ncol;
        resize_internal();
    }
    template <typename _It>
    void SetColnames(_It _begin, _It _end) {
        _colnames.assign(_begin, _end);
    }
};


#endif //GUARD_CSVFILE_H
