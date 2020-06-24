clear all
close all
clc
%=========================================================================%
%                                                                         %
%              INITIALIZE AND SOLVE WITH NEORESP                          %
%                                                                         %
%=========================================================================%

global beam_model
global dyn_model

% request input file for dynamic and gust analysis
input_file = 'A321_BaseLin_inputGust.dat';

% dynamic response is solved here (modes, flutter)
init_dyn_model(input_file)

% run gust analysis
solve_free_lin_dyn('dT', 5e-3, 'Tmax', 10);

%=========================================================================%
%                                                                         %
%                        POST-PROCESS RESULTS                             %
%                                                                         %
%=========================================================================%

barID  = 2002; % this is the node at wingroot
nodeID = 1004; % node of te CG

% find the position of WR in beam model
positionWR_global  = find(beam_model.Bar.ID==barID);
% find the position of WR in the results
positionWR_results = find(beam_model.Param.IFORCE==positionWR_global);

% extract the bending moment at WR
wrbm_dirrec = squeeze(dyn_model.Res.IFORCE(6,1,positionWR_results,:));
% acceleration mode avariant
wrbm_modac  = squeeze(dyn_model.Res.MODACC.IFORCE(6,1,positionWR_results,:));

% extract the torsional moment at WR
wrtm_dirrec = squeeze(dyn_model.Res.IFORCE(4,1,positionWR_results,:));
% acceleration modes avariant
wrtm_modac  = squeeze(dyn_model.Res.MODACC.IFORCE(4,1,positionWR_results,:));

% find the position of CG in beam model
positionCG_global  = find(beam_model.Node.ID==nodeID);
% extract the position of CG displacements results
positionCG_results = find(beam_model.Param.DISP==positionCG_global);

% change to a more comfortable format with "squeeze"
CG        = squeeze(dyn_model.Res.DISP(positionCG_results,3,:));
CG_acc    = squeeze(dyn_model.Res.ACCELERATION(1,3,:));


%=========================================================================%
%                                                                         %
%                       CG Z DISPLACEMENT                                 %
%                                                                         %
%=========================================================================%

figure
plot(dyn_model.Res.Time,CG,'LineWidth',1.5)
hold on
title('CG vertical displacement')
xlabel('time [s]')
ylabel('z [m]')
grid on
legend('BaseLine')
set(gca,'fontsize',16)

%=========================================================================%
%                                                                         %
%                       CG Z ACCELERATION                                 %
%                                                                         %
%=========================================================================%

figure
plot(dyn_model.Res.Time,CG_acc,'LineWidth',1.5)
title('CG vertical acceleration')
xlabel('time [s]')
ylabel('z [m]')
grid on
legend('BaseLine')
set(gca, 'fontsize', 16);

%=========================================================================%
%                                                                         %
%              WRBM   (Wing Root Bending Moment)                          %
%                                                                         %
%=========================================================================%

figure
hold on
plot(dyn_model.Res.Time,wrbm_modac,'LineWidth',1.5)
title('Wing-root Bending Moment')
xlabel('time [s]')
ylabel('M_z [Nm]')
grid on
legend('BaseLine')
set(gca, 'fontsize', 16);

%=========================================================================%
%                                                                         %
%              WRTM   (Wing Root Torsional Moment)                        %
%                                                                         %
%=========================================================================%

figure
hold on
plot(dyn_model.Res.Time,wrtm_modac,'LineWidth',1.5)
title('WRTM')
xlabel('time [s]')
ylabel('Mx [Nm]')
grid on
legend('BaseLine')
set(gca, 'fontsize', 16);

%=========================================================================%
%                                                                         %
%                          Plot Gust Profile                              %
%                                                                         %
%=========================================================================%
figure; hold on
set(gca, 'fontsize', 20);
grid on; 
xlabel('Time [s]');
ylabel('Vg [m/s]');
title('Gust profile')
axis([0 2 0 16])
plot(dyn_model.Res.Time, dyn_model.Res.Gust_profile, 'b', 'linewidth', 1.5);

%=========================================================================%
%                                                                         %
%                           Flutter speed                                 %
%                                                                         %
%=========================================================================%

vf = dyn_model.flu.param.VFLINT;

if vf < dyn_model.flu.param.VMAX
    fprintf('\n- Flutter speed detected at %f m/s\n', vf)
end 
