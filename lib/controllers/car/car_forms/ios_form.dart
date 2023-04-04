import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';

class IOSCarForm extends StatelessWidget {
  const IOSCarForm(
      {super.key,
      required this.formKey,
      required this.vinController,
      required this.makeController,
      required this.modelController,
      required this.yearController,
      required this.ownerController,
      required this.odometerController,
      required this.refresh});
  final GlobalKey<FormState> formKey;
  final TextEditingController vinController;
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController yearController;
  final TextEditingController ownerController;
  final TextEditingController odometerController;
  final Function refresh;

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
                        "Add a Part",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Text(
                        "Add all the information about the part that is used in the repair ")
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
                        decoration: BoxDecoration(
                            border: Border.all(color: MyColorScheme.blueGrey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CupertinoTextField(
                        controller: makeController,
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
                        controller: modelController,
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
                        controller: yearController,
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
                      //TODO: add part to the db here
                      Navigator.pop(context);
                      refresh();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
