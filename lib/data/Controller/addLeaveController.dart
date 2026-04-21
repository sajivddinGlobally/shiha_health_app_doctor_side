import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/addLeaveBodyModel.dart';

class AddlLeaveController
    extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  AddlLeaveController() : super(AsyncValue.data(null));
  Future<void> addDoctorLeave({
    required int doctorId,
    required List<DateTime> leaveDates,
    required String reason,
    required BuildContext context,
  }) async {
    try {
      state = AsyncValue.loading();

      final body = AddLeaveBodyModel(
        doctorId: doctorId,
        leaveDates: leaveDates,
        reason: reason,
      );
      final service = APIStateNetwork(callDio());
      final response = await service.addLeave(body);
      final data = response.response.data;

      // ✅ ALWAYS STOP LOADING
      state = AsyncValue.data(data);

      if (response.response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Add Leave Sucess"),
            backgroundColor: Color(0xFF067594),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong"),
            backgroundColor: Color(0xFF067594),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
          ),
        );
      }
    } catch (e, st) {
      state = const AsyncValue.data(null);

      log(e.toString());
      log(st.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error $e"),
          backgroundColor: Color(0xFF067594),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
        ),
      );
    }
  }
}

final addLeaveProvider =
    StateNotifierProvider<
      AddlLeaveController,
      AsyncValue<Map<String, dynamic>?>
    >((ref) {
      return AddlLeaveController();
    });
