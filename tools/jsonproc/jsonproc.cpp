// jsonproc.cpp

#include "jsonproc.h"

#include <map>

#include <string>
#include <sstream>
using std::string; using std::to_string;

#include "inja.hpp"
using namespace inja;
using json = nlohmann::json;

std::map<string, string> customVars;

void set_custom_var(string key, string value)
{
    customVars[key] = value;
}

string get_custom_var(string key)
{
    return customVars[key];
}

int main(int argc, char *argv[])
{
    if (argc != 4)
        FATAL_ERROR("USAGE: jsonproc <json-filepath> <template-filepath> <output-filepath>\n");

    string jsonfilepath = argv[1];
    string templateFilepath = argv[2];
    string outputFilepath = argv[3];

    Environment env;

    // Add custom command callbacks.
    env.add_callback("doNotModifyHeader", 0, [jsonfilepath, templateFilepath](Arguments& args) {
        return "//\n// DO NOT MODIFY THIS FILE! It is auto-generated from " + jsonfilepath +" and Inja template " + templateFilepath + "\n//\n";
    });

    env.add_callback("contains", 2, [](Arguments& args) {
        string word = args.at(0)->get<string>();
        string check = args.at(1)->get<string>();

        return word.find(check) != std::string::npos;
    });

    env.add_callback("subtract", 2, [](Arguments& args) {
        int minuend = args.at(0)->get<int>();
        int subtrahend = args.at(1)->get<int>();

        return minuend - subtrahend;
    });

    env.add_callback("add", 2, [](Arguments& args) {
        int x = args.at(0)->get<int>();
        int y = args.at(1)->get<int>();

        return x + y;
    });

    env.add_callback("setBit", 2, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        unsigned long value = std::stoul(get_custom_var(key));
        value |= (1 << (args.at(1)->get<int>()));
        set_custom_var(key, to_string(value));
        return "";
    });

    env.add_callback("setVar", 2, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        string value = args.at(1)->get<string>();
        set_custom_var(key, value);
        return "";
    });

    env.add_callback("setVarInt", 2, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        string value = to_string(args.at(1)->get<int>());
        set_custom_var(key, value);
        return "";
    });

    env.add_void_callback("setVarArr", [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        string value;
        string sep = "";
        for (auto arg_i = args.begin() + 1; arg_i != args.end(); ++arg_i) {
            value += sep += (*arg_i)->get<string>();
            sep = "|";
        }
        set_custom_var(key, value);
    });

    env.add_callback("getIndexInArr", 2, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        string element = args.at(1)->get<string>();
        string var = get_custom_var(key);
        size_t pos = 0;
        int i = 0;
        size_t rpos;
        string result = "-1";
        do {
            rpos = var.find('|', pos);
            size_t length = (rpos == string::npos ? element.length() : rpos) - pos;
            if (var.substr(pos, length) == element) {
                return to_string(i);
            }
            pos = rpos + 1;
            ++i;
        } while (rpos != string::npos);
        FATAL_ERROR("%s not found in %s=[%s]\n", element.c_str(), key.c_str(), var.c_str());
    });

    env.add_callback("getVar", 1, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        return get_custom_var(key);
    });

    env.add_callback("getVarHex", 1, [=](Arguments& args) {
        string key = args.at(0)->get<string>();
        unsigned long value = std::stoul(get_custom_var(key));
        std::stringstream ss;
        ss << "0x" << std::hex << (value & 0xFFFFFFFFul);
        string s = ss.str();
        return s;
    });

    env.add_callback("concat", 2, [](Arguments& args) {
        string first = args.at(0)->get<string>();
        string second = args.at(1)->get<string>();
        return first + second;
    });

    env.add_callback("removePrefix", 2, [](Arguments& args) {
        string rawValue = args.at(0)->get<string>();
        string prefix = args.at(1)->get<string>();
        string::size_type i = rawValue.find(prefix);
        if (i != 0)
            return rawValue;

        return rawValue.erase(0, prefix.length());
    });

    env.add_callback("removeSuffix", 2, [](Arguments& args) {
        string rawValue = args.at(0)->get<string>();
        string suffix = args.at(1)->get<string>();
        string::size_type i = rawValue.rfind(suffix);
        if (i == string::npos)
            return rawValue;

        return rawValue.substr(0, i);
    });

    // single argument is a json object
    env.add_callback("isEmpty", 1, [](Arguments& args) {
        return args.at(0)->empty();
    });

    env.add_void_callback("log", 1, [](Arguments& args) {
        std::cout << args.at(0)->get<int>() << std::endl;
    });

    env.add_callback("fmtInt", 3, [](Arguments& args) {
        int num = args.at(0)->get<int>();
        int ndigits = args.at(1)->get<int>();
        int format = args.at(2)->get<int>();
        char buf[ndigits + 1];
        bool printing_zeros = (format == 2);
        int pow10 = 1;
        for (int i = 1; i < ndigits; i++) {
            pow10 *= 10;
        }
        char *ptr = buf;
        while (pow10 > 0) {
            div_t div_result = div(num, pow10);
            num = div_result.rem;
            pow10 /= 10;
            if (div_result.quot != 0) {
                printing_zeros = true;
            } else if (!printing_zeros) {
                if (pow10 == 0) {
                    printing_zeros = true;
                } else {
                    if (format == 1) {
                        *ptr++ = ' ';
                    }
                    continue;
                }
            }
            if (div_result.quot != 0 || printing_zeros) {
                *ptr++ = '0' + div_result.quot;
            }
        }
        *ptr = 0;
        return string{buf};
    });

    try
    {
        env.write_with_json_file(templateFilepath, jsonfilepath, outputFilepath);
    }
    catch (const std::exception& e)
    {
        FATAL_ERROR("JSONPROC_ERROR: %s\n", e.what());
    }

    return 0;
}
