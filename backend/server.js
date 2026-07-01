const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

// SIMPLE DATA
let parkingData = {
  slots: [
    { id: "P1", status: "FREE", distance: 0 }, // REAL
    { id: "P2", status: "FREE" },
    { id: "P3", status: "OCCUPIED" },
    { id: "P4", status: "FREE" }
  ]
};

// NodeMCU sends here
app.post("/api/parking/update", (req, res) => {
  const { status, distance } = req.body;

  parkingData.slots[0] = {
    id: "P1",
    status,
    distance
  };

  console.log("Updated:", parkingData.slots[0]);

  res.send("OK");
});

// Flutter reads here
app.get("/api/parking/status", (req, res) => {
  res.json(parkingData);
});

app.listen(3000, () => console.log("Server running"));