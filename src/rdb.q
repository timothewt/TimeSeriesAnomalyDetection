/
Real-time Database script
Used to store the data received from the tickerplant and provide it to the anomaly detection script
\

/ Subscribes to the tickerplant
\p 5011

/ rdb table
data:([]timestamp:();temperature:();pressure:();power:())

/ Functions
on_incoming_data: {[timestamp;temperature;pressure;power]
	upsert[`data;(timestamp;temperature;pressure;power)]}

get_n_last_rows:{[n;callback]
	if[count data >= n; (neg .z.w) (callback;(neg n)#data)]}
