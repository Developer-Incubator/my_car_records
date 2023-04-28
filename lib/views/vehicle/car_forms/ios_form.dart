import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/model/vin_decoder.dart';

class IOSCarForm extends StatefulWidget {
  const IOSCarForm(
      {super.key,
      required this.user,
      required this.formKey,
      required this.vinController,
      required this.makeController,
      required this.modelController,
      required this.yearController,
      required this.ownerController,
      required this.odometerController,
      required this.refresh});
  final User user;
  final GlobalKey<FormState> formKey;
  final TextEditingController vinController;
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController yearController;
  final TextEditingController ownerController;
  final TextEditingController odometerController;
  final Function refresh;

  @override
  State<IOSCarForm> createState() => _IOSCarFormState();
}

class _IOSCarFormState extends State<IOSCarForm> {
  Vehicle? vehicle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: widget.formKey,
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
                        controller: widget.vinController,
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Vin:"),
                        ),
                        suffix: CupertinoButton(
                          child: const Text("Search"),
                          onPressed: () async {
                            try {
                              vehicle = await VinDecoder(Client())
                                  .decodeVin(widget.vinController.text);

                              if (vehicle != null) {
                                setState(() {
                                  widget.makeController.text =
                                      vehicle?.make ?? "N/A";
                                  widget.modelController.text =
                                      vehicle?.model ?? "N/A";
                                  widget.yearController.text =
                                      vehicle?.modelYear.toString() ?? "N/A";
                                });
                              }
                            } catch (e) {
                              debugPrint(e.toString());
                            }

                            // Navigator.pop(context);
                          },
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: MyColorScheme.blueGrey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: widget.makeController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Make:"),
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
                        controller: widget.modelController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Model:"),
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
                        controller: widget.yearController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Year:"),
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
                    onPressed: () {
                      vehicle ??= Vehicle(
                          make: widget.makeController.text,
                          model: widget.modelController.text,
                          modelYear: int.parse(widget.yearController.text));
                      //TODO: Change to use my db

                      // CarDB(firestore: widget.firestore, user: widget.user)
                      //     .add(vehicle);
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
    );
  }
}
