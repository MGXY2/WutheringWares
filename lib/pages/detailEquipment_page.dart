import 'package:flutter/material.dart';
import '../models/equipment.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class DetailPage
    extends StatelessWidget {

  final Equipment equipment;

  const DetailPage({
    super.key,
    required this.equipment,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          equipment.name,
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(

              height: 200,

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.grey[300],

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: const Icon(

                Icons.inventory_2,

                size: 100,
              ),
            ),

            const SizedBox(height: 20),

            Text(

              equipment.name,

              style: const TextStyle(

                fontSize: 28,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              'Type: ${equipment.type}',

              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              'Price: ${equipment.price}',

              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            const Text(

              'Description',

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(

              'A legendary equipment from Wuthering Waves.',

              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(equipment);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(

                    const SnackBar(

                      content:
                      Text(
                        'Added To Cart',
                      ),
                    ),
                  );

                },

                child: const Text(

                  'Add To Cart',

                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}