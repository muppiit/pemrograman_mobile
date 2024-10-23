import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Account Type', 'FULL SERVICE', true),
          _buildProfileMenuItem('Account Settings', '', true),
          _buildProfileMenuItem('LinkAja Syariah', 'Not Active', true),
          _buildProfileMenuItem('Payment Method', '', true),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Email', 'achmadmufid.tbn@gmail.com', true),
          _buildProfileMenuItem('Security Question', 'Set', true),
          _buildProfileMenuItem('PIN Settings', '', true),
          _buildProfileMenuItem('Language', 'English', true),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Terms of Service', '', true),
          _buildProfileMenuItem('Privacy Policy', '', true),
          _buildProfileMenuItem('Help Center', '', true),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: 4,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between items
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Achmad Mufid',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '2241720159',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(width: 16), // Space between text and avatar
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/pp.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(String title, String value, bool showArrow) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(color: Colors.grey),
            ),
          if (showArrow)
            Icon(Icons.chevron_right, color: Colors.red)
          else
            SizedBox(width: 24),
        ],
      ),
      onTap: () {
        // Handle menu item tap
      },
    );
  }
}
