\l utils.q

\l load_data.q

lookback_size: 10

t: update
	tempareture_mavg: lookback_size mavg temperature,
	pressure_mavg: lookback_size mavg pressure,
	vibration_mavg: lookback_size mavg vibration,
	power_mavg: lookback_size mavg power 
	from t
