import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/DoctorScreen/Dotp.screen.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/registerSendEmailResModel.dart';

class RegisterSendEmailControlle
    extends StateNotifier<AsyncValue<RegisterSendEmailResModel?>> {
  RegisterSendEmailControlle() : super(AsyncValue.data(null));

  Future<void> registerSendEmail({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      state = AsyncValue.loading();

      final body = RegisterSendEmailBodyModel(
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
      );
      final service = APIStateNetwork(callDio());
      final response = await service.registerSendEmail(body);
      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("OTP Send Sucess"),
            backgroundColor: Color(0xFF067594),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
          ),
        );
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => DOtpScreen()),
        );
        state = AsyncValue.data(response);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error : $e"),
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

final registerSendEmailProvider =
    StateNotifierProvider<
      RegisterSendEmailControlle,
      AsyncValue<RegisterSendEmailResModel?>
    >((ref) {
      return RegisterSendEmailControlle();
    });
