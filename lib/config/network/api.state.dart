import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityModel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: "http://sihahealth.globallywebsolutions.com")
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @GET("/api/doctor-availabilities")
  Future<List<ManageAvailabilityModel>> manageAvailability();
}
