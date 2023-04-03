import 'package:flutter/cupertino.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/db/car.dart';

class IOSCarDetails extends StatefulWidget {
  const IOSCarDetails(
      {super.key,
      required this.carId,
      required this.make,
      required this.model,
      required this.year});
  final String carId;
  final String make;
  final String model;
  final String year;

  @override
  State<IOSCarDetails> createState() => _IOSCarDetailsState();
}

class _IOSCarDetailsState extends State<IOSCarDetails> {
  
  void _showDeleteCarDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Delete Vehicle'),
        content:
            const Text('Are you sure you would like to delete this vehicle'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              CarDB().deleteCar(widget.carId);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "${widget.year} ${capitalize(widget.make)} ${widget.model}",
          style: const TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.ellipsis,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            print("add part");
          },
        ),
      ),
      child: FutureBuilder(
        builder: (BuildContext context,AsyncSnapshot snapshot) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Make: ${widget.make}"),
                  Text("Model: ${widget.model}"),
                  Text("Year: ${widget.year}"),
                ],
              ),
              CupertinoButton(
                child: const Text("Specs"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext builder) {
                        return CupertinoPopupSurface(
                          child: Container(
                            height: 400,
                          ),
                        );
                      });
                },
              ),
              CupertinoButton(
                  color: CupertinoColors.destructiveRed,
                  child: const Text(
                    "Delete Car",
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  onPressed: () => _showDeleteCarDialog(context))
            ],
          );
        }
      ),
    );
  }
}
