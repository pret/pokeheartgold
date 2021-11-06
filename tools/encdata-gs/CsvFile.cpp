#include <sstream>
#include "CsvFile.h"

void CsvFile::ParseRow(std::string &line, std::vector<std::string> &row, bool resize) {
    std::string entry, qbuf;
    bool isQuoted = false;
    int i = 0;
    if (resize) {
        row.clear();
    }
    std::stringstream line_s(line);
    while (std::getline(line_s, entry, ',')) {
        if (!isQuoted && entry[0] == '"') {
            isQuoted = true;
            entry = entry.substr(1);
        }
        if (isQuoted) {
            if (entry[entry.size() - 1] == '"') {
                isQuoted = false;
                entry = entry.substr(0, entry.size() - 1);
            }
            qbuf += entry;
            if (!isQuoted) {
                if (resize) {
                    row.push_back(qbuf);
                } else {
                    row[i++] = qbuf;
                }
                qbuf.clear();
            }
        } else {
            if (resize) {
                row.push_back(entry);
            } else {
                row[i++] = entry;
            }
        }
    }
    assert(!isQuoted);
}

void CsvFile::FromFile(const fs::path &filename, bool has_header) {
    std::string line;
    std::ifstream handle(filename);
    std::vector<std::string> firstRow;
    for (_nrow = 0; std::getline(handle, line); _nrow++) {
        if (firstRow.empty()) {
            ParseRow(line, firstRow);
            _ncol = firstRow.size();
            _colnames.resize(_ncol);
        }
    }
    handle.clear();
    handle.seekg(0);
    if (has_header) {
        std::getline(handle, line);
        ParseRow(line, _colnames, false);
        _nrow--;
    } else {
        int i = 1;
        for (std::string & name : _colnames) {
            name = "V" + std::to_string(i++);
        }
    }
    _rows.resize(_nrow);
    for (auto & vec : _rows) {
        vec.resize(_ncol);
        std::getline(handle, line);
        ParseRow(line, vec, false);
    }
}

bool CsvFile::GetRow(int i, std::vector<std::string> &row) const {
    if (i >= _nrow) {
        row.clear();
        return false;
    } else {
        row = _rows[i];
        return true;
    }
}

bool CsvFile::GetCol(int i, std::vector<std::string> &col) const {
    if (i >= _ncol) {
        col.clear();
        return false;
    } else {
        int j = 0;
        for (const auto & row : _rows) {
            col[j++] = row[i];
        }
        return true;
    }
}

bool CsvFile::GetCol(const std::string &name, std::vector<std::string> &col) const {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), name);
    if (it != _colnames.cend()) {
        int i = it - _colnames.cbegin();
        return GetCol(i, col);
    } else {
        col.clear();
        return false;
    }
}

bool CsvFile::GetCell(int row, int col, std::string &cell) const {
    if (row >= _nrow || col >= _ncol) {
        cell.clear();
        return false;
    } else {
        cell = _rows[row][col];
        return true;
    }
}

bool CsvFile::GetCell(const std::string &colname, int row, std::string &cell) const {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), colname);
    if (it != _colnames.cend()) {
        int i = it - _colnames.cbegin();
        return GetCell(row, i, cell);
    } else {
        cell.clear();
        return false;
    }
}

bool CsvFile::SetRow(int i, const std::vector<std::string> &row) {
    if (i >= _nrow) {
        return false;
    } else {
        _rows[i] = row;
        return true;
    }
}

bool CsvFile::SetCol(int i, const std::vector<std::string> &col) {
    if (i >= _ncol) {
        return false;
    } else {
        int j = 0;
        for (auto & row : _rows) {
            row[i] = col[j++];
        }
        return true;
    }
}

bool CsvFile::SetCol(const std::string &name, const std::vector<std::string> &col) {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), name);
    if (it != _colnames.cend()) {
        int i = it - _colnames.cbegin();
        return SetCol(i, col);
    } else {
        return false;
    }
}

bool CsvFile::SetCell(int row, int col, const std::string &cell) {
    if (row >= _nrow || col >= _ncol) {
        return false;
    } else {
        _rows[row][col] = cell;
        return true;
    }
}

bool CsvFile::SetCell(const std::string &colname, int row, const std::string &cell) {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), colname);
    if (it != _colnames.cend()) {
        int i = it - _colnames.cbegin();
        return SetCell(row, i, cell);
    } else {
        return false;
    }
}

void CsvFile::WriteRow(std::ofstream &ofile, const std::vector<std::string> &row) {
    bool first = true;
    for (const auto & entry : row) {
        if (!first) {
            ofile << ',';
        } else {
            first = false;
        }
        bool has_comma = (entry.find(',') != std::string::npos);
        if (has_comma) {
            ofile << '"';
        }
        ofile << entry;
        if (has_comma) {
            ofile << '"';
        }
    }
    ofile << '\n';
}

void CsvFile::ToFile(const fs::path &filename, bool write_header) {
    std::ofstream ofile(filename);
    if (write_header) {
        WriteRow(ofile, _colnames);
    }
    for (auto const & row : _rows) {
        WriteRow(ofile, row);
    }
}
