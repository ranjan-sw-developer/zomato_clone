const Restaurant = require("../models/Restaurant");

exports.addRestaurant = async (req, res) => {
  const { name, description, address, image } = req.body;
  try {
    const restaurant = new Restaurant({ name, description, address, image });
    await restaurant.save();
    res.status(201).json({ message: "Restaurant added successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getAllRestaurants = async (req, res) => {
  try {
    const restaurants = await Restaurant.find();
    res.json(restaurants);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
