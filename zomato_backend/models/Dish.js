const mongoose = require("mongoose");

const dishSchema = new mongoose.Schema(
  {
    name: String,
    price: Number,
    description: String,
    image: String,
    restaurantId: { type: mongoose.Schema.Types.ObjectId, ref: "Restaurant" },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Dish", dishSchema);
