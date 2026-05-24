import 'package:flutter/material.dart';
import 'package:wuthering_wares/pages/detailEquipment_page.dart';

import '../models/equipment.dart';

class EquipmentCard
    extends StatelessWidget {

  final Equipment equipment;

  const EquipmentCard({
    super.key,
    required this.equipment,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

    onTap: () {

      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) =>

          DetailPage(
            equipment: equipment,
          ),
        ),
      );
    },

    child: Card(

      child: ListTile(

        title:
        Text(equipment.name),

        subtitle:
        Text(equipment.type),

        trailing:
        Text(
          equipment.price.toString(),
        ),
      ),
    ),
  );
  }
}