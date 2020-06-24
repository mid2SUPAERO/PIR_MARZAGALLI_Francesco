clear all
close all
clc

%=============================================================================================%
%                                                                                             %
%                            INITIALIZE AND SOLVE WITH NEORESP                                %
%                                                                                             %
%=============================================================================================%

% input files definition
files = ['A321_BaseLin_inputGust.dat';...
   'A321_75_00H0_inputGust.dat';'A321_75_00H1_inputGust.dat';'A321_75_00H2_inputGust.dat';'A321_75_00H3_inputGust.dat';...
   'A321_81_00H0_inputGust.dat';'A321_81_00H1_inputGust.dat';'A321_81_00H2_inputGust.dat';'A321_81_00H3_inputGust.dat';...
   'A321_84_00H0_inputGust.dat';'A321_84_00H1_inputGust.dat';'A321_84_00H2_inputGust.dat';'A321_84_00H3_inputGust.dat';...
   'A321_88_00H0_inputGust.dat';'A321_88_00H1_inputGust.dat';'A321_88_00H2_inputGust.dat';'A321_88_00H3_inputGust.dat';...
   'A321_93_00H0_inputGust.dat';'A321_93_00H1_inputGust.dat';'A321_93_00H2_inputGust.dat';'A321_93_00H3_inputGust.dat'];

for n = 1 : size(files, 1)

    global beam_model
    global dyn_model

    % request input file for dynamic and gust analysis
    input_file = files(n,:);

    % dynamic response is solved here (modes, flutter)
    init_dyn_model(input_file);

    % run gust analysis
    solve_free_lin_dyn('dT', 5e-3, 'Tmax', 10);

%===============================================================================================%
%                                                                                               %
%                                    POST-PROCESS RESULTS                                       %
%                                                                                               %
%===============================================================================================%

    barID  = 2002; % this is the node at wingroot
    nodeID = 1004; % node of te CG

    % find the position of WR in beam model
    positionWR_global  = find(beam_model.Bar.ID==barID);
    % find the position of WR in the results
    positionWR_results = find(beam_model.Param.IFORCE==positionWR_global);

    % extract the bending moment at WR with direct recovery
    wrbm_dirrec(n,:) = squeeze(dyn_model.Res.IFORCE(6,1,positionWR_results,:));
    % acceleration mode variant
    wrbm_modac(n,:)  = squeeze(dyn_model.Res.MODACC.IFORCE(6,1,positionWR_results,:));

    % extract the torsional moment at WR  with direct recovery
    wrtm_dirrec(n,:) = squeeze(dyn_model.Res.IFORCE(4,1,positionWR_results,:));
    % acceleration modes avariant
    wrtm_modac(n,:)  = squeeze(dyn_model.Res.MODACC.IFORCE(4,1,positionWR_results,:));

    % find the position of CG in beam model
    positionCG_global  = find(beam_model.Node.ID==nodeID);
    % extract the position of CG displacements results
    positionCG_results = find(beam_model.Param.DISP==positionCG_global);

    % change to a more comfortable format with "squeeze"
    CG_disp(n,:) = squeeze(dyn_model.Res.DISP(positionCG_results,3,:));
    CG_acc(n,:)  = squeeze(dyn_model.Res.ACCELERATION(1,3,:));
    
%===============================================================================================%
%                                                                                               %
%                                    FLUTTER SPEED                                              %
%                                                                                               %
%===============================================================================================%

    vf = dyn_model.flu.param.VFLINT;

    if vf < dyn_model.flu.param.VMAX
        fprintf('\n- Flutter speed detected at %f m/s\n', vf)
        VF(n) = vf;
    else 
        VF(n) = 0;
    end
    
end

    time = dyn_model.Res.Time;
    Gust_profile = dyn_model.Res.Gust_profile;
    WRBM = wrbm_modac;
    WRTM = wrtm_modac;
    
%color set definition for next plots    
ColorPlot = [ 0.25      0.25      0.25;
              0.9961    0.7969    0.5977;
              0.9960    0.3984    0.6953;
              0.7968    0         0.3984;
              0.3985    0         0.1992;
              0.7969    0.7969    0;
              0.9961    0.9961    0;
              0.9961    0.6445    0;
              0.8984    0.3672    0.012;
              0.9648    0.0273    0.4023;
              0.9961    0         0;
              0.5977    0         0;
              0.3984    0         0;              
              0.4844    0.9844    0;
              0         0.9961    0;
              0.0195    0.8008    0.0195;
              0         0.3984    0;
              0.3984    0.9961    0.9961;
              0         0.7461    0.9961;
              0.0117    0.5625    0.9961;
              0.1992    0.1992    0.9961];
          
set(0,'DefaultAxesColorOrder',ColorPlot);
    
%===========================================================================================%
%                                                                                           %
%                               CG Z DISPLACEMENT                                           %
%                                                                                           %
%===========================================================================================%

figure; hold on
plot(time, CG_disp(1,:),'--','LineWidth',1.5)
plot(time, CG_disp(2:end,:),'LineWidth',1.5)
title('CG vertical displacement')
xlabel('time [s]')
ylabel('z [m]')
set(gca,'fontsize',16)
grid on
legend('Baseline',...
    '75%, Vlow hinge stiffness','75%, low hinge stiffness','75%, medium hinge stiffness','75%, high hinge stiffness',...
    '81%, Vlow hinge stiffness','81%, low hinge stiffness','81%, medium hinge stiffness','81%, high hinge stiffness',...
    '84%, Vlow hinge stiffness','84%, low hinge stiffness','84%, medium hinge stiffness','84%, high hinge stiffness',...
    '88%, Vlow hinge stiffness','88%, low hinge stiffness','88%, medium hinge stiffness','88%, high hinge stiffness',...
    '93%, Vlow hinge stiffness','93%, low hinge stiffness','93%, medium hinge stiffness','93%, high hinge stiffness')

