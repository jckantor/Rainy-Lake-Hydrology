%% Effect of Rule Curve Changes for Rainy Lake and the Namakan Reservoir
% The IJC rule curves that govern the management of lake levels on Rainy
% Lake and the Namakan Reservoir were changed were established in 1949 and
% adjusted in 1957, 1970, and most recently in 2000. The purpose of these
% calculations is estimate the impact of the changes in 2000 on outflows to
% Rainy River.

%% 1970 Rule Curves for Namakan Lake

yr = 2014;
mo = datenum(yr,1:13,1)';
dy = (datenum(yr,1,1):datenum(yr,13,1))';

NL1970 = [ ...
    datenum(yr, 1, 1)  1113.6  1115.3;
    datenum(yr, 2, 1)  1111.9  1114.1;
    datenum(yr, 3, 1)  1110.3  1113.1;
    datenum(yr, 4, 1)  1108.6  1112.0;
    datenum(yr, 4,21)  1108.6  1113.1;
    datenum(yr, 5, 1)  1110.2  1113.6;
    datenum(yr, 6, 1)  1115.3  1116.6;
    datenum(yr, 6,21)  1117.5  1118.6;
    datenum(yr, 7, 1)  1117.6  1118.6;
    datenum(yr, 7,21)  1118.0  1118.6;
    datenum(yr, 8, 1)  1118.0  1118.6;
    datenum(yr, 9, 1)  1118.0  1118.6;
    datenum(yr, 9,11)  1118.0  1118.6;
    datenum(yr,10, 1)  1117.6  1118.6;
    datenum(yr,11, 1)  1116.3  1117.5;
    datenum(yr,12, 1)  1115.0  1116.4;
    datenum(yr,13, 1)  1113.6  1115.3];

% Convert to meters
NL1970(:,2:3) = NL1970(:,2:3)/3.2808;

% Interpolate to daily levels
NL1970 = [dy, ...
    interp1(NL1970(:,1),NL1970(:,2),dy), ...
    interp1(NL1970(:,1),NL1970(:,3),dy)];

% 2000 Rule Curves for Namakan Lake

LRC = [...
    datenum(yr, 1, 1) 339.70;
    datenum(yr, 4, 1) 338.95;
    datenum(yr, 4,15) 338.95;
    datenum(yr, 6, 7) 340.70;
    datenum(yr, 9, 1) 340.45;
    datenum(yr,10, 1) 340.45;
    datenum(yr,13, 1) 339.70];

URC = [...
    datenum(yr, 1, 1) 340.00;
    datenum(yr, 4, 1) 339.70;
    datenum(yr, 6, 1) 340.95;
    datenum(yr, 9, 1) 340.65;
    datenum(yr,10, 1) 340.65;
    datenum(yr,13, 1) 340.00];

NLEDL = [...
    datenum(yr, 1, 1) 338.95;
    datenum(yr, 6,30) 338.95;
    datenum(yr, 7, 1) 340.15;
    datenum(yr, 9,30) 340.15;
    datenum(yr,10, 1) 338.95;
    datenum(yr,13, 1) 338.95];

NL2000 = [dy, ...
    interp1(LRC(:,1),LRC(:,2),dy), ...
    interp1(URC(:,1),URC(:,2),dy)];

NLEDL = [dy, interp1(NLEDL(:,1),NLEDL(:,2),dy)];

% Plot
figure(1);clf;

hold on
%plot(NL1970(:,1),NL1970(:,2:3),'b','Linewidth',2);
%plot(NL2000(:,1),NL2000(:,2:3),'r','Linewidth',2);
h1970 = patch([dy; flipud(dy)], [NL1970(:,2); flipud(NL1970(:,3))],'b','FaceAlpha',0.2);
h2000 = patch([dy; flipud(dy)], [NL2000(:,2); flipud(NL2000(:,3))],'y','FaceAlpha',0.2);
plot(EDL(:,1),NLEDL(:,2),'k--','Linewidth',2);
hold off

legend([h1970,h2000],'1970','2000','Location','NW');

ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Level [meters]');
title('Namakan Lake Rule Curves');
grid;

print -dpng ../Namakan_Lake_Rule_Curves.png

%% 1970 Rule Curves for Rainy Lake

RL1970 = [ ...
    datenum(yr, 1, 1)  1106.6  1107.1;
    datenum(yr, 2, 1)  1105.8  1106.6;
    datenum(yr, 3, 1)  1105.2  1106.2;
    datenum(yr, 4, 1)  1104.6  1105.6;
    datenum(yr, 4,21)  1104.6  1106.2;
    datenum(yr, 5, 1)  1105.1  1106.6;
    datenum(yr, 6, 1)  1106.6  1107.6;
    datenum(yr, 7, 1)  1107.4  1108.1;
    datenum(yr, 8, 1)  1107.4  1108.1;
    datenum(yr, 9, 1)  1107.4  1108.1;
    datenum(yr,10, 1)  1107.4  1108.1;
    datenum(yr,10,11)  1107.4  1108.1;
    datenum(yr,11, 1)  1107.2  1108.1;
    datenum(yr,12, 1)  1106.8  1107.6;
    datenum(yr,13, 1)  1106.4  1107.1];

