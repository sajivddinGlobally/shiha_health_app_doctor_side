// To parse this JSON data, do
//
//     final leaveListResModel = leaveListResModelFromJson(jsonString);

import 'dart:convert';

LeaveListResModel leaveListResModelFromJson(String str) =>
    LeaveListResModel.fromJson(json.decode(str));

String leaveListResModelToJson(LeaveListResModel data) =>
    json.encode(data.toJson());

class LeaveListResModel {
  bool? status;
  String? message;
  List<Datum>? data;

  LeaveListResModel({this.status, this.message, this.data});

  factory LeaveListResModel.fromJson(Map<String, dynamic> json) =>
      LeaveListResModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? doctorId;
  List<DateTime>? leaveDates;
  String? reason;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctor? doctor;

  Datum({
    this.id,
    this.doctorId,
    this.leaveDates,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    doctorId: json["doctor_id"],
    leaveDates: json["leave_dates"] == null
        ? []
        : List<DateTime>.from(
            json["leave_dates"]!.map((x) => DateTime.parse(x)),
          ),
    reason: json["reason"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "leave_dates": leaveDates == null
        ? []
        : List<dynamic>.from(
            leaveDates!.map(
              (x) =>
                  "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}",
            ),
          ),
    "reason": reason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
  };
}

class Doctor {
  int? id;
  String? fullName;
  String? specialty;
  int? experienceYears;
  double? rating;
  dynamic profilePicture;
  int? hospitalId;
  int? consultationFees;
  List<String>? language;
  List<String>? availableSlots;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  dynamic email;
  dynamic city;
  dynamic password;
  String? approvals;
  String? kycStatus;
  String? reason;
  int? userId;
  dynamic medicalLicenseFile;

  Doctor({
    this.id,
    this.fullName,
    this.specialty,
    this.experienceYears,
    this.rating,
    this.profilePicture,
    this.hospitalId,
    this.consultationFees,
    this.language,
    this.availableSlots,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.email,
    this.city,
    this.password,
    this.approvals,
    this.kycStatus,
    this.userId,
    this.medicalLicenseFile,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    fullName: json["full_name"],
    specialty: json["specialty"],
    experienceYears: json["experience_years"],
    rating: json["rating"]?.toDouble(),
    profilePicture: json["profile_picture"],
    hospitalId: json["hospital_id"],
    consultationFees: json["consultation_fees"],
    language: json["language"] == null
        ? []
        : List<String>.from(json["language"]!.map((x) => x)),
    availableSlots: json["available_slots"] == null
        ? []
        : List<String>.from(json["available_slots"]!.map((x) => x)),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    status: json["status"],
    email: json["email"],
    city: json["city"],
    password: json["password"],
    approvals: json["Approvals"],
    kycStatus: json["kyc_status"],
    userId: json["user_id"],
    medicalLicenseFile: json["medical_license_file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "specialty": specialty,
    "experience_years": experienceYears,
    "rating": rating,
    "profile_picture": profilePicture,
    "hospital_id": hospitalId,
    "consultation_fees": consultationFees,
    "language": language == null
        ? []
        : List<dynamic>.from(language!.map((x) => x)),
    "available_slots": availableSlots == null
        ? []
        : List<dynamic>.from(availableSlots!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
    "email": email,
    "city": city,
    "password": password,
    "Approvals": approvals,
    "kyc_status": kycStatus,
    "user_id": userId,
    "medical_license_file": medicalLicenseFile,
  };
}
