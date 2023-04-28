import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/fb/car_reat_time.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/utils/sharedprefs.dart';
import 'package:my_car_records/views/vehicle/car_forms/ios_form.dart';

/// form to input car information to save records about the car
// need to check vin for length as well as make a drop down with all the dent manufacturers and all of there products
class CarForm extends StatefulWidget {
  const CarForm({Key? key, required this.refresh}) : super(key: key);

  final Function refresh;
  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final formKey = GlobalKey<FormState>();
  final vinController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final ownerController = TextEditingController();
  final odometerController = TextEditingController();

  Vehicle? vehicle;
  late User user = SharedPrefs.getUser()!;

  @override
  void dispose() {
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    vinController.dispose();
    ownerController.dispose();

    super.dispose();
  }

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IOSCarForm(
            user: user,
            formKey: formKey,
            vinController: vinController,
            makeController: makeController,
            modelController: modelController,
            yearController: yearController,
            ownerController: ownerController,
            odometerController: odometerController,
            refresh: widget.refresh)
        : Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // TextFormFields for all vehicle information
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "VIN",
                      hintText: "Vehicle Identification Number",
                    ),
                    controller: vinController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: makeController,
                    decoration: const InputDecoration(
                      labelText: "Make",
                      hintText: "Manufacturer",
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
                    controller: modelController,
                    decoration: const InputDecoration(
                      labelText: "Model",
                      hintText: "Product",
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
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: "Year",
                      hintText: "Year the vehicle was produced",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: ownerController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Owner",
                      hintText: "Owner of the vehicle",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  // submit button to add a car
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Car Added')),
                            );

                            addCar(
                                vinController.text,
                                int.parse(yearController.text),
                                makeController.text,
                                modelController.text,
                                ownerController.text.isNotEmpty
                                    ? ownerController.text
                                    : "N/A");

                            widget.refresh();

                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
