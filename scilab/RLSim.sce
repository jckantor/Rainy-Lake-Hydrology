
M = csvRead('../data/RLdatenum.csv');

RLstage.time = M(2:size(M,1),3) - datenum(1969,12,31);
RLstage.values = M(2:size(M,1),2);

M = csvRead('../data/RLinflow.csv');
RLinflow.time = M(2:size(M,1),3) - datenum(1969,12,31);
RLinflow.values = M(2:size(M,1),2);

M = csvRead('../data/RRflow.csv');
RRflow.time = M(2:size(M,1),3) - datenum(1969,12,31);
RRflow.values = M(2:size(M,1),2);
