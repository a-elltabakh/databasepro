import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var status;
  var token;

  Future<Company> CreateCompany(
    String name,
    String password,
    String email,
    String adress,
  ) async {
    final response = await http.post(
        Uri.parse("https://insurance-sys.herokuapp.com/company/add-company/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": "$name",
          "password": "$password",
          "email": "$email",
          "adress": "$adress"
        }));
    print(response.statusCode);
    print(jsonEncode(<String, String>{
      "name": "$name",
      "password": "$password",
      "email": "$email",
      "adress": "$adress"
    }));
  }

  Future<Program> CreateProgram(String programName,
      String maxBalance, String companyId) async {
    final response = await http.post(Uri.parse("https://insurance-sys.herokuapp.com/program/add-program"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "program_name": "$programName",
          "max_balance": "$maxBalance",
          "company_id": "$companyId",
        }));
    print(response.statusCode);
    print(jsonEncode(<String, String>{
      "program_name": "$programName",
      "max_balance": "$maxBalance",
      "company_id": "$companyId",
    }));

  }

  Future<Customer> AddCustomer(
      String program,
      String firstName,
      String lastName,
      String address,
      String phone,
      String email,
      int programId) async {
    final response = await http.post(Uri.parse("https://host/customers/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "program": "$program",
          "first Name": "$firstName",
          "last Name": "$lastName",
          "address": "$address",
          "phone": "$phone",
          "email": "$email",
          "program Id": "$programId",
        }));
    print(response.statusCode);
    // var data = json.decode(response.body);
    // if (status = response.body.contains('non_field_errors')) {
    //   print('data : ${data["non_field_errors"]}');
    // } else {
    //   print('data : ${data["token"]}');
    //   _save(data["token"]);
    // }
  }

  Future<String> GetCompanies() async {
    List compList;
    String _myComp;
    List compIdList;
    final response = await http.get(
      Uri.parse("https://insurance-sys.herokuapp.com/company/get-companies/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
  }
}

class Company {
  final String name;
  final String email;
  final String address;
  final String password;

  Company({this.name, this.email, this.address, this.password});
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
    );
  }
}

class Program {
  final String programName;
  final String maxBalance;
  final int companyID;

  Program({this.programName, this.maxBalance, this.companyID});
  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      programName: json['programName'],
      maxBalance: json['maxBalance'],
      companyID: json['companyID'],
    );
  }
}

class Customer {
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String email;
  final int programID;

  Customer(
      {this.firstName,
      this.lastName,
      this.address,
      this.phone,
      this.email,
      this.programID});
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      programID: json['programID'],
    );
  }
}

_save(String token) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}

read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key) ?? 0;
  print('read : $value');
}

// Future<Login> loginData(String email, String password) async {
//   final response = await http.post(
//       Uri.parse("https://mahdy.pythonanywhere.com/api/users/signin/"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//           <String, String>{"username": "$email", "password": "$password"}));
//   print(response.statusCode);
//   var data = json.decode(response.body);
//   if (status = response.body.contains('non_field_errors')) {
//     print('data : ${data["non_field_errors"]}');
//   } else {
//     print('data : ${data["token"]}');
//     _save(data["token"]);
//   }
// }
// }
//
// class Login {
//   final String email;
//   final String password;
//
//   Login({this.email, this.password});
//   factory Login.fromJson(Map<String, dynamic> json) {
//     return Login(
//       email: json['email'],
//       password: json['password'],
//     );
//   }
// }
