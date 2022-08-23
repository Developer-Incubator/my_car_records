import 'package:flutter/material.dart';
import 'package:my_car_records/model/database.dart';

import '../model/car.dart';

class RepairForm extends StatelessWidget {
  final String vin;
  RepairForm({Key? key, required this.vin}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final hoursController = TextEditingController();
  final odometerController = TextEditingController();
  final techController = TextEditingController();
  final workRequestedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // addRepair(vin, 2.2, "145,654", "Ray", "Oil Change and tire rotation");
    return Scaffold(
      appBar: AppBar(title: const Text("Add Repair")),
      body: Form(
          key: _formKey,
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Repair Added')),
                      );
                      addRepair(vin, double.parse(hoursController.text), odometerController.text, techController.text, workRequestedController.text);
   
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          )),
    );
  }
}
