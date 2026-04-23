// To parse this JSON data, do
//
//     final leaveUpdateResModel = leaveUpdateResModelFromJson(jsonString);

import 'dart:convert';

LeaveUpdateResModel leaveUpdateResModelFromJson(String str) => LeaveUpdateResModel.fromJson(json.decode(str));

String leaveUpdateResModelToJson(LeaveUpdateResModel data) => json.encode(data.toJson());

class LeaveUpdateResModel {
    bool? status;
    String? message;
    Data? data;

    LeaveUpdateResModel({
        this.status,
        this.message,
        this.data,
    });

    factory LeaveUpdateResModel.fromJson(Map<String, dynamic> json) => LeaveUpdateResModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? doctorId;
    List<DateTime>? leaveDates;
    String? reason;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.doctorId,
        this.leaveDates,
        this.reason,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        doctorId: json["doctor_id"],
        leaveDates: json["leave_dates"] == null ? [] : List<DateTime>.from(json["leave_dates"]!.map((x) => DateTime.parse(x))),
        reason: json["reason"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "leave_dates": leaveDates == null ? [] : List<dynamic>.from(leaveDates!.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "reason": reason,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
