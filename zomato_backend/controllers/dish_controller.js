const Dish = require("../models/Dish");

exports.addDish = async (req, res) => {
  const { name, price, description, image, restaurantId } = req.body;
  try {
    const dish = new Dish({ name, price, description, image, restaurantId });
    await dish.save();
    res.status(201).json({ message: "Dish added successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getDishesByRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  try {
    const dishes = await Dish.find({ restaurantId });
    res.json(dishes);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
