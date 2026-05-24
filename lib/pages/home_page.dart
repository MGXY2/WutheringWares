import 'package:flutter/material.dart';
import 'package:wuthering_wares/widgets/equipment_card.dart';
import '../models/equipment.dart';
import '../services/equipment_service.dart';
import 'cart_page.dart';

class HomePage
    extends StatefulWidget {

  const HomePage({
    super.key
  });

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  late Future<List<Equipment>>
  futureEquipments;

  @override
  void initState() {

    super.initState();

    futureEquipments =
        EquipmentService
            .getEquipments();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Wuthering Wares',
        ),
        actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (_) => const CartPage(),
                ),
              );
            },
              icon:
            const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),

      body: FutureBuilder<

          List<Equipment>

      >(

        future: futureEquipments,

        builder:
            (context, snapshot) {

          if(snapshot.connectionState
          == ConnectionState.waiting){

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError){

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final equipments =
              snapshot.data!;

          return ListView.builder(

            itemCount:
            equipments.length,

            itemBuilder:
                (context, index){

              final equipment =
              equipments[index];

              return EquipmentCard(
                equipment: equipment,
               );
            },
          );
        },
      ),
    );
  }
}