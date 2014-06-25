#include "humdrum.h"
using namespace std;

int main(int argc, char** argv) {
   HumdrumFile hfile(argv[1]);
   for (int i=0; i<hfile.getNumLines(); i++) {
      if (!(hfile[i].isData() || hfile[i].isMeasure())) continue;
      if (hfile[i].isNull()) continue;
      cout << hfile[i] << endl;
   }
   return 0;
}
