import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Controller/myLeaveController.dart';
import 'package:siha_health_doctor_side/data/Model/leaveUpdateBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/leaveUpdateResModel.dart';

class LeaveUpdateControlelr
    extends StateNotifier<AsyncValue<LeaveUpdateResModel?>> {
  final Ref ref;
  LeaveUpdateControlelr(this.ref) : super(AsyncValue.data(null));

  Future<void> updateLeave({
    required int doctorId,
    required List<DateTime> leaveDates,
    required String reason,
    required String id,
    required BuildContext context,
  }) async {
    try {
      state = AsyncValue.loading();
      final body = LeaveUpdateBodyModel(
        doctorId: doctorId,
        leaveDates: leaveDates,
        reason: reason,
      );
      final service = APIStateNetwork(callDio());
      final resposne = await service.leaveUpdate(id, body);
      if (resposne.status == true) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(resposne.message ?? "Update sucess"),
        //     backgroundColor: Color(0xFF067594),
        //     behavior: SnackBarBehavior.floating,
        //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     elevation: 6,
        //   ),
        // );
        ref.invalidate(myLeaveListController);
        Navigator.pop(context);
        state = AsyncValue.data(resposne);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(resposne.message ?? "Error"),
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

final updateLeaveProvider =
    StateNotifierProvider<
      LeaveUpdateControlelr,
      AsyncValue<LeaveUpdateResModel?>
    >((ref) {
      return LeaveUpdateControlelr(ref);
    });
