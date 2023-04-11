import 'package:flutter/cupertino.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/model/vin_decoder.dart';
import 'package:my_car_records/views/car_details/utils/vehicle_specs.dart';

class IOSVehicleSpecs extends StatelessWidget {
  const IOSVehicleSpecs({super.key, this.vin});
  final String? vin;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Vehicle Specifications",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: vin != null
          ? FutureBuilder(
              future: VinDecoder().decodeVin(vin),
              builder:
                  (BuildContext context, AsyncSnapshot<Vehicle?> snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox(
                    height: 400,
                    child: Center(
                        child: Text("Could not get vehicles information")),
                  );
                }
                if (snapshot.hasData) {
                  Vehicle? vehicle = snapshot.data;

                  return VehicleSpecs(vehicle: vehicle!);
                }
                return SizedBox(
                  height: screenHeight * .87,
                  child: const Center(child: CupertinoActivityIndicator()),
                );
              })
          : const SizedBox(
              height: 400,
              child: Center(
                child: Text(
                    "Please enter vin to get more information about your vehicle"),
              ),
            ),
    );
  }
}
