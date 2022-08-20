import 'package:flutter/material.dart';

import '../model/database.dart';

/// form to input car information to save records about the car
// need to check vin for length as well as make a drop down with all the dent manufacturers and all of there products
class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final _formKey = GlobalKey<FormState>();
  final vinController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final ownerController = TextEditingController();

  @override
  void dispose() {
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    vinController.dispose();
    ownerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Car")),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Add TextFormFields and ElevatedButton here.
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Car Added')),
                      );
                 
                      addCar(
                          vinController.text,
                          int.parse(yearController.text),
                          makeController.text,
                          modelController.text,
                          ownerController.text);

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
