#include "humdrum.h"
using namespace std;

int main(int argc, char** argv) {
   HumdrumFile hfile;
   if (argc > 1) { hfile.read(argv[1]); }
   else { hfile.read(cin); }
   for (int i=0; i<hfile.getNumLines(); i++) {
      std::cout << "\t" << hfile[i][0];
      for (int j=1; j<hfile[i].getFieldCount(); j++) {
         cout << "\t" << hfile[i][j] << endl;
      }
      std::cout << std::endl;
   }
   return 0;
}
