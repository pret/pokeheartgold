#include "Options.h"

int main(int argc, char ** argv) {
#ifdef NDEBUG
    try {
#endif
        return Options(argc, argv).main();
#ifdef NDEBUG
    } catch (std::bad_alloc const &e ) {
        std::cerr << "csv2bin fatal error: bad alloc: " << e.what() << std::endl;
        return 1;
    } catch (argument_error const &e ) {
        Options::short_usage(std::cerr);
        std::cerr << "csv2bin argument error: " << e.what() << std::endl;
        return 1;
    } catch (std::exception const &e) {
        std::cerr << "csv2bin error: " << e.what() << std::endl;
        return 1;
    }
#endif
}
