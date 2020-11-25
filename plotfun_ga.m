function [state,options,optchanged] = plotfun_ga(options,state,flag)
    global xx;
    xx(end+1) = min(state.Score);
    optchanged = false;
end