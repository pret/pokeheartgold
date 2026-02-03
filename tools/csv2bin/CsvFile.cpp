#include "CsvFile.h"

#include <sstream>
#include <stdexcept>

void CsvFile::ParseRow(std::string &line, std::vector<std::string> &row, bool resize) {
    std::string entry, qbuf;
    bool isQuoted = false;
    int i = 0;
    if (resize) {
        row.clear();
    }
    while (line[0] == '\r') {
        line = line.substr(1);
    }
    while (line[line.size() - 1] == '\r') {
        line = line.substr(0, line.size() - 1);
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
    std::ifstream handle(filename);
    if (!handle.is_open()) {
        throw std::runtime_error("unable to open file \"" + filename.string() + "\"");
    }
    std::string line;
    std::stringstream filebuf;

    // Read the whole file at once
    filebuf << handle.rdbuf();

    // Read the first row
    line = filebuf.str().substr(0, filebuf.str().find_first_of("\r\n"));

    // Calculate the number of rows
    size_t pos = 0;
    for (
        _nrow = !has_header;
        pos != std::string::npos &&
          (pos = filebuf.str().find_first_of("\r\n", pos), pos != std::string::npos);
        _nrow++
    ) {
        pos = filebuf.str().find_first_not_of("\r\n", pos);
        if (pos == std::string::npos) {
            break;
        }
    }

    // Calculate the number of columns
    pos = 0;
    for (
        _ncol = 1;
        pos = line.find(',', pos), pos++ != std::string::npos;
        _ncol++
    ) {}

    // Preallocate the rows and colnames
    _rows.resize(_nrow);
    _colnames.resize(_ncol);

    // Parse the header, or set a dummy header
    if (has_header) {
        ParseRow(line, _colnames, false);
        pos = filebuf.str().find_first_of("\r\n", pos);
        if (pos != std::string::npos) {
            pos = filebuf.str().find_first_not_of("\r\n", pos);
        }
    } else {
        int i = 1;
        for (std::string & name : _colnames) {
            name = "V" + std::to_string(i++);
        }
        pos = 0;
    }

    // Parse the rows
    size_t last_pos = pos;
    for (
        auto row = _rows.begin();
        row != _rows.end() &&
          (last_pos = pos, last_pos != std::string::npos) &&
          (pos = filebuf.str().find_first_of("\r\n", pos), pos != std::string::npos);
        row++
    ) {
        line = filebuf.str().substr(last_pos, pos - last_pos);
        row->resize(_ncol);
        ParseRow(line, *row, false);
        pos = filebuf.str().find_first_not_of("\r\n", pos);
        if (pos == std::string::npos) {
            break;
        }
    }
}

bool CsvFile::GetRow(size_t i, std::vector<std::string> &row) const {
    if (i >= _nrow) {
        row.clear();
        return false;
    } else {
        row = _rows[i];
        return true;
    }
}

bool CsvFile::GetCol(size_t i, std::vector<std::string> &col) const {
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
        size_t i = it - _colnames.cbegin();
        return GetCol(i, col);
    } else {
        col.clear();
        return false;
    }
}

bool CsvFile::GetCell(size_t row, size_t col, std::string &cell) const {
    if (row >= _nrow || col >= _ncol) {
        cell.clear();
        return false;
    } else {
        cell = _rows[row][col];
        return true;
    }
}

bool CsvFile::GetCell(const std::string &colname, size_t row, std::string &cell) const {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), colname);
    if (it != _colnames.cend()) {
        size_t i = it - _colnames.cbegin();
        return GetCell(row, i, cell);
    } else {
        cell.clear();
        return false;
    }
}

bool CsvFile::SetRow(size_t i, const std::vector<std::string> &row) {
    if (i >= _nrow) {
        return false;
    } else {
        _rows[i] = row;
        return true;
    }
}

bool CsvFile::SetCol(size_t i, const std::vector<std::string> &col) {
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
        size_t i = it - _colnames.cbegin();
        return SetCol(i, col);
    } else {
        return false;
    }
}

bool CsvFile::SetCell(size_t row, size_t col, const std::string &cell) {
    if (row >= _nrow || col >= _ncol) {
        return false;
    } else {
        _rows[row][col] = cell;
        return true;
    }
}

bool CsvFile::SetCell(const std::string &colname, size_t row, const std::string &cell) {
    auto it = std::find(_colnames.cbegin(), _colnames.cend(), colname);
    if (it != _colnames.cend()) {
        size_t i = it - _colnames.cbegin();
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
