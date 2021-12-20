#include "Gmm.h"
#include <pugixml.hpp>
#include <iostream>

static const char WINCTXNAME[] = "window_context_name";
static const char LANGUAGE[] = "English";
static const char JAPANESE[] = "日本語";

void GMM::FromFile(std::vector<std::string> &messages) {
    pugi::xml_parse_result result = doc.load(stream);
    if (!result) {
        throw std::runtime_error(result.description());
    }
    const auto &node = doc.find_child([](const auto &n) {
        return strcmp(n.name(), "body") == 0;
    });
    int i = 0;
    for (const auto &subnode : node.children()) {
        if (strcmp(subnode.name(), "row") == 0) {
            const auto &language = subnode.find_child([](const auto &n) {
                return strcmp(n.name(), "language") == 0 && strcmp(n.attribute("name").value(), LANGUAGE) == 0;
            });
            const auto &windowcontext = subnode.find_child([](const auto &n) {
                return strcmp(n.name(), "attribute") == 0 && strcmp(n.attribute("name").value(), WINCTXNAME) == 0;
            });
            std::string is_garbage(windowcontext.child_value());
            std::string message(language.child_value());
            if (is_garbage == "garbage") {
                const auto &jap = subnode.find_child([](const auto &n) {
                    return strcmp(n.name(), "language") == 0 && strcmp(n.attribute("name").value(), JAPANESE) == 0;
                });
                message.assign(jap.child_value());
                std::fill(message.begin(), message.end(), ' ');
            }
            messages.push_back(message);
            i++;
        }
    }
}

void GMM::ToFile(const std::vector<std::string> &messages) {
    auto body = doc.append_child("body");
    body.append_attribute("language").set_value("English");
    if (body.empty()) {
        throw std::runtime_error("failed to create gmm body node");
    }
    for (const auto &message : messages) {
        auto row = body.append_child("row");
        if (row.empty()) {
            throw std::runtime_error("failed to create gmm row node");
        }
        auto windowcontextname = row.append_child("attribute");
        windowcontextname.append_attribute("name").set_value(WINCTXNAME);
        auto language = row.append_child("language");
        if (language.empty()) {
            throw std::runtime_error("failed to create gmm language node");
        }
        language.append_attribute("name").set_value(LANGUAGE);
        auto windowattr = windowcontextname.append_child(pugi::xml_node_type::node_pcdata);
        if (message.find_first_not_of(' ') == std::string::npos) {
            std::string buf;
            buf.resize(message.size());
            std::fill(buf.begin(), buf.end(), 'X');
            windowattr.set_value("garbage");
            auto jap = row.append_child("language");
            jap.append_attribute("name").set_value(JAPANESE);
            jap.append_child(pugi::xml_node_type::node_pcdata).set_value(buf.c_str());
            language.append_child(pugi::xml_node_type::node_pcdata).set_value("");
        } else {
            windowattr.set_value("used");
            language.append_child(pugi::xml_node_type::node_pcdata).set_value(message.c_str());
        }
    }
    doc.save(stream);
}
