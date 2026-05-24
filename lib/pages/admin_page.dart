import 'package:flutter/material.dart';
import 'package:wuthering_wares/pages/addEquipment_page.dart';


class AdminPage
    extends StatelessWidget {

  const AdminPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text('Admin Page'),
      ),

      floatingActionButton:

      FloatingActionButton(

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const AddEquipmentPage(),
            ),
          );
        },

        child:
        const Icon(Icons.add),
      ),

      body: const Center(

        child:
        Text(
          'Admin Equipment List',
        ),
      ),
    );
  }
}