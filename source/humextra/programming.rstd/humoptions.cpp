#include "humdrum.h"
using namespace std;

int main(int argc, char** argv) {
   Options opts;
   opts.define("M|no-measures:b", "remove measures");
   opts.define("C|no-comments:b", "remove comments");
   opts.define("I|no-interpretations:b", "remove interpretations");
   opts.process(argc, argv);
   int measuresQ = !opts.getBoolean("no-measures");
   int commentsQ = !opts.getBoolean("no-comments");
   int interpQ = !opts.getBoolean("no-interpretations");
   HumdrumFile hfile(opts.getArg(1));
   for (int i=0; i<hfile.getNumLines(); i++) {
      if (hfile[i].isMeasure() && !measureQ) continue;
      if (hfile[i].isComment() && !commentQ) continue;
      if (hfile[i].isInterpretation() && !interpQ) continue;
      cout << hfile[i] << endl;
   }
   return 0;
}
