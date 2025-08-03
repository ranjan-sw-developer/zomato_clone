const express = require("express");
const router = express.Router();
const {
  addDish,
  getDishesByRestaurant,
} = require("../controllers/dish_controller");
const { verifyAdmin } = require("../middlewares/auth_middleware");

router.post("/", verifyAdmin, addDish);
router.get("/:restaurantId", getDishesByRestaurant);

module.exports = router;
