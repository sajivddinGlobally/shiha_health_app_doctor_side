import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';

final hospitalListController = FutureProvider((ref) async {
  final api = APIStateNetwork(callDio());
  return await api.fetchAllHospitals();
});
