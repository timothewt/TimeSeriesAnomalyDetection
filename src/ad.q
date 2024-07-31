/
Anomaly detection script
Called at each new data to perform anomaly detection
\

/ Subscribe to the tickerplant
\p 5012

/ Import EmbedPy libary
\l p.q

/ Logs
anomalies: ([]timestamp:();temperature:();pressure:();power:())
log_file_path: `:../logs/anomalies.csv

/ Python imports
is_anomaly:.p.import[`anomaly_detector]`:is_anomaly

/ Function called at each update; checks if the new data is an anomaly and logs it if it is
check_anomaly:{[data]
	if[is_anomaly[select temperature, pressure, power from data]`;
		show "Anomaly detected at ", string last data`timestamp;
		upsert[`anomalies;last data];
		log_file_path 0: "," 0: anomalies;]}
