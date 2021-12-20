#include "Gmm.h"
#include "util.h"
#include <pugixml.hpp>

void GMM::FromFile(std::vector<std::string> &messages) {
    doc.load(stream);
    for (const auto & node : doc) {
        if (strcmp(node.name(), "body") == 0) {
            for (const auto &subnode : node.children()) {
                if (strcmp(subnode.name(), "row") == 0) {
                    for (const auto &child: node.children()) {
                        if (strcmp(child.name(), "language") == 0 &&
                            strcmp(child.attribute("name").value(), "English") == 0) {
                            messages.push_back(child.value());
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
    for (const auto &message : messages) {
        auto row = body.append_child("row");
        auto language = row.append_child("language");
        language.append_attribute("name").set_value("English");
        language.set_value(message.c_str());
    }
    doc.save(stream);
}
