import numpy as np
import torch

from LSTMNet import LSTMNet, LSTMExtractor


def _is_anomaly(data: dict, model, anomaly_thresholds, means, stds):
	"""

	:param data: Un-normalized data
	:param model: Time series forecasting model
	:param anomaly_thresholds: Thresholds for anomaly detection, normalized (divided by stds)
	:param means: Means of the dataset for normalization
	:param stds: Standard deviations of the dataset for normalization
	:return: True if an anomaly is detected, False otherwise
	"""
	data = np.array([data[key] for key in data.keys()]).transpose(1, 0)
	if (shape := data.shape) != (16, 3):
		print(f"Data shape must be (16, 3). Got {shape} instead.")
		return False
	data = (data - means) / stds
	with torch.no_grad():
		output = model(torch.from_numpy(data[:-1]).reshape(1, 15, 3).float())[0]
		return (np.abs(data[-1] - output.numpy()) > anomaly_thresholds).any()


model = LSTMNet(3, 3)
model.load_state_dict(torch.load('../models/forecasting_lstm_model.pt'))
anomaly_thresholds = np.load('../models/thresholds.npy')
means, stds = np.load('../data/means.npy'), np.load('../data/stds.npy')


def is_anomaly(data):
	return _is_anomaly(data, model, anomaly_thresholds, means, stds)


print("Python environment set up successfully. Model loaded.")
