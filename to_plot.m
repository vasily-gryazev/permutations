%% SP7 Chevron
clear all
addpath('output')
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

load('SMC006_Chevron_Jet/SP7/SP7_Chevron_P_dt2_XYZ')
Dj = 0.0508/4; 
x  = squeeze(xx_inp(:,1:21,:));
y  = squeeze(yy_inp(:,1:21,:));
z  = squeeze(zz_inp(:,1:21,:));

name1             = 'Tau_NEW_Prob_Out_SP7_Chevron_P_dt2_set_set1';
name2             = 'Tau_NEW_Prob_Out_SP7_Chevron_P_dt2_set_set2';
name3             = 'Tau_NEW_Prob_Out_SP7_Chevron_P_dt2_set_set3';
name4             = 'Tau_NEW_Prob_Out_SP7_Chevron_P_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Tauout; clear Tauout
load(name2);      Chi(:,:,:,33:64)  = Tauout; clear Tauout 
load(name3);      Chi(:,:,:,65:96)  = Tauout; clear Tauout
load(name4);      Chi(:,:,:,97:128) = Tauout; clear Tauout
%%

ixlocg = [6:1:11];

figure
for i = 1:1:6

subplot(1,6,i)

ix = ixlocg(i);  xg = x(:,1,1)/Dj; [Xval,xloc]=min(abs(xg-ix));

Yg = squeeze(y(xloc,:,:));
Zg = squeeze(z(xloc,:,:));

Chig = squeeze(Chi(1,xloc,:,:));
surf(Yg/Dj,Zg/Dj,Chig);
% caxis([0 100]); 
view(0,90); shading interp;  colormap(mycolormap); box on; grid off
pbaspect([1 1 1])
axis tight

title(sprintf('x/Dj= %1.1f', ixlocg(i)))
caxis([0 25])
colorbar
end


%% SP7 Round
clear all
addpath('output')
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

load('SMC000_Round_Jet/SP7_Round_P_dt2_XYZ')
Dj = 0.0508/4; 
x  = squeeze(xx_inp(:,1:21,:));
y  = squeeze(yy_inp(:,1:21,:));
z = squeeze(zz_inp(:,1:21,:));

name1             = 'NEW_Prob_Out_SP7_Round_P_dt2_set_set1';
name2             = 'NEW_Prob_Out_SP7_Round_P_dt2_set_set2';
name3             = 'NEW_Prob_Out_SP7_Round_P_dt2_set_set3';
name4             = 'NEW_Prob_Out_SP7_Round_P_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout

save("Out_Res/SP7_Round.m", "Dj", "Chi", "x","y","z","mycolormap")

%% SP7 Chevron
clear all
addpath('output')
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

load('SMC006_Chevron_Jet/SP7/SP7_Chevron_P_dt2_XYZ')
Dj = 0.0508/4; 
x  = squeeze(xx_inp(:,1:21,:));
y  = squeeze(yy_inp(:,1:21,:));
z  = squeeze(zz_inp(:,1:21,:));

name1             = 'NEW_Prob_Out_SP7_Chevron_P_dt2_set_set1';
name2             = 'NEW_Prob_Out_SP7_Chevron_P_dt2_set_set2';
name3             = 'NEW_Prob_Out_SP7_Chevron_P_dt2_set_set3';
name4             = 'NEW_Prob_Out_SP7_Chevron_P_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout
%% SP3 Round

clear all
addpath('output')
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});
Dj = 0.0508/4; 
m1  = matfile('SMC000_Round_Jet/SP3/dt2/SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set1');
m2  = matfile('SMC000_Round_Jet/SP3/dt2/SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set2');
m3  = matfile('SMC000_Round_Jet/SP3/dt2/SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set3');
m4  = matfile('SMC000_Round_Jet/SP3/dt2/SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set4');

xx_inp(:,:,1:32)   = m1.xx_inp1;
xx_inp(:,:,33:64)  = m2.xx_inp2;
xx_inp(:,:,65:96)  = m3.xx_inp3;
xx_inp(:,:,97:128) = m4.xx_inp4;

