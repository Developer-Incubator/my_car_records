import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/model/firebase/firebase.dart';

/// form to input car information to save records about the car
// need to check vin for length as well as make a drop down with all the dent manufacturers and all of there products
class CarForm extends StatefulWidget {
  const CarForm({Key? key, required this.refresh}) : super(key: key);
  final Function refresh;

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
<<<<<<< Updated upstream
  final userID = FirebaseAuth.instance.currentUser?.uid;
=======
  final userID = MyFirebase().auth.currentUser?.uid;
>>>>>>> Stashed changes

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
    return Form(
      key: _formKey,
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
            // TextFormField(
            //   controller: ownerController,
            //   keyboardType: TextInputType.text,
            //   decoration: const InputDecoration(
            //     labelText: "Owner",
            //     hintText: "Owner of the vehicle",
            //   ),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter some text';
            //     }
            //     return null;
            //   },
            // ),
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
                        const SnackBar(content: Text('Car Added')),
                      );

                      DbCar().addCar(
                          vinController.text,
                          int.parse(yearController.text),
                          makeController.text,
                          modelController.text,
                          userID.toString());

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
