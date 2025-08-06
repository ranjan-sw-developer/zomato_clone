import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:zomato_app/constants/app_assets.dart';

class Restaurant {
  final String name;
  final String address;
  final String cuisine;
  final double rating;
  final String status;
  final Color cuisineColor;

  Restaurant({
    required this.name,
    required this.address,
    required this.cuisine,
    required this.rating,
    required this.status,
    required this.cuisineColor,
  });
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedMenuItem = 'Restaurants';
  String searchQuery = '';
  String statusFilter = 'Status';
  String cuisineFilter = 'Cuisine';
  String ratingFilter = 'Rating';

  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'The Golden Spoon',
      address: '123 Main St, Anytown',
      cuisine: 'Italian',
      rating: 4.5,
      status: 'Open',
      cuisineColor: Colors.blue.shade100,
    ),
    Restaurant(
      name: 'The Spicy Grill',
      address: '456 Oak Ave, Anytown',
      cuisine: 'Mexican',
      rating: 4.2,
      status: 'Open',
      cuisineColor: Colors.orange.shade100,
    ),
    Restaurant(
      name: 'The Cozy Corner',
      address: '789 Pine Ln, Anytown',
      cuisine: 'American',
      rating: 4.0,
      status: 'Closed',
      cuisineColor: Colors.red.shade100,
    ),
    Restaurant(
      name: 'The Fresh Catch',
      address: '101 Elm Rd, Anytown',
      cuisine: 'Seafood',
      rating: 4.7,
      status: 'Open',
      cuisineColor: Colors.teal.shade100,
    ),
    Restaurant(
      name: 'The Green Leaf',
      address: '222 Maple Dr, Anytown',
      cuisine: 'Vegetarian',
      rating: 4.3,
      status: 'Open',
      cuisineColor: Colors.green.shade100,
    ),
    Restaurant(
      name: 'The Royal Feast',
      address: '333 Cedar Ct, Anytown',
      cuisine: 'Indian',
      rating: 4.6,
      status: 'Open',
      cuisineColor: Colors.purple.shade100,
    ),
    Restaurant(
      name: 'The Quick Bite',
      address: '444 Birch Pl, Anytown',
      cuisine: 'Fast Food',
      rating: 3.8,
      status: 'Closed',
      cuisineColor: Colors.yellow.shade100,
    ),
    Restaurant(
      name: 'The Sweet Spot',
      address: '555 Willow Way, Anytown',
      cuisine: 'Desserts',
      rating: 4.4,
      status: 'Open',
      cuisineColor: Colors.pink.shade100,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 240,
            color: Colors.white,
            child: Column(
              children: [
                // Header
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'FoodAdmin',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                // Menu Items
                Expanded(
                  child: Column(
                    children: [
                      _buildMenuItem(Icons.restaurant, 'Restaurants', true),
                      _buildMenuItem(Icons.local_dining, 'Dishes', false),
                      _buildMenuItem(Icons.receipt_long, 'Orders', false),
                      _buildMenuItem(Icons.people, 'Users', false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Text(
                        'Restaurants',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add, size: 18),
                        label: Text('Add Restaurant'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Search and Filters
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    children: [
                      // Search Bar
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xFFE9ECEF)),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search restaurants...',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Filters
                      Row(
                        children: [
                          _buildDropdownFilter('Status'),
                          SizedBox(width: 16),
                          _buildDropdownFilter('Cuisine'),
                          SizedBox(width: 16),
                          _buildDropdownFilter('Rating'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Table
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFE9ECEF)),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: _buildTableHeader('NAME'),
                              ),
                              Expanded(
                                flex: 2,
                                child: _buildTableHeader('ADDRESS'),
                              ),
                              Expanded(
                                flex: 1,
                                child: _buildTableHeader('CUISINE'),
                              ),
                              Expanded(
                                flex: 1,
                                child: _buildTableHeader('RATING'),
                              ),
                              Expanded(
                                flex: 1,
                                child: _buildTableHeader('STATUS'),
                              ),
                              Expanded(
                                flex: 1,
                                child: _buildTableHeader('ACTIONS'),
                              ),
                            ],
                          ),
                        ),
                        // Table Rows
                        Expanded(
                          child: ListView.builder(
                            itemCount: restaurants.length,
                            itemBuilder: (context, index) {
                              final restaurant = restaurants[index];
                              return _buildTableRow(restaurant);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: SizedBox(
    //     width: double.infinity,
    //     height: double.infinity,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Expanded(
    //           flex: 1,
    //           child: Container(
    //             height: double.infinity,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.5),
    //                   spreadRadius: 5,
    //                 ),
    //               ],
    //             ),
    //             child: Column(
    //               children: [
    //                 Image.asset(AppAssets.logo, fit: BoxFit.fill, width: 200),
    //                 const SizedBox(height: 25),
    //                 _menuWidget(
    //                   icon: HugeIcons.strokeRoundedRestaurant01,
    //                   name: "Restaurant",
    //                   selected: true,
    //                 ),
    //                 const SizedBox(height: 15),
    //                 _menuWidget(
    //                   icon: HugeIcons.strokeRoundedDish01,
    //                   name: "Dishes",
    //                 ),
    //                 const SizedBox(height: 15),
    //                 _menuWidget(
    //                   icon: HugeIcons.strokeRoundedSendingOrder,
    //                   name: "Order",
    //                 ),
    //                 const SizedBox(height: 15),
    //                 _menuWidget(
    //                   icon: HugeIcons.strokeRoundedUserMultiple02,
    //                   name: "Users",
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 4,
    //           child: Container(
    //             height: double.infinity,
    //             color: Colors.grey.shade50,
    //             child: Text("Right Side"),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  // Widget _menuWidget({
  Widget _buildMenuItem(IconData icon, String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey.shade600,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey.shade700,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        onTap: () {
          setState(() {
            selectedMenuItem = title;
          });
        },
      ),
    );
  }

  Widget _buildDropdownFilter(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE9ECEF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey.shade500,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildTableRow(Restaurant restaurant) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF8F9FA))),
      ),
      child: Row(
        children: [
          // Name
          Expanded(
            flex: 2,
            child: Text(
              restaurant.name,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Address
          Expanded(
            flex: 2,
            child: Text(
              restaurant.address,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          ),
          // Cuisine
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: restaurant.cuisineColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                restaurant.cuisine,
                style: TextStyle(
                  color: _getCuisineTextColor(restaurant.cuisine),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Rating
          Expanded(
            flex: 1,
            child: Text(
              restaurant.rating.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Status
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: restaurant.status == 'Open'
                    ? Colors.green.shade50
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                restaurant.status,
                style: TextStyle(
                  color: restaurant.status == 'Open'
                      ? Colors.green.shade700
                      : Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Actions
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCuisineTextColor(String cuisine) {
    switch (cuisine) {
      case 'Italian':
        return Colors.blue.shade700;
      case 'Mexican':
        return Colors.orange.shade700;
      case 'American':
        return Colors.red.shade700;
      case 'Seafood':
        return Colors.teal.shade700;
      case 'Vegetarian':
        return Colors.green.shade700;
      case 'Indian':
        return Colors.purple.shade700;
      case 'Fast Food':
        return Colors.yellow.shade700;
      case 'Desserts':
        return Colors.pink.shade700;
      default:
        return Colors.grey.shade700;
    }
  }
}
