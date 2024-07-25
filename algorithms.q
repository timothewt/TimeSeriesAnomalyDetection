ema_threshold: {[data;lookback_size;threshold]
	any flip (ratios (2 % 1 + lookback_size) ema data) > 1 + threshold}