%===========================================================================================%
%                                                                                           %
%                      WRBM   (Wing-Root Bending Moment)                                    %
%                                                                                           %
%===========================================================================================%

figure; hold on
plot(time, WRBM(1,:),'--','LineWidth',1.5)
plot(time, WRBM(2:end,:),'LineWidth',1.5)
title('Wing-root Bending Moment')
xlabel('time [s]')
ylabel('M_z [Nm]')
grid on
set(gca, 'fontsize', 16);
legend('Baseline',...
    '75%, Vlow hinge stiffness','75%, low hinge stiffness','75%, medium hinge stiffness','75%, high hinge stiffness',...
    '81%, Vlow hinge stiffness','81%, low hinge stiffness','81%, medium hinge stiffness','81%, high hinge stiffness',...
    '84%, Vlow hinge stiffness','84%, low hinge stiffness','84%, medium hinge stiffness','84%, high hinge stiffness',...
    '88%, Vlow hinge stiffness','88%, low hinge stiffness','88%, medium hinge stiffness','88%, high hinge stiffness',...
    '93%, Vlow hinge stiffness','93%, low hinge stiffness','93%, medium hinge stiffness','93%, high hinge stiffness')

%===========================================================================================%
%                                                                                           %
%                           PLOT GUST PROFILE                                               %
%                                                                                           %
%===========================================================================================%
   
figure; hold on
set(gca, 'fontsize', 20);
grid on; 
xlabel('Time [s]');
ylabel('Vg [m/s]');
title('Gust profile')
axis([0 2 0 16])
plot(time, Gust_profile, 'b', 'linewidth', 1.5);

%===========================================================================================%
%                                                                                           %
%                  Plots for Hinge Stiffness and Position Effect                            %
%                                                                                           %
%===========================================================================================%

% chosen stifnesses
k = [1e+03, 1e+04, 1e+05, 1e+06];

% max wing-root bending moment
max_WRBM = max(WRBM');
% bending moment comparison 
CBM = max_WRBM(2:end)/max_WRBM(1);
% look for best configuration
jj = find(CBM == min(CBM));
fprintf('\nMax Wing-root bending moment Hinged wingtip / Baseline: \n')
fprintf('%f\n', CBM)

% plot the maximum WRBM as function of chosen stifnesses  for different hinge position
figure;
semilogx(k, max_WRBM(2:5),'-om', k, max_WRBM(6:9),'-oy',k,max_WRBM(10:13),'-og',k,max_WRBM(14:17),'-or',k,max_WRBM(18:21),'-ob','linewidth',1.5)
grid on
set(gca, 'fontsize', 18);
xlabel('Hinge stifness [Nm/rad]');
ylabel('M_z[Nm]');
title('Max Wing-root Bending Moment ');
legend('75%','81%','84%','88%','93%')

% max vertical displacement
max_CGD = max(CG_disp');
% vertical displacement comparison 
CVD = max_CGD(2:end)/max_CGD(1);
% look for best configuration
kk = find(CVD == min(CVD));
fprintf('\nMax vertical displacement Hinged wingtip / Baseline:')
fprintf('\n%f', CVD)

figure;
semilogx(k, max_CGD(2:5),'-om', k, max_CGD(6:9),'-oy',k,max_CGD(10:13),'-og',k,max_CGD(14:17),'-or',k,max_CGD(18:21),'-ob','linewidth',1.5)
grid on
set(gca, 'fontsize', 18);
xlabel('Hinge stifness [Nm/rad]');
ylabel('z [m]');
title('Max CG vertical displacement');
grid on
legend('75%','81%','84%','88%','93%')

%===========================================================================================%
%                                                                                           %
%                           PLOT BEST CONFIGURATION                                         %
%                                                                                           %
%===========================================================================================%

figure; hold on
plot(time, CG_disp(1,:),'--k','LineWidth',1.5)
plot(time, CG_disp(13,:),'b','LineWidth',1.5)
title('CG vertical displacement')
xlabel('time [s]')
ylabel('z [m]')
grid on
set(gca,'fontsize',16)
legend('Baseline','84% high hinge stifness')
title('Best vertical displacement response')

figure; hold on
plot(time, WRBM(1,:),'--k','LineWidth',1.5)
plot(time, WRBM(2,:),'r','LineWidth',1.5)
plot(time, WRBM(6,:),'color', [0.9961    0.6445    0],'LineWidth',1.5)
title('WRBM')
xlabel('time [s]')
ylabel('Mz [Nm]')
grid on
set(gca, 'fontsize', 16);
legend('Baseline','75%, Vlow hinge stiffness','81%, Vlow hinge stiffness')
title('Best load alleviation')

%===========================================================================================%
%                                                                                           %
%                                     SAVE DATA                                             %
%                                                                                           %
%===========================================================================================%
    
filename = 'SolGust';
save(filename,'CG_disp','CG_acc', 'WRBM', 'WRTM','time','k','Gust_profile')
