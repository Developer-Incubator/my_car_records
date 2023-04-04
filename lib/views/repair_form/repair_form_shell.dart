import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/views/repair_form/ios_repair_form.dart';
import 'package:my_car_records/model/db/repair_real_time.dart';

/// form to create a repair on a car assigning the hours it takes to perform the repair, the current milege on the vehicle at time of repair, the techs name that performed the repairs, and the work that was requested by the customer.
///
/// [vin] vehicle id,
/// [refresh] refreshes the state of the page ato display the correct information.

// ignore: must_be_immutable
class RepairForm extends StatelessWidget {
  RepairForm({
    Key? key,
    required this.carID,
    required this.refresh,
    this.vin,
  }) : super(key: key);

  final String? vin;
  final String carID;
  final Function refresh;

  final formKey = GlobalKey<FormState>();
  final hoursController = TextEditingController();
  final laborController = TextEditingController();
  final odometerController = TextEditingController();
  final techController = TextEditingController();
  final workRequestedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // addRepair(vin, 2.2, "145,654", "Ray", "Oil Change and tire rotation");
    return Platform.isIOS
        ? IOSRepairForm(
            vehicleID: carID,
            refresh: refresh,
            formKey: formKey,
            hoursController: hoursController,
            laborController: laborController,
            odometerController: odometerController,
            techController: techController,
            workRequestedController: workRequestedController)
        : Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // TextFormFields for all vehicle information
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Hours",
                      hintText: "Hours to complete work",
                    ),
                    controller: hoursController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Labor",
                      hintText: "Price of the Technititon",
                    ),
                    controller: laborController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: odometerController,
                    decoration: const InputDecoration(
                      labelText: "Odometer",
                      hintText: "Miles on vehicle",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: techController,
                    decoration: const InputDecoration(
                      labelText: "Technition",
                      hintText: "Person who performed repairs",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: workRequestedController,
                    decoration: const InputDecoration(
                      labelText: "Work Requested",
                      hintText: "What you asked the technition to look into",
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
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Repair Added')),
                        );
                        // addRepair(
                        //     vin,
                        //     double.parse(hoursController.text),
                        //     double.parse(laborController.text),
                        //     odometerController.text,
                        //     techController.text,
                        //     workRequestedController.text);

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
