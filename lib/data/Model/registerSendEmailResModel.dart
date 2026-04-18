// To parse this JSON data, do
//
//     final registerSendEmailResModel = registerSendEmailResModelFromJson(jsonString);

import 'dart:convert';

RegisterSendEmailResModel registerSendEmailResModelFromJson(String str) => RegisterSendEmailResModel.fromJson(json.decode(str));

String registerSendEmailResModelToJson(RegisterSendEmailResModel data) => json.encode(data.toJson());

class RegisterSendEmailResModel {
    Email? email;
    Email? phoneNumber;

    RegisterSendEmailResModel({
        this.email,
        this.phoneNumber,
    });

    factory RegisterSendEmailResModel.fromJson(Map<String, dynamic> json) => RegisterSendEmailResModel(
        email: json["email"] == null ? null : Email.fromJson(json["email"]),
        phoneNumber: json["phone_number"] == null ? null : Email.fromJson(json["phone_number"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
        "phone_number": phoneNumber?.toJson(),
    };
}

class Email {
    String? message;
    int? otpCode;

    Email({
        this.message,
        this.otpCode,
    });

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        message: json["message"],
        otpCode: json["otp_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "otp_code": otpCode,
    };
}
