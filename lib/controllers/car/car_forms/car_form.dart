import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/model/db/car_reat_time.dart';
import 'package:my_car_records/model/vin_decoder.dart';

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
  Car? vehicle;

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
        ? SafeArea(
            child: Form(
              key: formKey,
              // header: const Text("Add a Vehicle"),
              child: Stack(
                children: <Widget>[
                  // TextFormFields for all vehicle information
                  Align(
                    alignment: const Alignment(0, -.8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "Add a Vehicle",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Text(
                              "Choose to add a vehicle either by: Searching for the VIN to get your vehicles information or enter it in manualy")
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CupertinoTextField(
                              controller: vinController,
                              prefix: const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("Vin:"),
                              ),
                              suffix: CupertinoButton(
                                child: const Text("Search"),
                                onPressed: () async {
                                  try {
                                    vehicle = await VinDecoder()
                                        .decodeVin(vinController.text);

                                    if (vehicle != null) {
                                      setState(() {
                                        makeController.text =
                                            vehicle?.make ?? "N/A";
                                        modelController.text =
                                            vehicle?.model ?? "N/A";
                                        yearController.text =
                                            vehicle?.modelYear ?? "N/A";
                                      });
                                    }
                                  } catch (e) {
                                    debugPrint(e.toString());
                                  }

                                  // Navigator.pop(context);
                                },
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: MyColorScheme.blueGrey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CupertinoTextField(
                              controller: makeController,
                              prefix: const Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0, top: 14, bottom: 14),
                                child: Text("Make:"),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColorScheme.blueGrey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CupertinoTextField(
                              controller: modelController,
                              prefix: const Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0, top: 14, bottom: 14),
                                child: Text("Model:"),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColorScheme.blueGrey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CupertinoTextField(
                              controller: yearController,
                              prefix: const Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0, top: 14, bottom: 14),
                                child: Text("Year:"),
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: MyColorScheme.blueGrey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoButton(
                          color: CupertinoColors.destructiveRed,
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoButton(
                          color: CupertinoColors.activeGreen,
                          child: const Text("Submit"),
                          onPressed: () {
                            vehicle ??= Car(
                                make: makeController.text,
                                model: modelController.text,
                                modelYear: yearController.text);

                            CarDB().add(vehicle);
                            Navigator.pop(context);
                            widget.refresh();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
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
                                ownerController.text);

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
