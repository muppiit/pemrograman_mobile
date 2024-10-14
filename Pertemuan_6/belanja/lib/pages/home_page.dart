import 'package:belanja/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/item.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sugar',
        price: 5000,
        image:
            'assets/sugar.jpg',
        rating: 4,
        stok: 5,
      ),
      Item(
        name: 'Salt',
        price: 2000,
        image:
            'assets/salt.jpg',
        rating: 3,
        stok: 5,
      ),
      Item(
        name: 'MSG',
        price: 2000,
        image:
            'assets/MSG.jpg',
        rating: 5,
        stok: 5,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Belanja'),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () => context.push('/item', extra: item),
                child: ItemCard(item: item),
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }
}