function y = calc_sens_spot_0(time_, alpha, sigma, F_0_T, S_0)
% Input : sigma (volatilit�), alpha, prix future et spot observ� � l'instant t = 0

temp1 = (-1)*func_g_1(alpha,sigma,time_,time_);

y = exp(temp1)*F_0_T - S_0;

end
