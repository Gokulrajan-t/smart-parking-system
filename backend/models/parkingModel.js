let parkingData = {
  slots: [
    { id: "P1", status: "FREE", distance: 0 },   // REAL (sensor)
    { id: "P2", status: "FREE" },               // FAKE
    { id: "P3", status: "OCCUPIED" },           // FAKE
    { id: "P4", status: "FREE" }                // FAKE
  ]
};

module.exports = {
  getData: () => parkingData,

  updateSlot1: (status, distance) => {
    parkingData.slots[0] = {
      id: "P1",
      status,
      distance
    };
  }
};