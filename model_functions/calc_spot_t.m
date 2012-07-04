function y = calc_spot_t(time_, alpha, sigma, epsilon_,F_0_T)
%% Calcul du prix spot � l'instant t
% Input : sigma (volatilit�), alpha, prix future observ� � l'instant t = 0


temp1 = (-1)*func_g_1(alpha,sigma,time_,time_);
temp2 = func_g_2(alpha,sigma,time_,time_)*epsilon_;
    
y = exp(temp1 + temp2)*F_0_T;


end