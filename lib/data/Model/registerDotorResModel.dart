// To parse this JSON data, do
//
//     final registerDoctorResModel = registerDoctorResModelFromJson(jsonString);

import 'dart:convert';

RegisterDoctorResModel registerDoctorResModelFromJson(String str) => RegisterDoctorResModel.fromJson(json.decode(str));

String registerDoctorResModelToJson(RegisterDoctorResModel data) => json.encode(data.toJson());

class RegisterDoctorResModel {
    String? message;
    User? user;
    Doctor? doctor;

    RegisterDoctorResModel({
        this.message,
        this.user,
        this.doctor,
    });

    factory RegisterDoctorResModel.fromJson(Map<String, dynamic> json) => RegisterDoctorResModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "doctor": doctor?.toJson(),
    };
}

class Doctor {
    String? fullName;
    String? specialty;
    int? experienceYears;
    double? rating;
    String? hospitalId;
    int? consultationFees;
    List<String>? language;
    AvailableSlots? availableSlots;
    int? userId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Doctor({
        this.fullName,
        this.specialty,
        this.experienceYears,
        this.rating,
        this.hospitalId,
        this.consultationFees,
        this.language,
        this.availableSlots,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
        availableSlots: json["available_slots"] == null ? null : AvailableSlots.fromJson(json["available_slots"]),
        userId: json["user_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "specialty": specialty,
        "experience_years": experienceYears,
        "rating": rating,
        "hospital_id": hospitalId,
        "consultation_fees": consultationFees,
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "available_slots": availableSlots?.toJson(),
        "user_id": userId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}

class AvailableSlots {
    List<String>? mon;
    List<String>? tue;

    AvailableSlots({
        this.mon,
        this.tue,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        mon: json["mon"] == null ? [] : List<String>.from(json["mon"]!.map((x) => x)),
        tue: json["tue"] == null ? [] : List<String>.from(json["tue"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mon": mon == null ? [] : List<dynamic>.from(mon!.map((x) => x)),
        "tue": tue == null ? [] : List<dynamic>.from(tue!.map((x) => x)),
    };
}

class User {
    String? phoneNumber;
    String? email;
    String? password;
    String? role;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    User({
        this.phoneNumber,
        this.email,
        this.password,
        this.role,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phone_number"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
        "role": role,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
