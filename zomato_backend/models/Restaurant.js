const mongoose = require("mongoose");

const restaurantSchema = new mongoose.Schema(
  {
    name: String,
    description: String,
    address: String,
    image: String,
  },
  { timestamps: true }
);

module.exports = mongoose.model("Restaurant", restaurantSchema);
