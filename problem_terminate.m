function [n_coy, n_packs, maxFE, lb, ub] = problem_terminate(D)

        % Parameter settings:
        % ecosystem (population) size: n_coy * n_packs
        n_coy = 5;
        n_packs = 20;
    
        % number of function evaluations
        maxFE = 200; % 10000 * n
    
        % problem lower band 
        lowerBand = 0; % -100
        lb = ones(1, D) * lowerBand;
    
        % problem upper band
        upperBand = 1; % 100
        ub = ones(1, D) * upperBand;
end

