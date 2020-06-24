clear
close all
clc

%=======================================================================================%
%                                                                                       %
%                      INITIALIZE AND SOLVE WITH NEOCASS                                %
%                                                                                       %
%=======================================================================================%

% ask the user wihich trim condition should be analysed
i = input('Chose a trim condition among those described in trim file: \n -> ');

files = ['A321_BaseLin_input3Trim.dat';...
    'A321_75_00H0_input3Trim.dat';'A321_75_00H1_input3Trim.dat';'A321_75_00H2_input3Trim.dat';'A321_75_00H3_input3Trim.dat';...
    'A321_81_00H0_input3Trim.dat';'A321_81_00H1_input3Trim.dat';'A321_81_00H2_input3Trim.dat';'A321_81_00H3_input3Trim.dat';...
    'A321_84_00H0_input3Trim.dat';'A321_84_00H1_input3Trim.dat';'A321_84_00H2_input3Trim.dat';'A321_84_00H3_input3Trim.dat';...
    'A321_88_00H0_input3Trim.dat';'A321_88_00H1_input3Trim.dat';'A321_88_00H2_input3Trim.dat';'A321_88_00H3_input3Trim.dat';...
    'A321_93_00H0_input3Trim.dat';'A321_93_00H1_input3Trim.dat';'A321_93_00H2_input3Trim.dat';'A321_93_00H3_input3Trim.dat'];
     
for n = 1 : size(files,1)

    global beam_model

    % load the file with trim analysis (it is a SMARTCAD with .dat ext)
    input_file = files(n,:);

    beam_model = load_nastran_model(input_file);
       
    % solve a trim condition(1,2,3,4..)
    solve_free_lin_trim('INDEX', i); 

    % plots de deformed model (last index to choose in which trim cond)
    plotLinearDispl(beam_model, beam_model.Res, 1, i); 

%=======================================================================================%
%                                                                                       %
%                              POST-PROCESS RESULTS                                     %
%                                                                                       %
%=======================================================================================%

    % Code for plotting span loads on structural nodes
    [NForces, nodeCoords] = getForcesOnNodes(beam_model, beam_model.Res.Bar.CForces);

    % select beams of the wings
    selectWing = beam_model.Bar.ID>=2000 & beam_model.Bar.ID <2999;

    % total number of nodes
    nBar = sum(selectWing); 

    loadsOnWingC = reshape(permute(beam_model.Res.Bar.CForces(:,:,selectWing), [2,1,3]),...
        [6, 2*nBar]); % loads on the wing per recovery nodes
    loadPointsC =  reshape(permute(beam_model.Bar.Colloc(:,:,selectWing), [2,1,3]),...
        [3, 2*nBar]); % postition of the loads on the points

    % sort the points along wing span for better plot
    if n == 1
        [sortedY_BL, indSortYC_BL] = sort(loadPointsC(2,:));
        SpanPoints_BL = loadPointsC(2,indSortYC_BL);
        BM_C_BL =loadsOnWingC(6,indSortYC_BL);
    else
        [sortedY, indSortYC] = sort(loadPointsC(2,:));
        SpanPoints(n-1,:) = loadPointsC(2,indSortYC);
        BM_C(n-1,:) =loadsOnWingC(6,indSortYC);
    end
    
    loadsOnWingF = reshape(permute(NForces(:,:,selectWing), [2,1,3]),...
        [6, 2*nBar]); % loads on the wing per structural nodes
    loadPointsF =  reshape(permute(nodeCoords(:,:,selectWing), [2,1,3]),...
        [3, 2*nBar]); % postition of the loads on the points
end

%%
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
                       
set(0,'DefaultAxesColorOrder',ColorPlot );

%=======================================================================================%
%                                                                                       %
%                         WING BENDING MOMENT PLOT                                      %
%                                                                                       %
%=======================================================================================%

