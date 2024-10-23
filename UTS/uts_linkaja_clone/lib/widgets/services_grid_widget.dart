import 'package:flutter/material.dart';

class ServicesGridWidget extends StatelessWidget {
  final List<IconData> icons = [
    Icons.phone_android,
    Icons.electric_bolt,
    Icons.tv,
    Icons.credit_card,
    Icons.church,
    Icons.question_answer,
    Icons.redeem,
    Icons.more_horiz,
  ];

  final List<String> labels = [
    'Pulsa/Data',
    'Electricity',
    'Cable TV\n& Internet',
    'Kartu Uang\nElektronik',
    'Gereja',
    'Infaq',
    'Other\nDonations',
    'More',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5), // Grey color with 50% opacity
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return _buildServiceItem(icons[index], labels[index]);
        },
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}