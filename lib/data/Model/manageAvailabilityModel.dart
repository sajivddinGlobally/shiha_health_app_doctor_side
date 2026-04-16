// To parse this JSON data, do
//
//     final manageAvailabilityModel = manageAvailabilityModelFromJson(jsonString);

import 'dart:convert';

List<ManageAvailabilityModel> manageAvailabilityModelFromJson(String str) => List<ManageAvailabilityModel>.from(json.decode(str).map((x) => ManageAvailabilityModel.fromJson(x)));

String manageAvailabilityModelToJson(List<ManageAvailabilityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManageAvailabilityModel {
    int id;
    int doctorId;
    String dayOfWeek;
    String startTime;
    String endTime;
    List<Break> breaks;
    DateTime createdAt;
    DateTime updatedAt;
    Doctor doctor;

    ManageAvailabilityModel({
        required this.id,
        required this.doctorId,
        required this.dayOfWeek,
        required this.startTime,
        required this.endTime,
        required this.breaks,
        required this.createdAt,
        required this.updatedAt,
        required this.doctor,
    });

    factory ManageAvailabilityModel.fromJson(Map<String, dynamic> json) => ManageAvailabilityModel(
        id: json["id"],
        doctorId: json["doctor_id"],
        dayOfWeek: json["day_of_week"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        breaks: List<Break>.from(json["breaks"].map((x) => Break.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctor: Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "day_of_week": dayOfWeek,
        "start_time": startTime,
        "end_time": endTime,
        "breaks": List<dynamic>.from(breaks.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctor": doctor.toJson(),
    };
}

class Break {
    String startTime;
    String endTime;

    Break({
        required this.startTime,
        required this.endTime,
    });

    factory Break.fromJson(Map<String, dynamic> json) => Break(
        startTime: json["start_time"],
        endTime: json["end_time"],
    );

    Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
    };
}

class Doctor {
    int id;
    String fullName;

    Doctor({
        required this.id,
        required this.fullName,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
    };
}
