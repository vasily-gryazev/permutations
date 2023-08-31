%% Main wuth Probs Jube 2023
addpath('functions')

% clear all; clc
clearvars -except P_inp U_raw

% ================================================================================ %
%                                    SP7 Round
% name        = 'SP7_Round_P_dt2_set';
% inputfolder = 'SMC000_Round_Jet';
%                                    SP3 Round
% name        = 'SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set';
% inputfolder = 'SMC000_Round_Jet/SP3/dt2';
% 
%                                   SP3 Chevron
% name        = 'SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set';
% inputfolder = 'SMC006_Chevron_Jet/SP3';
%                                    SP7 Chevron
name        = 'SP7_Chevron_P_dt2_set';
inputfolder = 'SMC006_Chevron_Jet/SP7';
% ================================================================================ %

outfolder   = 'output';
ls           = 5;
setg        = [1:1]; 
Ns          = 1000;       % Sur
maxiter     = [1:Ns];  % Sur
c           = 1;       % Sur  

for Iset = 1:1

    set = setg(Iset);
    
%     load(sprintf('%s/%s%d', inputfolder, name, set))
%     fprintf('\n\nLoaded %s %d\n', name, set);
%     
%     P_inp = eval(sprintf('P_inp%d', set));
%     U_raw = permute(P_inp,[4 1 2 3]); 
%     disp('\nPermute done\n')

        tic
        for xloc = 10:10
            for rloc = 19:19
                for theta = 27:27
                   
                        u = double(U_raw(:,xloc,rloc,theta));               % real data
                        [izu tau] = FindWords(u);
                                               
                        for sur = 1:Ns
                            s(:,sur) = IAAFT(u,c,maxiter(sur));      
                            [izs(:,sur) tau] = FindWords(s(:,sur), tau);
                            Taug(:,sur) = tau;
                        end
                        
                        for i = 1:Ns
                            [chistat(i)] = chi2test(izu, izs(:,i));
                        end
            
                        for j = 1:Ns
                            RefUdata = randi(factorial(ls),length(izu),1);
                            RefSdata = randi(factorial(ls),length(izu),1);
                        
                            [Chig(j)] = chi2test(RefUdata, RefSdata);
                        end
                        
                        return

                        % Chi2 test
                        if chistat < min(Chig)
                           Chiout(:,xloc,rloc,theta) = 0;
                        elseif chistat > max(Chig)
                            Chiout(:,xloc,rloc,theta) = 100;
                        else
                        [Chi_Pr, chiPDF, chiXpdf] = FindArea(chistat, Chig);

%                                  figure; plot(chiXpdf, chiPDF, 'o-'); hold on; xline(chistat)

                        Chi_PrR = round(Chi_Pr);
                        Chi_Prval = - (Chi_PrR(2) - 100); 
                        Chiout(:,xloc,rloc,theta) = Chi_Prval;   
                        end

                        Chiout_stat(:,xloc,rloc,theta) = chistat; 
                       
%                         clear izs izu chistat ksstat s u tau KS_Prval Chi_Prval KS_Pr Chi_Pr
                        
                end % theta
            end % rloc
            toc
            tit = sprintf('xloc = %d', xloc'); disp(tit)
        end % xoc
%         fprintf('\n Saved %s set %d \n', name, set);
%         save(sprintf('%s/NEW_Prob_Out_%s_set%d', outfolder, name, set), "Chiout_stat", "Chiout")
       
%  clear P_inp U_raw
end
%%
figure
[PDF_s, Xpdf_s] = ksdensity(chistat); % data vs surrogate
plot(Xpdf_s, PDF_s, 'ro-')
% A = trapz(Xpdf, PDF);

% n = 1; saveas(gcf,sprintf('figures/Sur_Prob_n%d.png',n));
%
hold on
[PDF_r, Xpdf_r] = ksdensity(Chig); % Ransom data
plot(Xpdf_r, PDF_r, 'bo-')
% A = trapz(Xpdf, PDF);
legend('Sur', 'Rand')
n = 1; saveas(gcf,sprintf('figures/Rand_Prob_n%d.png',n));
%%
[chichi] = chi2test(chistat, Chig)
% [chichi] = chi2test(PDF_r, PDF_s)
%%
% to plot Prb and Area 
f = figure;
plot(chiXpdf, chiPDF, 'ko-'); hold on; xline(chistat)
title(sprintf('P = %d %%', Chi_Prval))
f.Position = [100 100 540 300];
n = 1;

saveas(gcf,sprintf('figures/SP_n%d.png',n));
