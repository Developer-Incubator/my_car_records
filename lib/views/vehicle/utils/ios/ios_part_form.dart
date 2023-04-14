import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/part.dart';
import 'package:my_car_records/model/part.dart';

class IOSPartForm extends StatelessWidget {
  const IOSPartForm({
    super.key,
    required this.vehicleID,
    required this.repairId,
    required this.formKey,
    required this.nameController,
    required this.quantityController,
    required this.priceController,
    // required this.refresh
  });
  final String vehicleID;
  final String repairId;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  // final Function refresh;
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
                        controller: nameController,
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Name:"),
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
                        controller: quantityController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Quantity:"),
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
                        controller: priceController,
                        prefix: const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, top: 14, bottom: 14),
                          child: Text("Price:"),
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
                      Part newPart = Part(
                          name: nameController.text,
                          quantity: double.tryParse(quantityController.text),
                          unitPrice: double.tryParse(priceController.text));
                      PartDB().add(
                          repairID: repairId,
                          part: newPart,
                          vehicleID: vehicleID);
                      Navigator.pop(context);
                      // refresh();
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
