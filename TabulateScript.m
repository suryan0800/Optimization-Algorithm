lst = ["FM"    ...
       "F1"    "F2"    "F3"    "F4"    "F5"    ...
       "F6"    "F7"    "F8"    "F9"    "F10"    ...
       "F11"   "F12"    "F13"    "F14"    "F15"   ...
       "F16"    "F17"    "F18"    "F19"    "F20"  ... 
       "F21"    "F22"    "F23"  ...  
       "cec01"    "cec02"    "cec03"    "cec04"    "cec05"  ...
       "cec06"    "cec07"    "cec08"    "cec09"    "cec10"];
%lst = ["cec01"];  
%addAttachedFiles(gcp,{'C:\Program Files\MATLAB\R2020a\toolbox\globaloptim\'})
for ii  = 1:size(lst,2)
    %disp(i)
    
    i = lst(ii);
    %mat = [];
    mat = ones(30,4);
    for j = 1:30
        disp([i,j]);
        scout_bee_number = 30; % Number of search agents
        function_name = i; 

        [dimensions,fitness,upper_bound, lower_bound] = Select_Functions(function_name);
        max_iteration = 500; 
        weightFactor = 0.0;  %equation 2 in the above paper.
        [best_fitness_value, best_scout_bee,FDO_curve] = FDO(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness, weightFactor);
       
        %Genetic Algorithm Optimization

        options_ga = optimoptions('ga','MaxGenerations',max_iteration*6,"PopulationSize",scout_bee_number);

        [x,fval,exitflag,output,population,scores] = ga(fitness,dimensions,[],[],[],[],lower_bound,upper_bound,[],optoins_ga);
        %Dragonfly Optimization Algorithm


        [Best_score_da,Best_pos_da,DA_cg_curve] = DA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
        %Salp Swarm Optimization Algorithm

        %addpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA")  
        [Best_score_salp,Best_pos_salp,SSA_cg_curve]=SSA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
        %rmpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA")
        
        mat(j,:) = [best_fitness_value, fval, Best_score_da, Best_score_salp];
        
    end
    
    writematrix(mat,"Output2/"+i+".csv");
end