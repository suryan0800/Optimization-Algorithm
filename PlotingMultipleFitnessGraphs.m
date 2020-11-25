lst = ["F1"    "F2"    "F3"    "F4"    "F5"    ...
       "F7"    "F8"    "F9"    "F10"    ...
       "F12"    "F13"    "F14"    "F15"   ...
       "F16"    "F17"    "F18"    "F19"  ... 
       "F21" ];

figure
for i = 1:size(lst,2)
    subplot(4,5,i);
    function_name = lst(i);
    disp(function_name);
    %Plot the fitness function
    %addpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA");
    func_plot(function_name);
    title("Function Plot (for 2D) " + function_name );
    xlabel("1D");
    ylabel("2D");
    zlabel("Fitness");
    %rmpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA");
end

subplot(4,5,19);
orig = [1.0,5.0,1.5,4.8,2.0,4.9];
plotFM(orig);
title("Frequency Modulated Wave");
xlabel("Time");
ylabel("FM function");