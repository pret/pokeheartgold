#include "Gmm.h"
#include "util.h"
#include <pugixml.hpp>
#include <iostream>

void GMM::FromFile(std::vector<std::string> &messages) {
    pugi::xml_parse_result result = doc.load(stream);
    if (!result) {
        throw std::runtime_error(result.description());
    }
    for (const auto & node : doc) {
        if (strcmp(node.name(), "body") == 0) {
            for (const auto &subnode : node.children()) {
                if (strcmp(subnode.name(), "row") == 0) {
                    for (const auto &child: node.children()) {
                        if (strcmp(child.name(), "language") == 0 &&
                            strcmp(child.attribute("name").value(), "English") == 0) {
                            std::string message;
                            for (auto line : child) {
                                if (child.type() == pugi::xml_node_type::node_pcdata) {
                                    message += child.value();
                                }
                            }
                            messages.push_back(message);
                            break;
                        }
                    }
                }
            }
            break;
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
        auto language = row.append_child("language");
        if (language.empty()) {
            throw std::runtime_error("failed to create gmm language node");
        }
        language.append_attribute("name").set_value("English");
        language.append_child(pugi::xml_node_type::node_pcdata).set_value(message.c_str());
    }
    doc.save(stream);
}
