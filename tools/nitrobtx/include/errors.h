/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#ifndef NITROBTX_ERRORS_H
#define NITROBTX_ERRORS_H

enum ErrorCode {
    ERR_CODE_OK,
    ERR_CODE_OPTION_PARSE_FAILURE,
    ERR_CODE_FAILED_OPEN_INPUT,
    ERR_CODE_FAILED_OPEN_OUTPUT,
    ERR_CODE_INVALID_FILE_TYPE,
    ERR_CODE_INPUT_INVALID,
    ERR_CODE_UNSUPPORTED,
    ERR_CODE_UNSUPPORTED_FORMAT,
    ERR_CODE_LIBPNG_ERROR,
    ERR_CODE_RES_TREE_BUILD_FAIL,
};

#endif // NITROBTX_ERRORS_H
