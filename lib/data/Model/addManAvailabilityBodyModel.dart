// To parse this JSON data, do
//
//     final addManAvailabilityBodyModel = addManAvailabilityBodyModelFromJson(jsonString);

import 'dart:convert';

AddManAvailabilityBodyModel addManAvailabilityBodyModelFromJson(String str) => AddManAvailabilityBodyModel.fromJson(json.decode(str));

String addManAvailabilityBodyModelToJson(AddManAvailabilityBodyModel data) => json.encode(data.toJson());

class AddManAvailabilityBodyModel {
    int? doctorId;
    String? dayOfWeek;
    String? startTime;
    String? endTime;
    List<Break>? breaks;

    AddManAvailabilityBodyModel({
        this.doctorId,
        this.dayOfWeek,
        this.startTime,
        this.endTime,
        this.breaks,
    });

    factory AddManAvailabilityBodyModel.fromJson(Map<String, dynamic> json) => AddManAvailabilityBodyModel(
        doctorId: json["doctor_id"],
        dayOfWeek: json["day_of_week"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        breaks: json["breaks"] == null ? [] : List<Break>.from(json["breaks"]!.map((x) => Break.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "day_of_week": dayOfWeek,
        "start_time": startTime,
        "end_time": endTime,
        "breaks": breaks == null ? [] : List<dynamic>.from(breaks!.map((x) => x.toJson())),
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
