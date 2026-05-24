import 'package:flutter/material.dart';

class AddEquipmentPage
    extends StatefulWidget {

  const AddEquipmentPage({
    super.key
  });

  @override
  State<AddEquipmentPage>
  createState() =>
      _AddEquipmentPageState();
}

class _AddEquipmentPageState
    extends State<AddEquipmentPage> {

  final nameController =
  TextEditingController();

  final typeController =
  TextEditingController();

  final priceController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          'Add Equipment',
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller:
              nameController,

              decoration:
              const InputDecoration(
                labelText: 'Name',
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              typeController,

              decoration:
              const InputDecoration(
                labelText: 'Type',
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              priceController,

              decoration:
              const InputDecoration(
                labelText: 'Price',
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                },

                child: const Text(
                  'Add Equipment',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}