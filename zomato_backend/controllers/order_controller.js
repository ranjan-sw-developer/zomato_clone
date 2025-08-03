const Order = require("../models/Order");
const Dish = require("../models/Dish");

exports.placeOrder = async (req, res) => {
  const { restaurantId, items } = req.body;
  const customerId = req.user.id;

  try {
    // Calculate total
    let totalAmount = 0;
    for (let item of items) {
      const dish = await Dish.findById(item.dishId);
      if (!dish) return res.status(404).json({ message: "Dish not found" });
      totalAmount += dish.price * item.quantity;
    }

    const order = new Order({
      customerId,
      restaurantId,
      items,
      totalAmount,
    });

    await order.save();
    res.status(201).json({ message: "Order placed successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getOrdersByUser = async (req, res) => {
  const customerId = req.user.id;
  try {
    const orders = await Order.find({ customerId })
      .populate("restaurantId")
      .populate("items.dishId");
    res.json(orders);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
