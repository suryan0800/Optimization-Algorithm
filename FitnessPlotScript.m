lst = ["F1"    "F2"    "F3"    "F4"    "F5"    ...
    "F7"    "F8"    "F9"    "F10"    ...
    "F12"    "F13"    "F14"    "F15"   ...
    "F16"    "F17"    "F18"    "F19"  ...
    "F21" "FM"];
fig1 = figure;
for i = 1:length(lst)
    scout_bee_number =30; % Number of search agents
    
    function_name=lst(i); % Name of the test function that can be from F1 to F19 and cec01 t0 cec10 (Table 1,2 in the paper)
    [dimensions,fitness,upper_bound, lower_bound] = Select_Functions(function_name);
    %dimensions = 2;
    max_iteration = 100;
    weightFactor = 0.0;  %equation 2 in the above paper.
    
    %Fitness Dependent Optimizer
    [best_fitness_value, best_scout_bee,FDO_curve] = FDO(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness, weightFactor);
    
    %Genetic Algorithm Optimization
    options_ga = optimoptions('ga','MaxGenerations',max_iteration*6,"PopulationSize",scout_bee_number,'PlotFcn','gaplotbestf');
    [x,fval,exitflag,output,population,scores] = ga(fitness,dimensions,[],[],[],[],lower_bound,upper_bound,[],options_ga);
    %Extract data from graph
    fig = gcf;
    dataObjs = findobj(fig,'-property','YData');
    y1_ga = dataObjs(2).YData;
    close(fig)
    %Dragonfly Optimization Algorithm
    [Best_score_da,Best_pos_da,DA_cg_curve] = DA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
    
    %Salp Swarm Optimization Algorithm
    [Best_score_salp,Best_pos_salp,SSA_cg_curve]=SSA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
    
    %plot Fitness Graph for all algos on same graph
    ax = subplot(4,5,i);
    plot(FDO_curve);
    hold(ax,"on");
    plot(ax,y1_ga);
    plot(ax,DA_cg_curve);
    plot(ax,SSA_cg_curve);
    legend(ax,"FDO","GA","DA","SSA");
    hold(ax,"off");
    title(ax,"Fitness Curve " + function_name);
    xlabel(ax,"Iteration");
    ylabel(ax,"Fitness");
    
end

