// To parse this JSON data, do
//
//     final registerSendEmailBodyModel = registerSendEmailBodyModelFromJson(jsonString);

import 'dart:convert';

RegisterSendEmailBodyModel registerSendEmailBodyModelFromJson(String str) => RegisterSendEmailBodyModel.fromJson(json.decode(str));

String registerSendEmailBodyModelToJson(RegisterSendEmailBodyModel data) => json.encode(data.toJson());

class RegisterSendEmailBodyModel {
    String email;
    String fullName;
    String phoneNumber;
    String password;
    String confirmPassword;

    RegisterSendEmailBodyModel({
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        required this.password,
        required this.confirmPassword,
    });

    factory RegisterSendEmailBodyModel.fromJson(Map<String, dynamic> json) => RegisterSendEmailBodyModel(
        email: json["email"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "password": password,
        "confirm_password": confirmPassword,
    };
}
