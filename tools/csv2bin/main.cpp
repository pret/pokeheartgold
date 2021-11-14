#include "Options.h"

int main(int argc, char ** argv) {
    try {
        return Options(argc, argv).main();
    } catch (argument_error const &e ) {
        Options::short_usage(std::cerr);
        std::cerr << "csv2bin error: " << e.what() << std::endl;
        return 1;
    } catch (std::exception const &e) {
        std::cerr << "csv2bin error: " << e.what() << std::endl;
        return 1;
    }
}
