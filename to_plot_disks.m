%% To paper 
load('SMC000_Isolated_Cylinder3D_ReducedSet_Pressure_SP7')
%% plot of instantaneous fluctuating pressure
P_xrt_theta1   = squeeze(P_inp(:,:,1,:));
x              = squeeze(xx_inp(:,:,1)); 
r              = squeeze(yy_inp(:,:,1)); 
Dj             = 0.0169;
P_xrt_theta64  = squeeze(P_inp(:,:,64,:));
x64            = squeeze(xx_inp(:,:,64)); 
r64            = squeeze(yy_inp(:,:,64)); 

%%
for ti = 100:100
    pcolor(x/Dj,r/Dj,P_xrt_theta1(:,:,ti) - mean(P_xrt_theta1(:,:,ti))); hold on
    pcolor(x64/Dj,r64/Dj,P_xrt_theta64(:,:,ti) - mean(P_xrt_theta64(:,:,ti)));
   
    %drawnow; pause(0.01);
    
    view(0,90); shading interp; colormap jet; 
    set(gca,'FontSize', 13); 
    set(gca,'layer','top'); 
    box on; 
    set(gcf, 'Position', [10, 30, 950, 300]);
    xlim([0.1 10])
    ylim([-2 2])
    xlabel('x/D_j')
    ylabel('r/D_j')
    caxis([-5e3 5e3])
%     colormap(CustomColormap)
    colorbar('Ticks',[-5*10^3, 0,  5e3], 'TickLabels',{'-5\cdot10^3','0','-5\cdot10^3'})
end
% saveas(gcf,'Flow.png');

%%
dt= mean(diff(t_inp));
dx= mean(diff(squeeze(xx_inp(:,1,1))))
dr= mean(diff(squeeze(yy_inp(1,:,1))))
%% Plot Disks
xg = [10 20 40 50];
xg = 40;


P_rtheta = squeeze(P_inp(xg,:,:,1));
r            = squeeze(yy_inp(xg,:,:)); 
z            = squeeze(zz_inp(xg,:,:)); 

pcolor(z/Dj,r/Dj,P_rtheta-mean(P_rtheta))
view(0,90);
xlim([-1.5 1.5]); ylim([-1.5 1.5])
axis equal
caxis([-5e3 5e3])
xlabel('z/D_j')
% ylabel('r/D_j')
% colormap(CustomColormap)
% colorbar
shading interp
set(gcf,'color','w'); 
set(gca,'FontSize', 18);  set(gca,'layer','top')
% saveas(gcf,'Disk.png');

%%
xgn = [10 20 40 50];


for xi = 1:4
    xg = xgn(xi); 
    P_rtheta = squeeze(P_inp(xg,:,:,1));
    r            = squeeze(yy_inp(xg,:,:)); 
    z            = squeeze(zz_inp(xg,:,:)); 

subplot(1,4,xi)    
pcolor(z/Dj,r/Dj,P_rtheta-mean(P_rtheta))
xlim([-1.5 1.5]); ylim([-1.5 1.5])
shading interp
view(0,90);
colormap(CustomColormap);
caxis([-5e3 5e3])

if xg == 10; ylabel('r/D_j'); end
xlabel('z/D_j')
set(gcf,'color','w'); 

if xg == 10; text(-1.4, 1.3, 'x/Dj = 1', 'FontSize',15, 'Color', 'w', 'fontweight','bold'); end 
if xg == 20; text(-1.4, 1.3, 'x/Dj = 2', 'FontSize',15, 'Color', 'w', 'fontweight','bold'); end 
if xg == 40; text(-1.4, 1.3, 'x/Dj = 4', 'FontSize',15, 'Color', 'w', 'fontweight','bold'); end 
if xg == 50; text(-1.4, 1.3 , 'x/Dj = 5', 'FontSize',15, 'Color', 'w', 'fontweight','bold'); end 

set(gca,'FontSize', 18);  set(gca,'layer','top')

end

 set(gcf, 'Position', [10, 30, 1750, 360]);
saveas(gcf,'Disk.png');
%%
save('sampledisk', 'z', 'r', 'Dj',"P_rtheta")