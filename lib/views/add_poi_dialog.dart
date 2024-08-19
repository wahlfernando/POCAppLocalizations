import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/poi.dart';
import '../view_model/poi_view_model.dart';

class AddPOIDialog extends StatelessWidget {
  final LatLng position;
  final POIViewModel viewModel = Get.find();

  AddPOIDialog({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    String category = "Restaurante";

    return AlertDialog(
      title: const Text('Adicionar POI'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição'),
          ),
          DropdownButton<String>(
            value: category,
            items: <String>['Restaurante', 'Parque', 'Loja']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              category = newValue!;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Salvar'),
          onPressed: () {
            final poi = POI(
              id: DateTime.now().toString(),
              title: titleController.text,
              description: descriptionController.text,
              category: category,
              latitude: position.latitude,
              longitude: position.longitude,
            );
            viewModel.addPOI(poi);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
