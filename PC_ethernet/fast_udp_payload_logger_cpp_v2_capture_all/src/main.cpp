#define NOMINMAX
#include "ConsoleUI.hpp"
#include "NpcapLogger.hpp"

#include <iostream>
#include <stdexcept>

int main() {
    try {
        LoggerConfig cfg;
        int adapter_index = run_console_ui(cfg);
        run_logger(adapter_index, cfg);
        return 0;
    }
    catch (const std::exception& e) {
        std::cerr << "\nERROR: " << e.what() << "\n";
        return 1;
    }
}
