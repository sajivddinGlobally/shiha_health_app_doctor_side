// To parse this JSON data, do
//
//     final profileResModel = profileResModelFromJson(jsonString);

import 'dart:convert';

ProfileResModel profileResModelFromJson(String str) => ProfileResModel.fromJson(json.decode(str));

String profileResModelToJson(ProfileResModel data) => json.encode(data.toJson());

class ProfileResModel {
    int? id;
    String? fullName;
    String? specialty;
    int? experienceYears;
    double? rating;
    String? profilePicture;
    int? hospitalId;
    int? consultationFees;
    List<String>? language;
    AvailableSlots? availableSlots;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? status;
    dynamic email;
    dynamic city;
    dynamic password;
    String? approvals;
    String? kycStatus;
    int? userId;
    dynamic medicalLicenseFile;
    Hospital? hospital;
    List<Appointment>? appointments;

    ProfileResModel({
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
        this.hospital,
        this.appointments,
    });

    factory ProfileResModel.fromJson(Map<String, dynamic> json) => ProfileResModel(
        id: json["id"],
        fullName: json["full_name"],
        specialty: json["specialty"],
        experienceYears: json["experience_years"],
        rating: json["rating"]?.toDouble(),
        profilePicture: json["profile_picture"],
        hospitalId: json["hospital_id"],
        consultationFees: json["consultation_fees"],
        language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
        availableSlots: json["available_slots"] == null ? null : AvailableSlots.fromJson(json["available_slots"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        status: json["status"],
        email: json["email"],
        city: json["city"],
        password: json["password"],
        approvals: json["Approvals"],
        kycStatus: json["kyc_status"],
        userId: json["user_id"],
        medicalLicenseFile: json["medical_license_file"],
        hospital: json["hospital"] == null ? null : Hospital.fromJson(json["hospital"]),
        appointments: json["appointments"] == null ? [] : List<Appointment>.from(json["appointments"]!.map((x) => Appointment.fromJson(x))),
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
        "language": language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "available_slots": availableSlots?.toJson(),
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
        "hospital": hospital?.toJson(),
        "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x.toJson())),
    };
}

class Appointment {
    int? id;
    int? userId;
    int? doctorId;
    int? hospitalId;
    DateTime? date;
    String? time;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Appointment({
        this.id,
        this.userId,
        this.doctorId,
        this.hospitalId,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "hospital_id": hospitalId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class AvailableSlots {
    List<String>? mon;
    List<String>? tue;
    List<dynamic>? wed;
    List<dynamic>? thu;
    List<dynamic>? fri;
    List<dynamic>? sat;
    List<dynamic>? sun;

    AvailableSlots({
        this.mon,
        this.tue,
        this.wed,
        this.thu,
        this.fri,
        this.sat,
        this.sun,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        mon: json["mon"] == null ? [] : List<String>.from(json["mon"]!.map((x) => x)),
        tue: json["tue"] == null ? [] : List<String>.from(json["tue"]!.map((x) => x)),
        wed: json["wed"] == null ? [] : List<dynamic>.from(json["wed"]!.map((x) => x)),
        thu: json["thu"] == null ? [] : List<dynamic>.from(json["thu"]!.map((x) => x)),
        fri: json["fri"] == null ? [] : List<dynamic>.from(json["fri"]!.map((x) => x)),
        sat: json["sat"] == null ? [] : List<dynamic>.from(json["sat"]!.map((x) => x)),
        sun: json["sun"] == null ? [] : List<dynamic>.from(json["sun"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mon": mon == null ? [] : List<dynamic>.from(mon!.map((x) => x)),
        "tue": tue == null ? [] : List<dynamic>.from(tue!.map((x) => x)),
        "wed": wed == null ? [] : List<dynamic>.from(wed!.map((x) => x)),
        "thu": thu == null ? [] : List<dynamic>.from(thu!.map((x) => x)),
        "fri": fri == null ? [] : List<dynamic>.from(fri!.map((x) => x)),
        "sat": sat == null ? [] : List<dynamic>.from(sat!.map((x) => x)),
        "sun": sun == null ? [] : List<dynamic>.from(sun!.map((x) => x)),
    };
}

class Hospital {
    int? id;
    String? name;
    String? location;
    String? consultationPriceRange;
    String? language;
    double? rating;
    String? servicesOffered;
    String? lat;
    String? lng;
    List<String>? images;
    String? status;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Hospital({
        this.id,
        this.name,
        this.location,
        this.consultationPriceRange,
        this.language,
        this.rating,
        this.servicesOffered,
        this.lat,
        this.lng,
        this.images,
        this.status,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        consultationPriceRange: json["consultation_price_range"],
        language: json["language"],
        rating: json["rating"]?.toDouble(),
        servicesOffered: json["services_offered"],
        lat: json["lat"],
        lng: json["lng"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        status: json["status"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "consultation_price_range": consultationPriceRange,
        "language": language,
        "rating": rating,
        "services_offered": servicesOffered,
        "lat": lat,
        "lng": lng,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "status": status,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
