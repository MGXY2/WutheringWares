import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartPage
    extends StatelessWidget {

  const CartPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final cart =
    Provider.of<CartProvider>(
      context,
    );

    return Scaffold(

      appBar: AppBar(
        title:
        const Text('Cart'),
      ),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount:
              cart.items.length,

              itemBuilder:
                  (context, index){

                final item =
                cart.items[index];

                return ListTile(

                  title:
                  Text(item.name),

                  subtitle:
                  Text(item.type),

                  trailing: Row(

                    mainAxisSize:
                    MainAxisSize.min,

                    children: [

                      Text(
                        item.price.toString(),
                      ),

                      IconButton(

                        onPressed: () {

                          cart.removeFromCart(item);
                        },

                        icon:
                        const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(

            padding:
            const EdgeInsets.all(20),

            child: Column(

              children: [

                Text(

                  'Total: ${cart.totalPrice}',

                  style: const TextStyle(

                    fontSize: 22,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(

                  width: double.infinity,

                  height: 50,

                  child: ElevatedButton(

                    onPressed: () {

                    },

                    child: const Text(
                      'Checkout',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}