% Convert to meters
RL1970(:,2:3) = RL1970(:,2:3)/3.2808;

% Interpolate to daily levels
RL1970 = [dy, ...
    interp1(RL1970(:,1),RL1970(:,2),dy), ...
    interp1(RL1970(:,1),RL1970(:,3),dy)];
    
% 2000 Rule Curves for Rainy Lake

LRC = [...
    datenum(yr, 1, 1) 337.20;
    datenum(yr, 4, 1) 336.70;
    datenum(yr, 5, 1) 336.80;
    datenum(yr, 6, 1) 337.30;
    datenum(yr, 7, 1) 337.50;
    datenum(yr, 8,15) 337.50;
    datenum(yr,12, 1) 337.30;
    datenum(yr,13, 1) 337.20];

URC = [...
    datenum(yr, 1, 1) 337.45;
    datenum(yr, 4, 1) 337.00;
    datenum(yr, 5, 1) 337.40;
    datenum(yr, 6, 1) 337.60;
    datenum(yr, 7, 1) 337.75;
    datenum(yr, 8,15) 337.75;
    datenum(yr,12, 1) 337.60;
    datenum(yr,13, 1) 337.45];

RLEDL = [...
    datenum(yr, 1, 1) 336.90;
    datenum(yr, 4, 1) 336.70;
    datenum(yr, 6,30) 336.70;
    datenum(yr, 7, 1) 337.20;
    datenum(yr,10,24) 337.20;
    datenum(yr,13, 1) 336.90];

RL2000 = [dy, ...
    interp1(LRC(:,1),LRC(:,2),dy), ...
    interp1(URC(:,1),URC(:,2),dy)];

RLEDL = [dy, interp1(RLEDL(:,1),RLEDL(:,2),dy)];

% Plot
figure(2);clf;

hold on
%plot(RL1970(:,1),RL1970(:,2:3),'b','Linewidth',2);
%plot(RL2000(:,1),RL2000(:,2:3),'r','Linewidth',2);
h1970 = patch([dy; flipud(dy)], [RL1970(:,2); flipud(RL1970(:,3))],'b','FaceAlpha',0.2);
h2000 = patch([dy; flipud(dy)], [RL2000(:,2); flipud(RL2000(:,3))],'y','FaceAlpha',0.2);
plot(EDL(:,1),RLEDL(:,2),'k--','Linewidth',2);
hold off

legend([h1970,h2000],'1970','2000','Location','NW');

ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Level [meters]');
title('Rainy Rule Curves');
grid;

print -dpng ../Rainy_Lake_Rule_Curves.png

%%

% Area of the Namakan Reservoir (Kabetogama, Namakan, Sand, Crane, Little
% Vermillion) (From Cohen and Radomski, 1993)
AreaNL = 25973 * 10000;

% Area of Rainy Lake (From IJC Rainy River Modeling Phase II, 2011)
AreaRL = 95770 * 10000;

VNL1970 = AreaRL*(mean(NL1970(:,2:3)')'-300);
VRL1970 = AreaRL*(mean(RL1970(:,2:3)')'-300);

VNL2000 = AreaRL*(mean(NL2000(:,2:3)')'-300);
VRL2000 = AreaRL*(mean(RL2000(:,2:3)')'-300);

QNL1970 = diff(VNL1970)/(24*3600);
QNL2000 = diff(VNL2000)/(24*3600);

QRL1970 = diff(VRL1970)/(24*3600);
QRL2000 = diff(VRL2000)/(24*3600);

figure(3);clf;
subplot(2,1,1);
plot(dy(1:end-1),QNL1970,dy(1:end-1),QNL2000,'Linewidth',2);
a1 = axis;
hold on;
plot([a1(1) a1(2)],[0 0],'k--');
hold off;
ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Net Flow [cu. meters/sec]');
title('Imputed (Inflow - Outflow) for Namakan Reservoir');
legend('1970','2000');

subplot(2,1,2)
dQNL = QNL2000 - QNL1970;
bar(dy(1:end-1),-dQNL);
a2 = axis;
ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Net Flow [cu. meters/sec]');
title('Imputed Additional Outflow from Namakan Reservoir, 1970 to 2000');

print -dpng ../Namakan_Imputed_Net_Flow.png

%%

figure(4);clf;
subplot(2,1,1);
plot(dy(1:end-1),QRL1970,dy(1:end-1),QRL2000,'Linewidth',2);
axis(a1);
hold on;
plot([a1(1) a1(2)],[0 0],'k--');
hold off;
ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Net Flow [cu. meters/sec]');
title('Imputed (Inflow - Outflow) for Rainy Lake');
legend('1970','2000');

subplot(2,1,2)
dQRL = QRL2000 - QRL1970;
bar(dy(1:end-1),-dQRL);
axis(a2)
ax = gca;
ax.XTick = mo;
datetick('x',3,'keepticks');
ylabel('Net Flow [cu. meters/sec]');
title('Imputed Additional Outflow from Rainy Lake, 1970 to 2000');

print -dpng ../Rainy_Lake_Imputed_Net_Flow.png


%% Cumulative Impact on Rainy Lake Levels

dHRL = cumsum(-24*3600*dQNL/AreaRL);

figure(5);
plot(dy(1:end-1),dHRL)



    
    
    
    