yy_inp(:,:,1:32)   = m1.yy_inp1;
yy_inp(:,:,33:64)  = m2.yy_inp2;
yy_inp(:,:,65:96)  = m3.yy_inp3;
yy_inp(:,:,97:128) = m4.yy_inp4;

zz_inp(:,:,1:32)   = m1.zz_inp1;
zz_inp(:,:,33:64)  = m2.zz_inp2;
zz_inp(:,:,65:96)  = m3.zz_inp3;
zz_inp(:,:,97:128) = m4.zz_inp4;

x  = squeeze(xx_inp(:,1:21,:));
y  = squeeze(yy_inp(:,1:21,:));
z  = squeeze(zz_inp(:,1:21,:));

name1             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set1';
name2             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set2';
name3             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set3';
name4             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout
%% SP3 Chvron

clear all
addpath('output')
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});
Dj = 0.0508/4; 
m1  = matfile('SMC006_Chevron_Jet/SP3/SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set1');
m2  = matfile('SMC006_Chevron_Jet/SP3/SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set2');
m3  = matfile('SMC006_Chevron_Jet/SP3/SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set3');
m4  = matfile('SMC006_Chevron_Jet/SP3/SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set4');

xx_inp(:,:,1:32)   = m1.xx_inp1;
xx_inp(:,:,33:64)  = m2.xx_inp2;
xx_inp(:,:,65:96)  = m3.xx_inp3;
xx_inp(:,:,97:128) = m4.xx_inp4;

yy_inp(:,:,1:32)   = m1.yy_inp1;
yy_inp(:,:,33:64)  = m2.yy_inp2;
yy_inp(:,:,65:96)  = m3.yy_inp3;
yy_inp(:,:,97:128) = m4.yy_inp4;

zz_inp(:,:,1:32)   = m1.zz_inp1;
zz_inp(:,:,33:64)  = m2.zz_inp2;
zz_inp(:,:,65:96)  = m3.zz_inp3;
zz_inp(:,:,97:128) = m4.zz_inp4;

x  = squeeze(xx_inp(:,1:21,:));
y  = squeeze(yy_inp(:,1:21,:));
z  = squeeze(zz_inp(:,1:21,:));

name1             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set1';
name2             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set2';
name3             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set3';
name4             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout
%%

ixlocg = [1:2:11];

figure
for i = 1:6

subplot(1,6,i)

ix = ixlocg(i);  xg = x(:,1,1)/Dj; [Xval,xloc]=min(abs(xg-ix));

Yg = squeeze(y(xloc,:,:));
Zg = squeeze(z(xloc,:,:));

Chig = squeeze(Chi(1,xloc,:,:));
surf(Yg/Dj,Zg/Dj,Chig);
caxis([0 100]); view(0,90); shading interp;  colormap(mycolormap); box on; grid off
pbaspect([1 1 1])
axis tight

title(sprintf('x/Dj= %1.1f', ixlocg(i)))

end

%% Find a point
Chig = squeeze(Chi(1,1,:,:));
%%
surf(Yg/Dj,Zg/Dj,Chig);shading interp;  colormap(mycolormap); box on; grid off; view(0,90);


pbaspect([1 1 1])
%% Plot along theta

ix = 0.5;  xg = x(:,1,1)/Dj; [Xval,xloc]=min(abs(xg-ix));
iy = 1.5;  yg = y(1,:,1)/Dj; [Yval,yloc]=min(abs(yg-iy));

Ym = squeeze(y(xloc,yloc,:));
Zm = squeeze(z(xloc,yloc,:));
Chim = squeeze(Chi(1,50,yloc,:));
figure
plot(Chim, 'k-x');
yline(mean(Chim), 'r--', 'linewidth',3)