% spanwise plot of wing bending moment
figure; hold on
set(gca, 'fontsize', 18);
grid on
xlabel('Span [m]');
ylabel('M_z [Nm]');
plot(SpanPoints_BL, BM_C_BL, '--k' , 'linewidth', 1.5); 
plot(SpanPoints(1,:), BM_C, 'linewidth', 1.5);
legend('Baseline',...
    '75%, Very low hinge stiffness','75%, low hinge stiffness','75%, medium hinge stiffness','75%, high hinge stiffness',...
    '81%, Vlow hinge stiffness','81%, low hinge stiffness','81%, medium hinge stiffness','81%, high hinge stiffness',...
    '84%, Vlow hinge stiffness','84%, low hinge stiffness','84%, medium hinge stiffness','84%, high hinge stiffness',...
    '88%, Vlow hinge stiffness','88%, low hinge stiffness','88%, medium hinge stiffness','88%, high hinge stiffness',...
    '93%, Vlow hinge stiffness','93%, low hinge stiffness','93%, medium hinge stiffness','93%, high hinge stiffness')
if i == 1
    title('Spanwise Bending Moment - Cruise')
elseif i == 2
    title('Spanwise Bending Moment - 2g pull-up')
end
%=========================================================================================%
%                                                                                         %
%              Plots for Hinge stiffness and position influence                           %
%                                                                                         %
%=========================================================================================%

% chosen stifnesses
k = [1e+03, 1e+04, 1e+05, 1e+06];

% wing-root bending moment and comparison with baseline
WRBM = [max(BM_C_BL), max(BM_C')];
CB = WRBM(2:end)/WRBM(1);
% look for best configuration
jj = find(CB == min(CB));

fprintf('\nWing-root bending moment Hinged wingtip / Baseline:\n')
fprintf('%f\n', CB)

% plot the WRBM as function of chosen stifnesses for different hinge position
figure;
semilogx(k, WRBM(2:5),'-om', k, WRBM(6:9),'-oy',k,WRBM(10:13),'-og',k,WRBM(14:17),'-or',k,WRBM(18:21),'-ob','linewidth',1.5)
grid on
set(gca, 'fontsize', 18);
xlabel('Hinge stifness [Nm/rad]');
ylabel('M_z [Nm]');
legend('75%','81%','84%','88%','91%')
if i == 1
    title('Max Bending Moment - Cruise')
elseif i == 2
    title('Max Bending Moment - 2g pull-up')
end

%===========================================================================================%
%                                                                                           %
%                           PLOT BEST CONFIGURATION                                         %
%                                                                                           %
%===========================================================================================%

if i == 1
    figure; hold on
    set(gca, 'fontsize', 18);
    grid on
    xlabel('Span [m]');
    ylabel('M_z [Nm]');
    plot(SpanPoints_BL, BM_C_BL, '--k' , 'linewidth', 1.5); 
    plot(SpanPoints(1,:), BM_C(6,:),'color', [0.9961    0.6445    0], 'linewidth', 1.5);
    plot(SpanPoints(1,:), BM_C(9,:), 'r', 'linewidth', 1.5);
    legend('Baseline','81% low hinge stifness', '84% Vlow hinge stifness')
    title('Spanwise Bending moment - Cruise')
    
elseif i == 2
    figure; hold on
    set(gca, 'fontsize', 18);
    grid on
    xlabel('Span [m]');
    ylabel('M_z [Nm]');
    plot(SpanPoints_BL, BM_C_BL, '--k' , 'linewidth', 1.5); 
    plot(SpanPoints(1,:), BM_C(6,:),'color', [0.9961    0.6445    0], 'linewidth', 1.5);
    plot(SpanPoints(1,:), BM_C(9,:), 'r', 'linewidth', 1.5);
    legend('Baseline','81% low hinge stifness', '84% Vlow hinge stifness')
    title('Spanwise Bending moment - 2g pull-up maneuver')
end

%=========================================================================================%
%                                                                                         %
%                                     SAVE DATA                                           %
%                                                                                         %
%=========================================================================================%
if i ==1 
    filename = 'SolTrimCruise';
elseif i == 2
    filename = 'SolTrimPullUp';
end

save(filename,'i','SpanPoints_BL','indSortYC_BL', 'BM_C_BL', 'SpanPoints','indSortYC', 'BM_C','k')


return

%%
%==================================================================================%
%                                                                                  %
%                               ADDITIONAL PLOTS                                   %
%                                                                                  %
%==================================================================================%
% visualize internal forces of all beams
% (plot(ifig, internal force, numbers of levels))

AI_plot(10, 6, 20) %out plane bending moment

AI_plot(11, 4, 20) %torsional moment



