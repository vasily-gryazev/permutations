%% Main wuth Probs 
% find SP7 Chevron only
% 
addpath('functions')

clear all; clc
% clearvars -except P_inp U_raw

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
setg        = [1:4]; 
Ns          = 1;       % Sur
maxiter     = [1:Ns];  % Sur
c           = 1;       % Sur  

for Iset = 1:4

    set = setg(Iset);
    
    load(sprintf('%s/%s%d', inputfolder, name, set))
    fprintf('\n\nLoaded %s %d\n', name, set);
    
    P_inp = eval(sprintf('P_inp%d', set));
    U_raw = permute(P_inp,[4 1 2 3]); 
    disp('\nPermute done\n')

        tic
        for xloc = 1:100
            for rloc = 1:21
                for theta = 1:32
                   
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
            
                        for j = 1:100
                            RefUdata = randi(factorial(ls),length(izu),1);
                            RefSdata = randi(factorial(ls),length(izu),1);
                        
                            [Chig(j)] = chi2test(RefUdata, RefSdata);
                        end
                        
                        % Chi2 test
                        if chistat < min(Chig)
                           Chiout(:,xloc,rloc,theta) = 0;
                        elseif chistat > max(Chig)
                            Chiout(:,xloc,rloc,theta) = 100;
                        else
                        [Chi_Pr, chiPDF, chiXpdf] = FindArea(chistat, Chig);

%                       figure; plot(chiXpdf, chiPDF, 'o-'); hold on; xline(chistat)

                        Chi_PrR = round(Chi_Pr);
                        Chi_Prval = - (Chi_PrR(2) - 100); 
                        Chiout(:,xloc,rloc,theta) = Chi_Prval;   
                        end

                        Chiout_stat(:,xloc,rloc,theta) = chistat; 
                       
                        clear izs izu chistat ksstat s u tau KS_Prval Chi_Prval KS_Pr Chi_Pr
                        
                end % theta
            end % rloc
            toc
            tit = sprintf('xloc = %d', xloc'); disp(tit)
        end % xoc
        fprintf('\n Saved %s set %d \n', name, set);
        save(sprintf('%s/NEW_Prob_Out_%s_set%d', outfolder, name, set), "Chiout_stat", "Chiout")
       
 clear P_inp U_raw
end

