import 'package:flutter/material.dart';
import '../screens/store_details_screen.dart';

class StoreCard extends StatelessWidget {
  final dynamic store;

  const StoreCard({
    super.key,
    required this.store
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final name = store['tags']?['name'] ?? 'Unnamed Store';
    final address = store['tags']?['addr:street'] ?? 'No street address';
    final city = store['tags']?['addr:city'] ?? 'No city';
    final postcode = store['tags']?['addr:postcode'] ?? 'No postcode';

    return SizedBox(
      width: double.infinity,
      height: 260.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => StoreDetailsScreen(store: store),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 148.0,

                // Replace with Ink.image for store image
                child: Ink(color: colorScheme.tertiary),
              ),

              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.0,
                  children: [
                    Text(
                      name,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '$address, $city, $postcode',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4.0,
                      children: [
                        Icon(
                          Icons.place,
                          size: 14.0,
                          color: colorScheme.secondary,
                        ),

                        Text(
                          '300m away',
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}