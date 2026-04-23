// To parse this JSON data, do
//
//     final pastAppointmentResModel = pastAppointmentResModelFromJson(jsonString);

import 'dart:convert';

PastAppointmentResModel pastAppointmentResModelFromJson(String str) => PastAppointmentResModel.fromJson(json.decode(str));

String pastAppointmentResModelToJson(PastAppointmentResModel data) => json.encode(data.toJson());

class PastAppointmentResModel {
    bool? success;
    String? type;
    int? count;
    dynamic message;
    List<Datum>? data;

    PastAppointmentResModel({
        this.success,
        this.type,
        this.count,
        this.message,
        this.data,
    });

    factory PastAppointmentResModel.fromJson(Map<String, dynamic> json) => PastAppointmentResModel(
        success: json["success"],
        type: json["type"],
        count: json["count"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "type": type,
        "count": count,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? userId;
    int? doctorId;
    int? hospitalId;
    DateTime? date;
    String? time;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;
    Doctor? doctor;
    Hospital? hospital;
    UserProfile? userProfile;

    Datum({
        this.id,
        this.userId,
        this.doctorId,
        this.hospitalId,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.doctor,
        this.hospital,
        this.userProfile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        hospitalId: json["hospital_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        hospital: json["hospital"] == null ? null : Hospital.fromJson(json["hospital"]),
        userProfile: json["user_profile"] == null ? null : UserProfile.fromJson(json["user_profile"]),
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
        "user": user?.toJson(),
        "doctor": doctor?.toJson(),
        "hospital": hospital?.toJson(),
        "user_profile": userProfile?.toJson(),
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
    };
}

class AvailableSlots {
    List<String>? mon;
    List<String>? tue;

    AvailableSlots({
        this.mon,
        this.tue,
    });

    factory AvailableSlots.fromJson(Map<String, dynamic> json) => AvailableSlots(
        mon: json["mon"] == null ? [] : List<String>.from(json["mon"]!.map((x) => x)),
        tue: json["tue"] == null ? [] : List<String>.from(json["tue"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mon": mon == null ? [] : List<dynamic>.from(mon!.map((x) => x)),
        "tue": tue == null ? [] : List<dynamic>.from(tue!.map((x) => x)),
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
    String? images;
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
        images: json["images"],
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
        "images": images,
        "status": status,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class User {
    int? id;
    String? fullName;
    dynamic age;
    dynamic gender;
    dynamic address;
    dynamic verificationStatus;
    dynamic status;
    dynamic price;
    dynamic patientImage;
    String? phoneNumber;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic email;
    dynamic password;
    String? role;
    dynamic bookings;
    dynamic language;
    dynamic timezone;
    dynamic hospitalId;

    User({
        this.id,
        this.fullName,
        this.age,
        this.gender,
        this.address,
        this.verificationStatus,
        this.status,
        this.price,
        this.patientImage,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.password,
        this.role,
        this.bookings,
        this.language,
        this.timezone,
        this.hospitalId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        verificationStatus: json["verification_status"],
        status: json["status"],
        price: json["price"],
        patientImage: json["patient_image"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        email: json["email"],
        password: json["password"],
        role: json["role"],
        bookings: json["bookings"],
        language: json["language"],
        timezone: json["timezone"],
        hospitalId: json["hospital_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "age": age,
        "gender": gender,
        "address": address,
        "verification_status": verificationStatus,
        "status": status,
        "price": price,
        "patient_image": patientImage,
        "phone_number": phoneNumber,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "email": email,
        "password": password,
        "role": role,
        "bookings": bookings,
        "language": language,
        "timezone": timezone,
        "hospital_id": hospitalId,
    };
}

class UserProfile {
    int? id;
    int? userId;
    String? state;
    String? city;
    String? address;
    String? gender;
    int? heightCm;
    int? weightKg;
    int? heartRate;
    String? bloodPressure;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic userProfile;
    dynamic userProfileUrl;

    UserProfile({
        this.id,
        this.userId,
        this.state,
        this.city,
        this.address,
        this.gender,
        this.heightCm,
        this.weightKg,
        this.heartRate,
        this.bloodPressure,
        this.createdAt,
        this.updatedAt,
        this.userProfile,
        this.userProfileUrl,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        userId: json["user_id"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        gender: json["gender"],
        heightCm: json["height_cm"],
        weightKg: json["weight_kg"],
        heartRate: json["heart_rate"],
        bloodPressure: json["blood_pressure"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userProfile: json["user_profile"],
        userProfileUrl: json["user_profile_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "state": state,
        "city": city,
        "address": address,
        "gender": gender,
        "height_cm": heightCm,
        "weight_kg": weightKg,
        "heart_rate": heartRate,
        "blood_pressure": bloodPressure,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_profile": userProfile,
        "user_profile_url": userProfileUrl,
    };
}
