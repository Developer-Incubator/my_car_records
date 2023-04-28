import 'dart:convert';

class User {
  final int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String sessionToken;

  User(
      {required this.id,
      required this.username,
      required this.sessionToken,
      required this.firstName,
      required this.lastName,
      required this.email});

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: int.parse(json["id"]),
        username: json["username"],
        sessionToken: json["session_token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"]);
  }

  static User fromString(String info) {
    Map<String, dynamic> json = jsonDecode(info);

    return User(
        id: json["id"],
        username: json["username"],
        sessionToken: json["session_token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"]);
  }

  @override
  String toString() {
    return "{\"id\":$id,\"username\": \"$username\", \"email\": \"$email\",\"first_name\":\"$firstName\",\"last_name\":\"$lastName\",\"session_token\":\"$sessionToken\"}";
  }
}
