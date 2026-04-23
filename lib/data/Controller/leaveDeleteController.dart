import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Controller/myLeaveController.dart';
import 'package:siha_health_doctor_side/data/Model/leaveDeleteResModel.dart';

class LeaveDeleteController
    extends StateNotifier<AsyncValue<LeaveDeleteResModel?>> {
  final Ref ref;
  LeaveDeleteController(this.ref) : super(AsyncValue.data(null));
  Future<bool> deleteLeave({
    required String id,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncValue.loading();

      final service = APIStateNetwork(callDio());
      final response = await service.leaveDelete(id);
      if (response.status == true) {
        ref.invalidate(myLeaveListController);

        /// ✅ Refresh list
        ref.invalidate(myLeaveListController);

        /// ✅ Close dialog FIRST
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? "Delete"),
            backgroundColor: Color(0xFF067594),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
          ),
        );
        state = AsyncValue.data(response);

        return true;
      } else {
        state = const AsyncValue.data(null);

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
        return false;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error deleting leave"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
        ),
      );
      return false;
    }
  }
}

final leaveDeleteProvider =
    StateNotifierProvider<
      LeaveDeleteController,
      AsyncValue<LeaveDeleteResModel?>
    >((ref) {
      return LeaveDeleteController(ref);
    });
