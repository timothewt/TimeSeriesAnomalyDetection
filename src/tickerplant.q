/
Tickerplant script
Used to receive data from the feed and provide it to the real-time database and the anomaly detection script
\

/ Subscribe to the data feed
\p 5010

/ Connections to the sub-processes
h_rdb: neg hopen `::5011
h_ad: neg hopen `::5012

/ Functions
send_to_ad:{[table_data]
	h_ad(`check_anomaly;table_data);}

upd:{[timestamp;temperature;pressure;power]
  h_rdb(`on_incoming_data;timestamp;temperature;pressure;power);
  h_rdb(`get_n_last_rows;16;`send_to_ad);}
