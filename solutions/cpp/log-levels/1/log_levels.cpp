#include <string>

namespace log_line {
    std::string message(std::string line) {
        int first_space = line.find(":");
        return line.substr(first_space + 2, line.length());
    }

    std::string log_level(std::string line) {
        return line.substr(
            line.find("[") + 1,
            line.find("]") - 1
        );
    }

    std::string reformat(std::string line) {
        return message(line) + " (" + log_level(line) + ")";
    }
}
