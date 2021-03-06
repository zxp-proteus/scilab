// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Pierre-Aime Agnel
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Unit test for function implicitplot -->
//
// <-- Short Description -->
//
// <-- TEST WITH GRAPHIC -->

// Error checking
//x_range and y_range are constant matrices
err_msg = msprintf(gettext("%s: Wrong type for input argument #%d: Real vector expected.\n"), "implicitplot", 2);
assert_checkerror("implicitplot(""does not work"", ""not_a_real_matrix"")", err_msg);

err_msg = msprintf(gettext("%s: Wrong type for input argument #%d: Real vector expected.\n"), "implicitplot", 3);
assert_checkerror("implicitplot(""does not work"", [0 1], ""not_a_real_matrix"")", err_msg);

//x_range and y_range are vectors
err_msg = msprintf(gettext("%s: Wrong size for input argument #%d: Real vector expected.\n"), "implicitplot", 2);
assert_checkerror("implicitplot(""does not work"", [0 1; 0 1], [0 1])", err_msg);

err_msg = msprintf(gettext("%s: Wrong size for input argument #%d: Real vector expected.\n"), "implicitplot", 3);
assert_checkerror("implicitplot(""does not work"", [0 1], [0 1; 0 1])", err_msg);

//x_range and y_range are real
err_msg = msprintf(gettext("%s: Wrong value for input argument #%d: Real value expected.\n"), "implicitplot", 2);
assert_checkerror("implicitplot(""does not work"", [0, %i], [0, %i])", err_msg);

err_msg = msprintf(gettext("%s: Wrong value for input argument #%d: Real value expected.\n"), "implicitplot", 3);
assert_checkerror("implicitplot(""does not work"", [0 1], [0, %i])", err_msg);

// Input argument 1 must be text or function or compiled function
err_msg = msprintf(gettext("%s: Wrong type for input argument #%d: Real matrix or String or Scilab function expected.\n"), "implicitplot", 1);
assert_checkerror("implicitplot(%s, [0 1], [0 1])", err_msg);

// Function in input argument 1 must cross a zero
err_msg = msprintf(gettext("%s: Function evaluation in selected range does not cross any zeros.\n"), "implicitplot");
assert_checkerror("implicitplot(""10"", [0 1], [0 1])", err_msg);

// if fun is real, must be of size length(x) * length(y);
err_msg = msprintf(gettext("%s: Wrong size for input argument #%d: %d-by-%d matrix expected.\n"), "implicitplot", 1, 3, 3);
assert_checkerror("implicitplot([0 1 -1 ;-1 1 -1], 1:3, 1:3)", err_msg);

// if fun is not real (string or scilab function) must be of size 1
err_msg = msprintf(gettext("%s: Wrong size for input argument #%d: Scalar string expected.\n"), "implicitplot", 1);
assert_checkerror("implicitplot([""test"", ""fail""], 1:3, 1:3)", err_msg);

// Nominal behaviour
function result = fun(x, y)
    result = 3 * x^2 * exp(x) - x * y^2 +  exp(y) / (y^2 + 1) -1
endfunction

x_range = -1:0.01:1;
y_range = -10:0.01:10;

implicitplot(fun, x_range, y_range, "r--");

a = gca();
// This plot is a compound of two polylines
data1 = a.children(1).children(1).data;
data2 = a.children(1).children(2).data;

for i = 1:size(data1, "r")
    // Check polyline is sufficiently close to 0
    assert_checktrue(abs(fun(data1(i, 1), data1(i, 2))) < 0.01);
end

for i = 1:size(data2, "r")
    // Check polyline is sufficiently close to 0
    assert_checktrue(abs(fun(data2(i, 1), data2(i, 2))) < 0.01);
end