title(sprintf('x/Dj = %1.1f, y/Dj = %1.1f', ix, iy))
axis tight
box on
grid minor
% legend('\chi^2_{prob}', 'Mean', 'NumColumns',2, 'Location', 'southoutside')
ylim([0 100])
set(gcf, 'Position', [200, 300, 700, 250]); 
set(gca,'FontSize', 13); 
ylabel('\chi^2_p'); xlabel('\theta_i')
n = 10;
saveas(gcf,sprintf('figures/SP_%d.png',n));


%% ==============================================================================================================
%  ==============================================================================================================_

%%


%%
clear all
addpath('output')
Dj = 0.0508; 
m  = matfile('SMC000_Round_Jet/SP3/dt2/SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set1');
x = squeeze(m.xx_inp1(:,:,1));
y = squeeze(m.yy_inp1(:,:,1));

    


name1             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set1';
name2             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set2';
name3             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set3';
name4             = 'NEW_Prob_Out_SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout
%%
clear all
addpath('output')
Dj = 0.0508; 
m  = matfile('SMC006_Chevron_Jet/SP3/SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set1');
x = squeeze(m.xx_inp1(:,:,1));
y = squeeze(m.yy_inp1(:,:,1));
    

name1             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set1';
name2             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set2';
name3             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set3';
name4             = 'NEW_Prob_Out_SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set_set4';
load(name1);      Chi(:,:,:,1:32)   = Chiout; clear Chiout 
load(name2);      Chi(:,:,:,33:64)  = Chiout; clear Chiout 
load(name3);      Chi(:,:,:,65:96)  = Chiout; clear Chiout
load(name4);      Chi(:,:,:,97:128) = Chiout; clear Chiout


% name        = 'SMC006_Isolated_Cylinder3D_ReducedSet_Pressure_SP3_dt2_set';


%%

mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

n = 1; 
Z = mean(Chi,4); 
Z = squeeze(Z(1,:,:));

figure
% surf(squeeze(y(:,:,1))/Dj, squeeze(x(:,:,1))/Dj, Z);
surf(Z);
view(90,270);
% caxis([0 100])

grid off
% ylim([0 13.5])
% xlim([0 2.5])
caxis([0 100])
set(gca,'layer','top');
shading interp; 
colormap(mycolormap);
colorbar
box on
set(gcf, 'Position', [200, 300, 700, 250]); 
set(gca,'FontSize', 13); 
ylabel('x/Dj'); xlabel('r/Dj')
saveas(gcf,sprintf('figures/SP_%d.png',n));


%%
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

n = 1; 

Z = squeeze(Z(1,:,:));
% D = squeeze(Chi(:,20,:,:));
figure
pcolor(Z)


% view(90,270);
caxis([0 100])



set(gca,'layer','top');
shading interp; 
colormap(mycolormap);
colorbar
box on
set(gcf, 'Position', [200, 300, 700, 250]); 
set(gca,'FontSize', 13); 
ylabel('x/Dj'); xlabel('r/Dj')
saveas(gcf,sprintf('figures/SP_%d.png',n));



%%
%%
mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

% load('Wout/SP3_Wout.mat')
load('Wout/SP7_Wout.mat')


h = figure;
for ti = 9
% pcolor(Xw/Djw, Rw/Djw, squeeze(Wout(ti,:,:)))

contour(Xw/Djw, Rw/Djw, squeeze(Wout(ti,:,:)))
view(0,90)

xlim([0 13.5])
ylim([0 2.5])
set(gca,'layer','top');
shading interp; 
colormap(mycolormap);
colorbar
box on
set(gcf, 'Position', [200, 300, 700, 250]); 
set(gca,'FontSize', 13); 
xlabel('x/Dj'); ylabel('r/Dj')
set(gcf,'color','w');

% title(sprintf('St = %1.2f', Stg(ti)))
% drawnow
% 
% pause(0.2)
% frame = getframe(h);
% im = frame2im(frame);
% [imind,cm] = rgb2ind(im,256);
% if ti == 1
%     imwrite(imind,cm,'Fig','gif', 'Loopcount',inf);
% else
%     imwrite(imind,cm,'Fig','gif','WriteMode','append');
% end

end



n = 3;
saveas(gcf,sprintf('figures/W_%d.png',n));
