import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/pastAppointmentResModel.dart';

class PastAppointmentController
    extends StateNotifier<AsyncValue<PastAppointmentResModel>> {
  PastAppointmentController() : super(const AsyncValue.loading()) {
    fetchPastAppointment();
  }
  Future<void> fetchPastAppointment() async {
    try {
      state = const AsyncValue.loading();

      final service = APIStateNetwork(callDio());
      final response = await service.pastAppointment();

      if (response.data != null) {
        state = AsyncValue.data(response);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e, st) {
      log("Past Appointment Error: ${e.toString()}");
      state = AsyncValue.error(e, st);
    }
  }
}

final pastAppointmentProvider =
    StateNotifierProvider<
      PastAppointmentController,
      AsyncValue<PastAppointmentResModel>
    >((ref) {
      return PastAppointmentController();
    });
