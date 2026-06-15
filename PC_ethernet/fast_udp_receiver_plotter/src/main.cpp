#define NOMINMAX
#include "ConsoleUI.hpp"
#include "NpcapReceiver.hpp"
#include <iostream>
#include <stdexcept>

int main() {
    try {
        RxConfig cfg;
        int adapter_index = run_console_interface(cfg);
        receive_packets(adapter_index, cfg);
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "\nERROR: " << e.what() << "\n";
        return 1;
    }
}
