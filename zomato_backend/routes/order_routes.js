const express = require("express");
const router = express.Router();
const {
  placeOrder,
  getOrdersByUser,
} = require("../controllers/order_controller");
const { verifyCustomer } = require("../middlewares/auth_middleware");

router.post("/", verifyCustomer, placeOrder);
router.get("/", verifyCustomer, getOrdersByUser);

module.exports = router;
