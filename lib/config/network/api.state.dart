import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:siha_health_doctor_side/data/Model/addLeaveBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailabilityBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailibilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/deleteManAvailabilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/hospitalListResModel.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityDetilsModel.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerDotorResModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailResModel.dart';
import 'package:siha_health_doctor_side/data/Model/updatManAvailabilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/updateManAvailabilityBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/verifyOtpBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/verifyOtpResModel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST("/api/send-email-otp")
  Future<RegisterSendEmailResModel> loginSendEmail(
    @Body() RegisterSendEmailBodyModel body,
  );

  @POST("/api/verify-email-otp")
  Future<VerifyOtpResModel> verifyOtp(@Body() VerifyOtpBodyModel body);

  @POST("/api/doctor-availabilities")
  Future<AddManAvailabilityResModel> addManageAvailability(
    @Body() AddManAvailabilityBodyModel body,
  );

  @GET("/api/doctor-availabilities")
  Future<List<ManageAvailabilityModel>> manageAvailability();

  @GET("/api/doctor-availabilities/{id}")
  Future<ManageAvailabilityDetailsModel> manageAvailabilityDetails(
    @Path('id') String id,
  );

  @PUT("/api/doctor-availabilities/{id}")
  Future<UpdateManAvailabilityResModel> updateManAvailability(
    @Path('id') String id,
    @Body() UpdateManAvailabilityBodyModel body,
  );

  @DELETE('/api/doctor-availabilities/{id}')
  Future<DeleteManAvailabilityResModel> deleteManAvailability(
    @Path('id') String id,
  );

  @POST("/api/doctor-leaves")
  Future<HttpResponse<dynamic>> addLeave(@Body() AddLeaveBodyModel body);

  @GET("/api/hospitals")
  Future<List<HospitalListResponse>> fetchAllHospitals();

  @MultiPart()
  @POST("/api/doctors")
  Future<RegisterDoctorResModel> registerDoctor(
    @Part(name: "full_name") String fullName,
    @Part(name: "phone_number") String phoneNumber,
    @Part(name: "email") String email,
    @Part(name: "password") String password,
    @Part(name: "specialty") String specialty,
    @Part(name: "experience_years") int experienceYears,
    @Part(name: "hospital_id") int hospitalId,
    @Part(name: "consultation_fees") int consultationFees,
    @Part(name: "medical_license_number") int medicalLicenseNumber,
    @Part(name: "qualifications") String qualifications,
    @Part(name: "profile_picture") MultipartFile? pictureFile,
    @Part(name: "medical_license_file") MultipartFile? licenseFile,
  );
}
