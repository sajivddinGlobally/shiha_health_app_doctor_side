import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DBackLogin.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/Dotp.screen.dart';
import 'package:siha_health_doctor_side/data/Controller/hospitalListController.dart';
import 'package:siha_health_doctor_side/data/Controller/registerController.dart';

class DPracticeScreen extends ConsumerStatefulWidget {
  const DPracticeScreen({super.key});

  @override
  ConsumerState<DPracticeScreen> createState() => _DPracticeScreenState();
}

class _DPracticeScreenState extends ConsumerState<DPracticeScreen> {
  final experienceController = TextEditingController();
  final qualificationController = TextEditingController();
  final licenseNumberController = TextEditingController();
  final fessController = TextEditingController();

  String? selectedSpecialization;
  int? selectedHospitalId;

  final List<String> specializations = [
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Pediatrician",
    "Psychiatrist",
    "Orthopedic",
    "Dentist",
  ];

  File? selectedLicenseFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickLicenseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        selectedLicenseFile = File(pickedFile.path);
      });
    }
  }

  Future<void> pickLicenseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedLicenseFile = File(pickedFile.path);
      });
    }
  }

  void showLicensePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickLicenseFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickLicenseFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hospitalListState = ref.watch(hospitalListController);
    final registerState = ref.watch(registerProvider);
    final isLoading = registerState.isLoading;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/homebg.png",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
                // fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    "Tell Us About Your Practice",
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                      letterSpacing: -1,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "We need your professional details to verify your profile.",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Colors.white24, height: 1.h),
                  SizedBox(height: 60.h),
                  DropdownButtonFormField<String>(
                    hint: Text(
                      "--Select Specialization--",
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262933),
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 18.w,
                        right: 18.w,
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    value: selectedSpecialization,
                    items: specializations.map((specialization) {
                      return DropdownMenuItem<String>(
                        value: specialization,
                        child: Text(
                          specialization,
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSpecialization = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "YEAR OF EXPERIENCE",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: experienceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 18.w,
                        right: 18.w,
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      hintText: "experience",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262933),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "QUALIFICATIONS",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: qualificationController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 18.w,
                        right: 18.w,
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      hintText: "xxxxxxxx",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262933),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "MEDICLA LICENSE NUMBER",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: licenseNumberController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 18.w,
                        right: 18.w,
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262933),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "UPLOAD LICENSE",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Container(
                    width: 400.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: showLicensePicker, // 👈 click here
                          child: Container(
                            margin: EdgeInsets.only(left: 18.w),
                            width: 87.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Color(0xFF067594),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Center(
                              child: Text(
                                "Choose File",
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        /// 👇 file name show
                        Expanded(
                          child: Text(
                            selectedLicenseFile != null
                                ? selectedLicenseFile!.path.split('/').last
                                : "No file chosen",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Color(0xFF1E1E1E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "SELECT HISPITAL",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  hospitalListState.when(
                    data: (data) {
                      return DropdownButtonFormField<int>(
                        hint: Text(
                          "--Select Hospital--",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 18.w,
                            right: 18.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        value: selectedHospitalId,
                        items: data.map((e) {
                          return DropdownMenuItem<int>(
                            value: e.id,
                            child: Text(
                              e.name ?? "",
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedHospitalId = value;
                            log(selectedHospitalId.toString());
                          });
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      log(error.toString());
                      log(stackTrace.toString());
                      return Center(
                        child: Text(
                          error.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    loading: () => Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "CONSULATION FEE",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: fessController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 18.w,
                        right: 18.w,
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      hintText: "xxxxxxxx",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262933),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400.w, 55.h),
                      backgroundColor: Color(0xFF067594),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      final notifier = ref.read(registerProvider.notifier);
                      notifier.specialty = selectedSpecialization;
                      notifier.experienceYears = int.tryParse(
                        experienceController.text.trim(),
                      );
                      notifier.qualifications = qualificationController.text
                          .trim();
                      notifier.medicalLicenseNumber = int.tryParse(
                        licenseNumberController.text.trim(),
                      );
                      notifier.licensefile = selectedLicenseFile;
                      notifier.hospitalId = selectedHospitalId;
                      notifier.consultationFees = int.tryParse(
                        fessController.text.trim(),
                      );
                      final isSuccess = await notifier.registerDoctor(context);

                      if (isSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => DBackLoginScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: isLoading
                        ? Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.5,
                              ),
                            ),
                          )
                        : Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
