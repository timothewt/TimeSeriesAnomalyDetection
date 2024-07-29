/ Real-time data from the data feed
rdb:flip `timestamp`temperature`pressure`power!()

upd:{[row]
  show (row)}

/ Subscribe to the data feed
\p 4242
