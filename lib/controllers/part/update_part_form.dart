import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/part_real_time.dart';

/// updates information about a part and refreshes the state to update the page to display the correct information.
///
/// [vin] vehicle id
/// [repairId] id of the repair that the parts are a part of.
/// [partId] unique id of the part.
/// [name] name of the part with the manufacturer.
/// [quantity] number of this part that is needed.
/// [unitPrice] price of a individual part.
/// [refresh] refreshes thre state of the page to the current information
class UpdatePartForm extends StatelessWidget {
  final String vin;
  final String repairId;
  final String partId;
  final String name;
  final int quantity;
  final double unitPrice;
  final Function refresh;

  UpdatePartForm({
    Key? key,
    required this.vin,
    required this.repairId,
    required this.refresh,
    required this.partId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    quantityController.text = quantity.toString();
    priceController.text = unitPrice.toString();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // TextFormFields for all vehicle information
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Part Name:",
                hintText: "Part name and manufacturer",
              ),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              controller: quantityController,
              decoration: const InputDecoration(
                labelText: "Quantity",
                hintText: "Amount of these items needed",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: const InputDecoration(
                labelText: "Price",
                hintText: "Price of one of these items",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            // submit button to add a car
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Part Updated')),
                  );

                  updatePart(
                      vin,
                      repairId,
                      partId,
                      nameController.text,
                      int.parse(quantityController.text),
                      double.parse(priceController.text));

                  Navigator.pop(context);
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
