// To parse this JSON data, do
//
//     final updateManAvailabilityBodyModel = updateManAvailabilityBodyModelFromJson(jsonString);

import 'dart:convert';

UpdateManAvailabilityBodyModel updateManAvailabilityBodyModelFromJson(String str) => UpdateManAvailabilityBodyModel.fromJson(json.decode(str));

String updateManAvailabilityBodyModelToJson(UpdateManAvailabilityBodyModel data) => json.encode(data.toJson());

class UpdateManAvailabilityBodyModel {
    String? startTime;
    String? endTime;
    List<Break>? breaks;

    UpdateManAvailabilityBodyModel({
        this.startTime,
        this.endTime,
        this.breaks,
    });

    factory UpdateManAvailabilityBodyModel.fromJson(Map<String, dynamic> json) => UpdateManAvailabilityBodyModel(
        startTime: json["start_time"],
        endTime: json["end_time"],
        breaks: json["breaks"] == null ? [] : List<Break>.from(json["breaks"]!.map((x) => Break.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
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
