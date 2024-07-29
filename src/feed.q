/ Opening the data file
data: ("ZFFF";enlist",") 0:`:../data/data.csv
len: count data
curr_idx: 0

/ Functions to feed the data to the tickerplant
feed: {[h;row]
    h(`upd;row);
    curr_idx+: 1;
    if[curr_idx = len; curr_idx-: len];}

/ Opening the connection
h: neg hopen `::4242

/ Feeding the data to the tickerplant
\t 1000
.z.ts:{feed[h; data[curr_idx]]}
