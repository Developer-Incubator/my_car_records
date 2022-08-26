String capitalize(String str) {
  return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
}

String eachCap(String str) {
  List<String> splitStr = str.split(" ");
  List<String> upStrs = [];
  if (splitStr.length > 1) {
    for (var string in splitStr) {
      upStrs.add(capitalize(string));
    }
    return upStrs.join(" ");
  }
  return capitalize(str);
}
