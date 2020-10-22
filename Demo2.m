%Fitness Dependent Optimizer 

%[dimensions,fitness,upper_bound, lower_bound] = Select_Functions("FM");

scout_bee_number =30; % Number of search agents

function_name='F14'; % Name of the test function that can be from F1 to F19 and cec01 t0 cec10 (Table 1,2 in the paper)
[dimensions,fitness,upper_bound, lower_bound] = Select_Functions(function_name);
%dimensions = 2;
max_iteration = 500; 

weightFactor = 0.0;  %equation 2 in the above paper.


[best_fitness_value, best_scout_bee,FDO_curve] = FDO(function_name, max_iteration, scout_bee_number, weightFactor);
%best_scout_bee.xs
fprintf("FDO Fitness %f \n",best_fitness_value);
%plot(FDO_curve);

%Genetic Algorithm Optimization
%scout_bee_number =30; % Number of search agents
%max_iteration = 500; 
optimoptions('ga','MaxGenerations',max_iteration*6);
optimoptions('ga',"PopulationSize",scout_bee_number);
%[dimensions,fitness,upper_bound, lower_bound] = Select_Functions("FM");


[x,fval,exitflag,output,population,scores] = ga(fitness,dimensions,[],[],[],[],lower_bound,upper_bound);
%plotFM(x);
fprintf("Genetic Fitness %f \n",fval);
%plot(scores)
%Dragonfly Optimization Algorithm

%scout_bee_number =30; % Number of search agents
%max_iteration = 500; 
%[dimensions,fitness,upper_bound, lower_bound] = Select_Functions("FM");
[Best_score_da,Best_pos_da,DA_cg_curve] = DA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
%plotFM(Best_pos);
fprintf("Dragonfly Fitness %f \n",Best_score_da);

%plot(cg_curve)
%Salp Swarm Optimization Algorithm

%scout_bee_number =30; % Number of search agents
%max_iteration = 500; 
addpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA")

%[dimensions,fitness,upper_bound, lower_bound] = Select_Functions("FM");

[Best_score_salp,Best_pos_salp,SSA_cg_curve]=SSA(scout_bee_number,max_iteration,lower_bound,upper_bound,dimensions,fitness);
fprintf("Salp Swarm Fitness %f \n",Best_score_salp);
%plot(SSA_cg_curve)
rmpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA")
%func_plot("F13");
%plotFM(Best_pos)

figure
subplot(1,2,1);
%Plot the fitness function
addpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA");
func_plot(function_name);
rmpath("E:\SASTRA\7th Sem\Fitness Dependent Optimizer Mini-Project\Work\SSA");

%plot Fitness Graph for all algos on same graph
subplot(1,2,2);
plot(FDO_curve);
hold on;
plot(scores);
plot(DA_cg_curve);
plot(SSA_cg_curve);
legend("FDO","GA","DA","SSA");
hold off;

