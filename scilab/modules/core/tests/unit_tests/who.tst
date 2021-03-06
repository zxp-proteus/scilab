// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

//who

a    = 33;
bbb  = -1;
vars = who("get");
assert_checktrue(find(vars == "bbb") <> []);
assert_checktrue(find(vars == "a") <> []);
