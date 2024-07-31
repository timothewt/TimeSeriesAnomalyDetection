/
Feed simulation script
Used to simulate a data feed to the tickerplant using the data from the data.csv file
\

/ Opening the data file
data: ("ZFFF";enlist",") 0:`:../data/data.csv
len: count data
curr_idx: 0

/ Functions to feed the data to the tickerplant
feed: {[h;timestamp;temperature;pressure;power]
		h(`upd;timestamp;temperature;pressure;power);
    curr_idx+: 1;
    if[curr_idx >= len; curr_idx-: curr_idx]}

/ Tickplant connection
h: neg hopen `::5010

/ Feeding the data to the tickerplant each 0.1 second
\t 100
.z.ts:{feed[h; data[curr_idx]`timestamp; data[curr_idx]`temperature; data[curr_idx]`pressure; data[curr_idx]`power]}
