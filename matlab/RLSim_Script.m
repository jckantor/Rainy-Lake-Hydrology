%% Rainy Lake Simulation Model
% Use this script to load the simulation data for the Simulink model
% Rainy_Lake_Simulatio
n_Model.slx and display the results. The script loads
% historical inflow, outflow, and height data from RLEstimates.csv located
% in an accompanying data directory.

%% Load Data

RLTable = readtable('../data/RLLevelFlow.csv');

% read each column in the order: dates, level, inflow, outflow
dates = datenum(RLTable{:,1});
H = RLTable{:,2};
I = RLTable{:,3};
O = RLTable{:,4};

% convert date index to data sets assuming day 1 == Jan 1, 1970'H
H = [(1:length(H))',H];
I = [(1:length(I))',I];
O = [(1:length(O))',O];

%% Run Simulation

RLSim;
fig = get_param('RLSim','Handle')
saveas(fig,'../images/RLSim_Model.svg');
saveas(fig,'../images/RLSim_Model.png');

set_param('RLSim','IgnoredZcDiagnostic','none');
sim('RLSim'); 


%% Extract and Save Results

% convert time do datenum
t = levels.Time + datenum('Jan-01-1970');

ago = levels.Data(:,1);
ehl = levels.Data(:,2);
urc = levels.Data(:,3);
lrc = levels.Data(:,4);
edl = levels.Data(:,5);
level_sim = levels.Data(:,6);
level_hist = levels.Data(:,7);

outflow_sim = flows.Data(:,1);
inflow_sim = flows.Data(:,2);
inflow_hist = flows.Data(:,3);
outflow_hist = flows.Data(:,4);

RLSim_Results = table( ...
    datestr(t), ...
    ago, ...
    ehl, ...
    urc, ...
    lrc, ...
    edl, ...
    level_sim, ...
    level_hist, ...
    inflow_sim, ...
    inflow_hist, ...
    outflow_sim, ...
    outflow_hist, ...
    inflow_sim ...
 );

writetable(RLSim_Results,'../data/RLSim_Results.csv')

%% Plot Results

fig = figure(1);

subplot(2,1,1);
plot(t,[urc,lrc,ago,ehl,edl],'g');
hold on;
plot(t,level_sim,'r','LineWidth',1.0);
hold off;
datetick('x',12)
datetick('x','yy','keepticks')
ylim([336.4,338.8])
title('Control Simulation for Rainy Lake Levels', 'FontSize',16);

subplot(2,1,2);
plot(t,[urc,lrc,ago,ehl,edl],'g');
hold on;
plot(t,level_hist','b','LineWidth',1.0);
hold off;
datetick('x',12)
datetick('x','yy','keepticks')
ylim([336.4,338.8])
title('Historical Levels', 'FontSize',16);

saveas(fig, '../images/RLSim_Results.png')
saveas(fig, '../images/RLSim_Results.svg')

