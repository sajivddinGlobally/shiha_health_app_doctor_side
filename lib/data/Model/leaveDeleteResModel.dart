// To parse this JSON data, do
//
//     final leaveDeleteResModel = leaveDeleteResModelFromJson(jsonString);

import 'dart:convert';

LeaveDeleteResModel leaveDeleteResModelFromJson(String str) => LeaveDeleteResModel.fromJson(json.decode(str));

String leaveDeleteResModelToJson(LeaveDeleteResModel data) => json.encode(data.toJson());

class LeaveDeleteResModel {
    bool? status;
    String? message;

    LeaveDeleteResModel({
        this.status,
        this.message,
    });

    factory LeaveDeleteResModel.fromJson(Map<String, dynamic> json) => LeaveDeleteResModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
