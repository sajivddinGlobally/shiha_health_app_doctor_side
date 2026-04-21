import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:siha_health_doctor_side/data/Model/addLeaveBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailabilityBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailibilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/deleteManAvailabilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityDetilsModel.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailResModel.dart';
import 'package:siha_health_doctor_side/data/Model/updatManAvailabilityResModel.dart';
import 'package:siha_health_doctor_side/data/Model/updateManAvailabilityBodyModel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST("/api/send-email-otp")
  Future<RegisterSendEmailResModel> registerSendEmail(
    @Body() RegisterSendEmailBodyModel body,
  );

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
}
