import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DBackLogin.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DHome.screen.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/verifyOtpBodyModel.dart';
import 'package:siha_health_doctor_side/data/Model/verifyOtpResModel.dart';

class VerifyOtpController
    extends StateNotifier<AsyncValue<VerifyOtpResModel?>> {
  VerifyOtpController() : super(AsyncValue.data(null));

  Future<void> otpVerify({
    required String email,
    String? fullName,
    required String phoneNumber,
    required String emailOtp,
    required String phoneOtp,
    String? confirmPassword,
    required BuildContext context,
  }) async {
    try {
      state = AsyncValue.loading();
      final body = VerifyOtpBodyModel(
        email: email,
        emailOtp: emailOtp,
        phoneNumber: phoneNumber,
        phoneOtp: phoneOtp,
      );
      final service = APIStateNetwork(callDio());
      final response = await service.verifyOtp(body);
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
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => DBackLoginScreen()),
          (route) => false,
        );
        state = AsyncValue.data(response);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      log(e.toString());
    }
  }
}

final verifyOtpProvider =
    StateNotifierProvider<VerifyOtpController, AsyncValue<VerifyOtpResModel?>>((
      ref,
    ) {
      return VerifyOtpController();
    });
