import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/repair.dart';

/// form to update the information about a repair
///
/// [vin] vehicle id,
/// [repairId] unique id that is assigned to the repair,
/// [hours] current length of time to complete the repair,
/// [odometer] current miles on the car at time of repair,
/// [tech] current techs name that performed the repairs,
/// [workRequested] current work that was requested by the owner of the vehicle,
/// [refresh] refreshes the state to display the current information.

// ignore: must_be_immutable
class RepairUpdateForm extends StatelessWidget {
  RepairUpdateForm(
      {Key? key,
      required this.vin,
      required this.repairId,
      required this.hours,
      required this.labor,
      required this.odometer,
      required this.tech,
      required this.workRequested,
      required this.refresh})
      : super(key: key);

  final String vin;
  final String repairId;
  final double hours;
  final double labor;
  final String odometer;
  final String tech;
  final String workRequested;
  late Function refresh;

  final _formKey = GlobalKey<FormState>();
  final hoursController = TextEditingController();
  final laborController = TextEditingController();

  final odometerController = TextEditingController();
  final techController = TextEditingController();
  final workRequestedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hoursController.text = hours.toString();
    odometerController.text = odometer;
    techController.text = tech;
    workRequestedController.text = workRequested;
    return Form(
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
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Repair Updated')),
                  );
                  updateRepair(
                      vin,
                      repairId,
                      double.parse(hoursController.text.toString()),
                      techController.text,
                      odometerController.text,
                      workRequestedController.text);
                  refresh();
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
