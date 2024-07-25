import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# === OPENING DATA ===

data = pd.read_csv("data/data.csv")
data["timestamp"] = pd.to_datetime(data["timestamp"])
variables = ['temperature', 'pressure', 'vibration', 'power']

# === PROCESSING ===

t = 10
mavg = data[variables].rolling(t).sum() / t
ewm = data[variables].ewm(com=.5).mean()

# === PLOTTING ===

fig, axs = plt.subplots(4, 1, figsize=(14, 20), sharex=True)
titles = ['Temperature (°C)', 'Pressure (kPa)', 'Vibration (mm/s)', 'Power Consumption (kW)']

for i, (var, title) in enumerate(zip(variables, titles)):
    anomalous_data = data[data["anomaly"] == (i + 1)]
    axs[i].plot(data['timestamp'], data[var])
    axs[i].set_title(title)
    axs[i].set_ylabel('Value')
    axs[i].plot(anomalous_data["timestamp"], anomalous_data[var], marker='o', ms=4, linestyle='', color='red')

plt.legend()
plt.tight_layout()
plt.show()
