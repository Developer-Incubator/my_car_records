import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.name, this.info});
  final String name;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$name: ",
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blueGrey),
        children: <TextSpan>[
          TextSpan(
            text: info,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
