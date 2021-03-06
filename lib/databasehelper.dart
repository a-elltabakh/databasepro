import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseHelper {

Future<Login> loginData(String email, String password) async {
  final response = await http.post(
      Uri.parse("https://host.com/signin/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"username": "$email", "password": "$password"}));
  print(response.statusCode);

}


  Future<Company> CreateCompany(String name,String password,String email,String adress,) async {
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

  Future<Program> CreateProgram(String programName, String maxBalance, String companyId) async {
    final response = await http.post(
        Uri.parse("https://insurance-sys.herokuapp.com/program/add-program/"),
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

  Future<Customer> AddCustomer(String firstName,String lastName,String adress,String phone,String email,String currentBalance,String programId) async {
    final response = await http.post(
        Uri.parse("https://insurance-sys.herokuapp.com/customer/add-customer/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "firstName": "$firstName",
          "lastName": "$lastName",
          "adress": "$adress",
          "email": "$email",
          "phone": "$phone",
          "current_balance": "$currentBalance",
          "ProgramID": "$programId",
        }));
    print(response.statusCode);
    print(jsonEncode(<String, String>{
      "firstName": "$firstName",
      "lastName": "$lastName",
      "adress": "$adress",
      "phone": "$phone",
      "email": "$email",
      "current_balance": "$currentBalance",
      "ProgramID": "$programId",
    }));
  }

  Future<Customer> AddService(String programId,String serviceID,String discount,String maxDiscount) async {
    final response = await http.post(
        Uri.parse("https://insurance-sys.herokuapp.com/program/assign-service/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "programId": "$programId",
          "serviceID": "$serviceID",
          "discount": "$discount",
          "maxDiscount": "$maxDiscount",

        }));
    print(response.statusCode);
    print(jsonEncode(<String, String>{
      "programId": "$programId",
      "serviceID": "$serviceID",
      "discount": "$discount",
      "maxDiscount": "$maxDiscount",

    }));
  }
}

class Login {
  final String email;
  final String password;

  Login({this.email, this.password});
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      email: json['email'],
      password: json['password'],
    );
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
      password: json['password'],
      email: json['email'],
      address: json['adress'],
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
      programName: json['program_name'],
      maxBalance: json['max_balance'],
      companyID: json['company_id'],
    );
  }
}

class Customer {
  final String firstName;
  final String lastName;
  final String phone;
  final String adress;
  final String email;
  final String currentBalance;
  final int programID;

  Customer(
      {this.firstName,
      this.lastName,
      this.adress,
      this.phone,
      this.email,
      this.currentBalance,
      this.programID});
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      firstName: json['firstName'],
      lastName: json['lastName'],
      adress: json['adress'],
      phone: json['phone'],
      email: json['email'],
      currentBalance: json['current_balance'],
      programID: json['programID'],
    );
  }
}

class Service {
  final String programId;
  final String serviceID;
  final String discount;
  final String maxDiscount;

  Service({this.programId, this.serviceID, this.discount, this.maxDiscount});
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      programId: json['programId'],
      serviceID: json['serviceID'],
      discount: json['discount'],
      maxDiscount: json['maxDiscount'],
    );
  }
}




