//exec("bug546.sci")


a=int8(ones(10,10))>2;

b = [ 	%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ; ...
%F  %F  %F  %F  %F  %F  %F  %F  %F  %F ]

if a == b then

    affich_result(%T,546);

else
    affich_result(%F,546);

end;
