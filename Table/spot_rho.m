%    Fichier spot_rho.m
%           -----------------
%   Ce script affiche dans un fichier texte les valeurs suivant diff�rentes 
%   valeurs de rho fix� pour e*=e**=4 et e*=e**=3.
%

close all
clc

% Donn�es initiales
addpath ('model_functions');
addpath ('spot_sens_func');
addpath ('defined_functions');
addpath ('future_sens_func');

F_0_T = 100;
S_0 = 100;
alpha = 0.34;
sigma = 0.31;
dt = 7/360;


    
% Time : t value
time_ = 3/24;
T_maturity = 3/12;



% 4: VARIATION DES VALEURS DES MAJORANTS EN FONCTION DE L'ORDRE POUR e* =
% e** = 4
e_dot = 4; 
e_2dot = 4;

doc1 = fopen('Table/spot_rho.txt','w');

rho = 1;
for j=0:1:14
    
    fprintf(doc1,'\n\nMaturity : %f\n', T_maturity);
    fprintf(doc1,'Rho : %e\n', rho);
    fprintf(doc1,'Order : %i\n', order_l);

    fprintf(doc1,'Epsilon\t\t');
    fprintf(doc1,'Approx variations\t\t');
    fprintf(doc1,'Variations\t\t\t');
    fprintf(doc1,'Error\n');
      
    order_l = calc_Order_l2(alpha, sigma, time_, T_maturity, F_0_T, 'Spot', rho, e_dot, e_2dot);
    eps = -4;
    for i=0:1:16

        y = calc_spot_change2(F_0_T, alpha, sigma, time_, S_0, eps, order_l);  
                                   
        v = calc_spot_t(time_, alpha, sigma, eps,F_0_T) - S_0;
        
        h = y - v;

        fprintf(doc1,'%f\t',eps);
        fprintf(doc1,'%6.15f\t',y);
        fprintf(doc1,'%6.15f\t',v);
        fprintf(doc1,'%e\n',abs(h));
        
        eps = eps + 0.5; 

    end
    
    rho = rho/10;
end

fprintf(doc1,'\n_______________________________________\n');

% 4: VARIATION DES VALEURS DES MAJORANTS EN FONCTION DE L'ORDRE POUR e* =
% e** = 3
e_dot = 3; 
e_2dot = 3;

rho = 1;
for j=0:1:14
    
    fprintf(doc1,'\n\nMaturity : %f\n', T_maturity);
    fprintf(doc1,'Rho : %e\n', rho);
    fprintf(doc1,'Order : %i\n', order_l);

    fprintf(doc1,'Epsilon\t\t');
    fprintf(doc1,'Approx variations\t\t');
    fprintf(doc1,'Variations\t\t\t');
    fprintf(doc1,'Error\n');
      
    order_l = calc_Order_l2(alpha, sigma, time_, T_maturity, F_0_T, 'Spot', rho, e_dot, e_2dot);
    eps = -3;
    for i=0:1:12

        y = calc_spot_change2(F_0_T, alpha, sigma, time_, S_0, eps, order_l);  
                                   
        v = calc_spot_t(time_, alpha, sigma, eps,F_0_T) - S_0;
        
        h = y - v;

        fprintf(doc1,'%f\t',eps);
        fprintf(doc1,'%6.15f\t',y);
        fprintf(doc1,'%6.15f\t',v);
        fprintf(doc1,'%e\n',abs(h));
        
        eps = eps + 0.5; 

    end
    
    rho = rho/10;
end


fclose(doc1);  





