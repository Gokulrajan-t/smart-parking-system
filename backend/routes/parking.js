const express = require("express");
const router = express.Router();

const parkingController = require("../controllers/parkingController");

// POST → NodeMCU sends data
router.post("/update", parkingController.updateParking);

// GET → Flutter fetches data
router.get("/status", parkingController.getParkingStatus);

module.exports = router;