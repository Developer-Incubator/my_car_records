import 'package:flutter/cupertino.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.name,
    required this.info,
  });
  final String name;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text("$name:"),
      additionalInfo: Text(info ?? ""),
    );
  }
}
