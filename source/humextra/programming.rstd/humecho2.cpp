#include "humdrum.h"
using namespace std;

int main(int argc, char** argv) {
   HumdrumFile hfile;
   if (argc > 1) { hfile.read(argv[1]); }
   else hfile.read(cin);
   for (int i=0; i<hfile.getNumLines(); i++) {
      cout << hfile[i] << endl;
   }
   return 0;
}
