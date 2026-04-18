// To parse this JSON data, do
//
//     final addManAvailabilityResModel = addManAvailabilityResModelFromJson(jsonString);

import 'dart:convert';

AddManAvailabilityResModel addManAvailabilityResModelFromJson(String str) => AddManAvailabilityResModel.fromJson(json.decode(str));

String addManAvailabilityResModelToJson(AddManAvailabilityResModel data) => json.encode(data.toJson());

class AddManAvailabilityResModel {
    int? doctorId;
    String? dayOfWeek;
    String? startTime;
    String? endTime;
    List<Break>? breaks;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;
    Doctor? doctor;

    AddManAvailabilityResModel({
        this.doctorId,
        this.dayOfWeek,
        this.startTime,
        this.endTime,
        this.breaks,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.doctor,
    });

    factory AddManAvailabilityResModel.fromJson(Map<String, dynamic> json) => AddManAvailabilityResModel(
        doctorId: json["doctor_id"],
        dayOfWeek: json["day_of_week"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        breaks: json["breaks"] == null ? [] : List<Break>.from(json["breaks"]!.map((x) => Break.fromJson(x))),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "day_of_week": dayOfWeek,
        "start_time": startTime,
        "end_time": endTime,
        "breaks": breaks == null ? [] : List<dynamic>.from(breaks!.map((x) => x.toJson())),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "doctor": doctor?.toJson(),
    };
}

class Break {
    String? startTime;
    String? endTime;

    Break({
        this.startTime,
        this.endTime,
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
    int? id;
    String? fullName;

    Doctor({
        this.id,
        this.fullName,
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
