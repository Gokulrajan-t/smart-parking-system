const parkingModel = require("../models/parkingModel");

// Receive data from NodeMCU
exports.updateParking = (req, res) => {
  const data = req.body;

  if (!data) {
    return res.status(400).json({ message: "No data received" });
  }

  parkingModel.updateData(data);

  console.log("Updated:", data);

  res.json({ message: "Data updated successfully" });
};

// Send data to Flutter
exports.getParkingStatus = (req, res) => {
  const data = parkingModel.getData();
  res.json(data);
};