import 'dart:convert';

class Users {
  String email;
  String fname;
  String lname;

  Users({
    required this.email,
    required this.fname,
    required this.lname,
  });

  // Factory constructor to instantiate object from json format
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
    );
  }

  static List<Users> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Users>((dynamic d) => Users.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Users user) {
    return {
      'email': user.email,
      'fname': user.fname,
      'lname': user.lname,
    };
  }
}
