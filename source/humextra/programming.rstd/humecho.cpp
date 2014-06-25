#include "humdrum.h"
int main(int argc, char** argv) {
   HumdrumFile hfile;
   if (argc > 1) hfile.read(argv[1]);
   else hfile.read(std::cin);
   std::cout << hfile;
   return 0;
}
