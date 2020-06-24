clear
close all
clc

%==================================================================================%
%                                                                                  %
%                 INITIALIZE AND SOLVE WITH NEOCASS                                %
%                                                                                  %
%==================================================================================%
% ask the user wihich trim condition should be analysed
i = input('Chose a trim condition among those described in trim file: \n -> ');

global beam_model

% load the file with trim analysis (it is a SMARTCAD with .dat ext)
input_file = 'A321_BaseLin_input3Trim.dat'; 


beam_model = load_nastran_model(input_file);

% solve a trim condition(1,2,3,4..)
solve_free_lin_trim('INDEX', i); 

% plots de deformed model (last index to choose in which trim cond)
plotLinearDispl(beam_model, beam_model.Res, 1, i); 

%===================================================================================%
%                                                                                   %
%                    POST-PROCESS RESULTS AND MAIN PLOTS                            %
%                                                                                   %
%===================================================================================%
% Code for plotting span loads on recovery points and on structural nodes

[NForces, nodeCoords] = getForcesOnNodes(beam_model, beam_model.Res.Bar.CForces);

% select beams of the wings
selectWing = beam_model.Bar.ID>=2000 & beam_model.Bar.ID <2999;

% total number of nodes
nBar = sum(selectWing); 

loadsOnWingC = reshape(permute(beam_model.Res.Bar.CForces(:,:,selectWing), [2,1,3]),...
    [6, 2*nBar]); % loads on the wing per nodes
loadPointsC =  reshape(permute(beam_model.Bar.Colloc(:,:,selectWing), [2,1,3]),...
    [3, 2*nBar]); % postition of the loads on the points

% sort the points along wing span for better plot
[sortedY, indSortYC] = sort(loadPointsC(2,:)); 

figure; hold on
set(gca, 'fontsize', 18);
grid on
xlabel('Span [m]');
ylabel('M_z [Nm]');
% spanwise plot of the desired load (change the 1st index in loadsOnWings, 6 is for BM)
plot(loadPointsC(2,indSortYC), loadsOnWingC(6,indSortYC), '-ob', 'linewidth', 2); 

loadsOnWingF = reshape(permute(NForces(:,:,selectWing), [2,1,3]),...
    [6, 2*nBar]); % loads on the wing per structural nodes
loadPointsF =  reshape(permute(nodeCoords(:,:,selectWing), [2,1,3]),...
    [3, 2*nBar]); % postition of the loads on the points

%[sortedY, indSortYF] = sort(loadPointsF(2,:));
indSortYF = 1:2*nBar;

set(gca, 'fontsize', 18);
grid on
xlabel('Span [m]');
ylabel('M_z [Nm]');
plot(loadPointsF(2,indSortYF), loadsOnWingF(6,indSortYF), '+r', 'linewidth', 2);
legend('Loads on recovery points', 'Loads on nodes')


%%
%==================================================================================%
%                                                                                  %
%                               ADDITIONAL PLOTS                                   %
%                                                                                  %
%==================================================================================%
% visualize internal forces of all beams
% (plot(ifig, internal force, numbers of levels))

AI_plot(3, 6, 20) %out plane bending moment

AI_plot(4, 4, 20) %torsional moment

return
