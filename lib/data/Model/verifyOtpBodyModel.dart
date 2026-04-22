// To parse this JSON data, do
//
//     final verifyOtpBodyModel = verifyOtpBodyModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpBodyModel verifyOtpBodyModelFromJson(String str) => VerifyOtpBodyModel.fromJson(json.decode(str));

String verifyOtpBodyModelToJson(VerifyOtpBodyModel data) => json.encode(data.toJson());

class VerifyOtpBodyModel {
    String? email;
    String? emailOtp;
    String? phoneNumber;
    String? phoneOtp;

    VerifyOtpBodyModel({
        this.email,
        this.emailOtp,
        this.phoneNumber,
        this.phoneOtp,
    });

    factory VerifyOtpBodyModel.fromJson(Map<String, dynamic> json) => VerifyOtpBodyModel(
        email: json["email"],
        emailOtp: json["email_otp"],
        phoneNumber: json["phone_number"],
        phoneOtp: json["phone_otp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "email_otp": emailOtp,
        "phone_number": phoneNumber,
        "phone_otp": phoneOtp,
    };
}
