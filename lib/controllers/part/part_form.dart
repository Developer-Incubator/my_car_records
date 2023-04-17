import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_car_records/views/vehicle/utils/ios/ios_part_form.dart';

class PartForm extends StatelessWidget {
  PartForm(
      {Key? key,
      required this.vehicleID,
      required this.repairId,
      required refresh})
      : super(key: key);
  final String vehicleID;
  final String repairId;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // addRepair(vin, 2.2, "145,654", "Ray", "Oil Change and tire rotation");
    return Platform.isIOS
        ? IOSPartForm(
            formKey: formKey,
            nameController: nameController,
            priceController: priceController,
            quantityController: quantityController,
            repairId: repairId,
            vehicleID: vehicleID,
          )
        : Form(
            key: formKey,
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
                  // TextFormField(
                  //   controller: workRequestedController,
                  //   decoration: const InputDecoration(
                  //     labelText: "Work Requested",
                  //     hintText: "What you asked the technition to look into",
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter some text';
                  //     }
                  //     return null;
                  //   },
                  // ),

                  // submit button to add a car
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Repair Added')),
                        );
                        // addPart(
                        //   vin,
                        //   repairId,
                        //   nameController.text,
                        //   int.parse(quantityController.text),
                        //   double.parse(priceController.text),
                        // );

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
