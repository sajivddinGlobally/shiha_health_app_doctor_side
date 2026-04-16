// To parse this JSON data, do
//
//     final updateManAvailabilityResModel = updateManAvailabilityResModelFromJson(jsonString);

import 'dart:convert';

UpdateManAvailabilityResModel updateManAvailabilityResModelFromJson(String str) => UpdateManAvailabilityResModel.fromJson(json.decode(str));

String updateManAvailabilityResModelToJson(UpdateManAvailabilityResModel data) => json.encode(data.toJson());

class UpdateManAvailabilityResModel {
    int? id;
    int? doctorId;
    String? dayOfWeek;
    String? startTime;
    String? endTime;
    List<Break>? breaks;
    DateTime? createdAt;
    DateTime? updatedAt;
    Doctor? doctor;

    UpdateManAvailabilityResModel({
        this.id,
        this.doctorId,
        this.dayOfWeek,
        this.startTime,
        this.endTime,
        this.breaks,
        this.createdAt,
        this.updatedAt,
        this.doctor,
    });

    factory UpdateManAvailabilityResModel.fromJson(Map<String, dynamic> json) => UpdateManAvailabilityResModel(
        id: json["id"],
        doctorId: json["doctor_id"],
        dayOfWeek: json["day_of_week"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        breaks: json["breaks"] == null ? [] : List<Break>.from(json["breaks"]!.map((x) => Break.fromJson(x))),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "day_of_week": dayOfWeek,
        "start_time": startTime,
        "end_time": endTime,
        "breaks": breaks == null ? [] : List<dynamic>.from(breaks!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
