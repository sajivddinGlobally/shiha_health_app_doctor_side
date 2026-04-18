import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Controller/manageAvailabilityController.dart';
import 'package:siha_health_doctor_side/data/Model/addManAvailabilityBodyModel.dart'
    as addBodyModel;
import 'package:siha_health_doctor_side/data/Model/addManAvailibilityResModel.dart'
    as resModel;

class AddManAvailabilityController
    extends StateNotifier<AsyncValue<resModel.AddManAvailabilityResModel?>> {
  final Ref ref;
  AddManAvailabilityController(this.ref) : super(const AsyncValue.data(null));

  Future<void> addManAvailablity({
    required int doctorId,
    required String dayOfWeek,
    required String startTime,
    required String endTime,
    required List<addBodyModel.Break> breaks,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncValue.loading();

      final body = addBodyModel.AddManAvailabilityBodyModel(
        doctorId: doctorId,
        dayOfWeek: dayOfWeek,
        startTime: startTime,
        endTime: endTime,
        breaks: breaks,
      );
      final service = APIStateNetwork(callDio());
      final response = await service.addManageAvailability(body);
      if (response != null) {
        ref.invalidate(avaibilityController);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Add Sucess"),
            backgroundColor: Color(0xFF067594),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
          ),
        );
        Navigator.pop(context);
        state = AsyncValue.data(response);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      log(e.toString());
      log(st.toString());
    }
  }
}

final addMAnAvailabilityProvider =
    StateNotifierProvider<
      AddManAvailabilityController,
      AsyncValue<resModel.AddManAvailabilityResModel?>
    >((ref) {
      return AddManAvailabilityController(ref);
    });
