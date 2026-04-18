// To parse this JSON data, do
//
//     final addLeaveBodyModel = addLeaveBodyModelFromJson(jsonString);

import 'dart:convert';

AddLeaveBodyModel addLeaveBodyModelFromJson(String str) => AddLeaveBodyModel.fromJson(json.decode(str));

String addLeaveBodyModelToJson(AddLeaveBodyModel data) => json.encode(data.toJson());

class AddLeaveBodyModel {
    int? doctorId;
    List<DateTime>? leaveDates;
    String? reason;

    AddLeaveBodyModel({
        this.doctorId,
        this.leaveDates,
        this.reason,
    });

    factory AddLeaveBodyModel.fromJson(Map<String, dynamic> json) => AddLeaveBodyModel(
        doctorId: json["doctor_id"],
        leaveDates: json["leave_dates"] == null ? [] : List<DateTime>.from(json["leave_dates"]!.map((x) => DateTime.parse(x))),
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "leave_dates": leaveDates == null ? [] : List<dynamic>.from(leaveDates!.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "reason": reason,
    };
}
