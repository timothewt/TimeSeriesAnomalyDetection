from torch import nn, tensor


class LSTMExtractor(nn.Module):
	def __init__(self):
		super().__init__()

	def forward(self, lstm_out: tensor) -> tensor:
		return lstm_out[0][:, -1, :]


class LSTMNet(nn.Module):
	def __init__(self, input_size: int, output_size: int, hidden_size: int = 16, num_layers: int = 2):
		super().__init__()
		self.net = nn.Sequential(
			nn.LSTM(input_size, hidden_size, num_layers, batch_first=True),
			LSTMExtractor(),
			nn.ReLU(),
			nn.Linear(hidden_size, hidden_size),
			nn.ReLU(),
			nn.Linear(hidden_size, output_size), )

	def forward(self, x: tensor) -> tensor:
		return self.net(x)
