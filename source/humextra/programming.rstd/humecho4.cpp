#include "humdrum.h"
using namespace std;

int main(int argc, char** argv) {
   Options options(argc, argv);
   options.process();
   HumdrumFile hfile;
   int numinputs = options.getArgCount();
   for (int i=1; i<=numinputs || i==0; i++) {
      if (numinputs < 1) {
         hfile.read(cin); // read from standard input
      } else {
         hfile.read(options.getArg(i));
      }
      // do something with the Humdrum data here:
      cout << hfile;
   }
   return 0;
}
