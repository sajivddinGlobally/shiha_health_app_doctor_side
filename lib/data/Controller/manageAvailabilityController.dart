import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityDetilsModel.dart';
import 'package:siha_health_doctor_side/data/Model/manageAvailabilityModel.dart';

final avaibilityController = FutureProvider<List<ManageAvailabilityModel>>((
  ref,
) async {
  final service = APIStateNetwork(callDio());
  return await service.manageAvailability();
});

final avaibilityDetailsController =
    FutureProvider.family<ManageAvailabilityDetailsModel, String>((
      ref,
      id,
    ) async {
      final service = APIStateNetwork(callDio());
      return await service.manageAvailabilityDetails(id);
    });
