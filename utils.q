accuracy: {[y;predicted] sum[y=predicted] % count y}

precision: {[y;predicted] 
	tp: sum[predicted and y];
	tp % tp + sum[predicted and not y]}

recall: {[y;predicted]
	tp: sum[predicted and y];
	tp % tp + sum[y and not predicted]}

f1score: {[y;predicted]
	tp: sum[predicted and y];
	2 * tp % (2 * tp) + sum[predicted and not y] + sum[y and not predicted]}

metrics: {[y;predicted]
	tp: sum[predicted and y];
	acc: sum[y=predicted] % count y;
	p: tp % tp + sum[predicted and not y];
	r: tp % tp + sum[y and not predicted];
	f1: 2 * p * r % p + r;
	`accuracy`precision`recall`f1score!(acc;p;r;f1)}
	