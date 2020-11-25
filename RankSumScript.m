cols = 4;
lst = ["FM"    ...
       "F1"    "F2"    "F3"    "F4"    "F5"    ...
       "F6"    "F7"    "F8"    "F9"    "F10"    ...
       "F11"   "F12"    "F13"    "F14"    "F15"   ...
       "F16"    "F17"    "F18"    "F19"    "F20"  ... 
       "F21"    "F22"    "F23"  ...  
       "cec01"    "cec02"    "cec03"    "cec04"    "cec05"  ...
       "cec06"    "cec07"    "cec08"    "cec09"    "cec10"];
funcs = ["FDO","GA","DA","SSA"];   
nfuncs = length(lst);


tab = zeros([nfuncs,3]);

for i = 1:nfuncs
    name = lst(i);
    disp(name);
    mat = readmatrix("Output/" + name + ".csv");
    for j = 2:cols
       tab(i,j-1) = ranksum(mat(:,1),mat(:,j));
    end
end

Function = lst';
FDOvGA = tab(:,1);
FDOvDA = tab(:,2);
FDOvSSA = tab(:,3);

T = table(Function,FDOvGA,FDOvDA,FDOvSSA);
writetable(T,"Output/RankSum.xlsx");


