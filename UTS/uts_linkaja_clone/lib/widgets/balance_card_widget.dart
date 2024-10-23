import 'package:flutter/material.dart';

class BalanceCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.only(right: 4, left: 4, top: 70),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 24, 24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(children: [
            SizedBox(width: 5),
            Text('Hi, Achmad Mufid 2241720159',
                style: TextStyle(fontSize: 15, color: Colors.white))
          ]),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCard('Your Balance', 'Rp 69.696', Icons.arrow_forward),
              SizedBox(width: 10),
              _buildCardWithCoin('Bonus Balance', '888', Icons.arrow_forward), // Use new function for bonus balance
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String balance, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 85, 75, 75))),
              SizedBox(height: 2),
              Text(balance,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          // Icon with smaller red circular background
          Container(
            padding: EdgeInsets.all(4), // Reduced padding for smaller size
            decoration: BoxDecoration(
              color: Colors.red, // Background color of the circle
              shape: BoxShape.circle, // Make it circular
            ),
            child: Icon(icon, color: Colors.white, size: 16), // Smaller icon size
          ),
        ],
      ),
    );
  }

  // New function to build card with coin icon
  Widget _buildCardWithCoin(String title, String balance, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 85, 75, 75))),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.monetization_on, color: const Color.fromARGB(255, 255, 217, 0), size: 16), // Coin icon
                  SizedBox(width: 4), // Spacing between icon and text
                  Text(balance,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          // Icon with smaller red circular background
          Container(
            padding: EdgeInsets.all(4), // Reduced padding for smaller size
            decoration: BoxDecoration(
              color: Colors.red, // Background color of the circle
              shape: BoxShape.circle, // Make it circular
            ),
            child: Icon(icon, color: Colors.white, size: 16), // Smaller icon size
          ),
        ],
      ),
    );
  }
}
