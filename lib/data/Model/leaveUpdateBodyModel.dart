// To parse this JSON data, do
//
//     final leaveUpdateBodyModel = leaveUpdateBodyModelFromJson(jsonString);

import 'dart:convert';

LeaveUpdateBodyModel leaveUpdateBodyModelFromJson(String str) => LeaveUpdateBodyModel.fromJson(json.decode(str));

String leaveUpdateBodyModelToJson(LeaveUpdateBodyModel data) => json.encode(data.toJson());

class LeaveUpdateBodyModel {
    int? doctorId;
    List<DateTime>? leaveDates;
    String? reason;

    LeaveUpdateBodyModel({
        this.doctorId,
        this.leaveDates,
        this.reason,
    });

    factory LeaveUpdateBodyModel.fromJson(Map<String, dynamic> json) => LeaveUpdateBodyModel(
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
