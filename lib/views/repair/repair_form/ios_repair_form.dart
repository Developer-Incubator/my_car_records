import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/repair.dart';

class IOSRepairForm extends StatelessWidget {
  const IOSRepairForm(
      {super.key,
      this.vin,
      required this.vehicleID,
      required this.refresh,
      required this.formKey,
      required this.hoursController,
      required this.laborController,
      required this.odometerController,
      required this.techController,
      required this.workRequestedController});
  final String? vin;
  final int vehicleID;
  final Function refresh;

  final GlobalKey<FormState> formKey;
  final TextEditingController hoursController;
  final TextEditingController laborController;
  final TextEditingController odometerController;
  final TextEditingController techController;
  final TextEditingController workRequestedController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        "Add a Repair",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Text(
                        "Add a repair for this vehicle to keep track of everything related to this vehicle")
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
                        controller: workRequestedController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Work Requested:"),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColorScheme.blueGrey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: hoursController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Hours:"),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColorScheme.blueGrey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: laborController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Labor:"),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColorScheme.blueGrey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: odometerController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Odometer:"),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColorScheme.blueGrey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: techController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Technition:"),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColorScheme.blueGrey),
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
                    onPressed: () async {
                      Repair newRepair = Repair(
                          vehicleID: vehicleID,
                          hours: double.parse(hoursController.text),
                          labor: double.parse(laborController.text),
                          odometer: int.parse(odometerController.text),
                          workRequested: workRequestedController.text,
                          tech: techController.text);
                      await DBRepair.add(newRepair).then((value) {
                        Navigator.pop(context);
                        refresh();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
