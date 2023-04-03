// need to check vin for length as well as make a drop down with all the dent manufacturers and all of there products
import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/car_reat_time.dart';

/// updates information about a car and refreshes the state to update the page to display the correct information.
/// 
/// [refresh] resets state to show the correct info
/// [vin] vehicle id
/// [year] year the vehicle was produced
/// [make] manufacture of the vehicle
/// [model] product of the manufacturer
/// [owner] owner of the vehicle 
class CarUpdateForm extends StatefulWidget {
  const CarUpdateForm({
    Key? key,
    required this.refresh,
    required this.vin,
    required this.year,
    required this.make,
    required this.model,
    required this.owner,
  }) : super(key: key);

  final Function refresh;
  final String vin;
  final int year;
  final String make;
  final String model;
  final String owner;

  @override
  State<CarUpdateForm> createState() => _CarUpdateFormState();
}

class _CarUpdateFormState extends State<CarUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final vinController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final ownerController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    vinController.text = widget.vin;
    makeController.text = widget.make;
    modelController.text = widget.model;
    yearController.text = widget.year.toString();
    ownerController.text = widget.owner;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // TextFormFields for all vehicle information
            TextFormField(
              enabled: false,
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Car Updated')),
                      );
                      updateCar(
                        vinController.text,
                        int.parse(yearController.text),
                        makeController.text,
                        modelController.text,
                        ownerController.text,
                      );

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
