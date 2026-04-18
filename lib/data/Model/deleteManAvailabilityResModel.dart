// To parse this JSON data, do
//
//     final deleteManAvailabilityResModel = deleteManAvailabilityResModelFromJson(jsonString);

import 'dart:convert';

DeleteManAvailabilityResModel deleteManAvailabilityResModelFromJson(String str) => DeleteManAvailabilityResModel.fromJson(json.decode(str));

String deleteManAvailabilityResModelToJson(DeleteManAvailabilityResModel data) => json.encode(data.toJson());

class DeleteManAvailabilityResModel {
    String? message;
    String? deletedId;

    DeleteManAvailabilityResModel({
        this.message,
        this.deletedId,
    });

    factory DeleteManAvailabilityResModel.fromJson(Map<String, dynamic> json) => DeleteManAvailabilityResModel(
        message: json["message"],
        deletedId: json["deleted_id"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "deleted_id": deletedId,
    };
}
