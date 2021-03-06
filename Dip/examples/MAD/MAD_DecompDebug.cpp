//===========================================================================//
// This file is part of the Decomp Solver Framework.                         //
//                                                                           //
// Decomp is distributed under the Common Public License as part of the      //
// COIN-OR repository (http://www.coin-or.org).                              //
//                                                                           //
// Authors: Matthew Galati, SAS Institute Inc. (matthew.galati@sas.com)      //
//          Ted Ralphs, Lehigh University (ted@lehigh.edu)                   //
//          Jiadong Wang, Lehigh University (jiw408@lehigh.edu)              //
//                                                                           //
// Copyright (C) 2002-2015, Lehigh University, Matthew Galati, and Ted Ralphs//
// All Rights Reserved.                                                      //
//===========================================================================//

#include "MAD_DecompApp.h"

// --------------------------------------------------------------------- //
void MAD_DecompApp::printRowMarks(const int * rowInd,
                                  const int   rowLen) const{

   int        i;
   const char mark = '*';
   string     str(m_instance.getNumCols(),' ');
   for(i = 0; i < rowLen; i++){
      str[rowInd[i]] = mark;
   }
   (*m_osLog) << str << endl;
}
