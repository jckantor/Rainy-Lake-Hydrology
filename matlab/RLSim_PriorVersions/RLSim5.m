%% Rainy Lake Simulation Model
% Use this script to load the simulation data for the Simulink model
% Rainy_Lake_Simulation_Model.slx and display the results. The script loads
% historical inflow, outflow, and height data from RLEstimates.csv located
% in an accompanying data directory.

%% Load Data

if exist('RLEstimates.mat')
    load 'RLEstimates.mat';
else
    RLTable = readtable('../data/RLLevelFlow.csv');
    save '../data/RLLevelFlow.mat' RLTable
end

dates = datenum(RLTable{:,1});
H = RLTable{:,2};
I = RLTable{:,3};
O = RLTable{:,4};

I = [(1:length(I))',I];
H = [(1:length(H))',H];
O = [(1:length(O))',O];

%% Run Simulation

RLSim5;
set_param('RLSim5','IgnoredZcDiagnostic','none');
sim('RLSim5'); 

print -dpng -sRLSim5 '../images/RLSim5_Model.png'

%% Plot Results

t = levels.Time + datenum('Jan-01-1970');
ago = levels.Data(:,1);
ehl = levels.Data(:,2);
urc = levels.Data(:,3);
lrc = levels.Data(:,4);
edl = levels.Data(:,5);
rlest = levels.Data(:,6);
rlhist = levels.Data(:,7);

figure(1)
h= gcf;
set(h,'ReSize','off');
set(h,'PaperUnits','centimeters');
set(h,'PaperSize',[25 6]); % IEEE columnwidth = 9cm

subplot(2,1,1);
plot(t,urc,'g', ...
    t,lrc,'g', ...
    t,ago,'g', ...
    t,ehl,'g', ...
    t,edl,'g');
hold on;
plot(t,rlest,'r','LineWidth',1.0);
hold off;

datetick('x',12)
datetick('x','yy','keepticks')
ylim([336.4,338.8])
title('MPC for Rainy Lake Level', 'FontSize',16);

subplot(2,1,2);
plot(t,urc,'g',t,lrc,'g',t,ago,'g',t,edl,'g');
hold on;
plot(t,rlhist','b','LineWidth',1.0);
hold off;

datetick('x',12)
datetick('x','yy','keepticks')
ylim([336.4,338.8])
title('Historical Levels', 'FontSize',16);

print -dpng -r300 '../images/RLSim5_Results.png'

