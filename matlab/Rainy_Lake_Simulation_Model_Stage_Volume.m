%% Rainy Lake Simulation Model


%% Rainy Lake Stage-Volume

hRL_data = [335.0 336.0 336.5 337.0 337.5 338.0 339.0 340.0];
vRL_data = [112.67 798.00 1176.42 1577.25 2002.06 2450.57 3416.85 4458.97];

plot(hRL_data,vRL_data,'b.','Markersize',25);

hRL = @(v) interp1(vRL_data,hRL_data,v,'PCHIP');

hold on
vRL = linspace(min(vRL_data),max(vRL_data));
plot(hRL(vRL),vRL,'r--');
hold off;

title('Rainy Lake Stage-Volume')
xlabel('Elevation [meters]');
ylabel('Volume [km^3]');

%% Rainy Lake Stage-Discharge

hQ = [335.40, 336.00, 336.50, 336.75, 337.00, 337.25, ...
    337.50, 337.75, 338.00, 338.50, 339.00, 339.50, 340.00];

qQ = [0 399 425 443 589 704 792 909 1014 1156 1324 1550 1778];


Qdata = [ 
    335.40,    0;
    336.00,  399;
    336.50,  425;
    336.75,  443;
    337.00,  589;
    337.25,  704;
    337.50,  792;
    337.75,  909;
    338.00, 1014;
    338.50, 1156;
    339.00, 1324;
    339.50, 1550;
    340.00, 1778];

qRL = @(h) interp1(Qdata(:,1),Qdata(:,2),h);

plot(Qdata(:,2),Qdata(:,1),'b.','Markersize',25);
hold on;
h = linspace(min(Qdata(:,1)),max(Qdata(:,1)));
plot(qRL(h),h,'r--');
hold off;

title('Rainy Lake Stage-Discharge');
xlabel('Discharge [m^3/sec]');
ylabel('Elevation [meters]');




