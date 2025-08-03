const express = require("express");
const router = express.Router();
const {
  addRestaurant,
  getAllRestaurants,
} = require("../controllers/restaurant_controller");
const { verifyAdmin } = require("../middlewares/auth_middleware");

router.post("/", verifyAdmin, addRestaurant);
router.get("/", getAllRestaurants);

module.exports = router;
