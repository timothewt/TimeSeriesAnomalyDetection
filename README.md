# Real-Time Anomaly Detection for Multivariate Time Series

This project tackles real-time anomaly detection for multivariate time series data.
It leverages the strengths of both q/KDB+ and Python
to achieve efficient data processing and anomaly identification in a streaming environment.

### Key Features

* **Real-Time Processing:** Data is ingested and analyzed continuously, enabling immediate detection of anomalies.
* **Multivariate Anomaly Detection:** Handles data with multiple features (e.g., temperature, pressure, power) to identify unusual patterns across dimensions.
* **Tick Architecture:** Data flows through a central "tickerplant" for efficient distribution to subscribers like real-time databases and anomaly detection engines.
* **Forecasting-Based Anomaly Detection:** A pre-trained model forecasts future values based on past observations. Significant deviations between predicted and actual values are flagged as anomalies.

### System Components

* **Feed Simulation Script (q/KDB+):** Simulates a data feed by reading and sending data points from a CSV file at a regular interval.
* **Tickerplant Script (q/KDB+):** Acts as a central hub, subscribing to the data feed and broadcasting data to connected subscribers.
* **Real-time Database Script (q/KDB+):** Receives data from the tickerplant and stores it for future retrieval or analysis.
* **Anomaly Detection Script (Python):** Subscribes to the tickerplant, utilizes a pre-trained forecasting model (loaded from files), and identifies anomalies based on forecasting errors. Logs anomalies for further investigation.

### Usage

1. **Install Dependencies:** Ensure q/KDB+ and Python libraries (NumPy, Pandas, Matplotlib, PyTorch, EmbedPy) are installed.
2. **Prepare Data:**
    * Data is expected in a specific CSV format.
    * Pre-compute normalization parameters and train the forecasting model using provided scripts or alternative methods.
3. **Run the System:**
    * Execute `src/run.bat` to start the data feed, tickerplant, database, and anomaly detection scripts sequentially.

This README provides a comprehensive overview. Refer to the individual scripts for detailed implementation specifics.
