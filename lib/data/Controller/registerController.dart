import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/registerDotorResModel.dart';

class RegisterController
    extends StateNotifier<AsyncValue<RegisterDoctorResModel?>> {
  RegisterController() : super(AsyncValue.data(null));
  // 🔥 STEP 1 DATA
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  File? profilePic;

  // 🔥 STEP 2 DATA
  String? specialty;
  int? experienceYears;
  int? hospitalId;
  int? consultationFees;
  int? medicalLicenseNumber;
  String? qualifications;
  File? licensefile;

  Future<bool> registerDoctor(BuildContext context) async {
    try {
      state = AsyncValue.loading();

      final service = APIStateNetwork(callDio());

      final profile = profilePic != null
          ? await MultipartFile.fromFile(profilePic!.path)
          : null;

      final license = licensefile != null
          ? await MultipartFile.fromFile(licensefile!.path)
          : null;
      final response = await service.registerDoctor(
        fullName!,
        phoneNumber!,
        email!,
        password!,
        specialty!,
        experienceYears!,
        hospitalId!,
        consultationFees!,
        medicalLicenseNumber!,
        qualifications!,
        profile,
        license,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${response.message ?? "Success"}"),
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
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      log(st.toString());
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
  }
}

final registerProvider =
    StateNotifierProvider<
      RegisterController,
      AsyncValue<RegisterDoctorResModel?>
    >((ref) {
      return RegisterController();
    });
