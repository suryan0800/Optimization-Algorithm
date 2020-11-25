%ScatterPlot for FDO
lst = ["F1"    "F2"    "F3"    "F4"    "F5"    ...
       "F7"    "F8"    "F9"    "F10"    ...
       "F12"    "F13"    "F14"   ...
       "F16"    "F17"    "F18"];
   
figure
for i = 1:length(lst)
    scout_bee_number =30; % Number of search agents
    function_name = lst(i);
    disp(function_name);
    [dimensions,fitness,upper_bound, lower_bound] = Select_Functions(function_name);
    dimensions = 2;
    max_iteration = 100; 
    weightFactor = 0.0; 
    [best_fitness_value, best_scout_bee,FDO_curve,scatter_fdo] = FDO(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness, weightFactor);
    subplot(3,5,i);
    scatter(scatter_fdo(:,1),scatter_fdo(:,2));
    title("Convergence of Bees " + function_name);
    xlabel("1D");
    ylabel("2D");
end