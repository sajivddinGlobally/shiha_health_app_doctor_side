import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:siha_health_doctor_side/DoctorScreen/DPractice.screen.dart';
import 'package:siha_health_doctor_side/DoctorScreen/Dotp.screen.dart';
import 'package:siha_health_doctor_side/data/Controller/registerController.dart';
import 'package:siha_health_doctor_side/data/Controller/registerSendEmailController.dart';

class DSignUpScreen extends ConsumerStatefulWidget {
  const DSignUpScreen({super.key});

  @override
  ConsumerState<DSignUpScreen> createState() => _DSignUpScreenState();
}

class _DSignUpScreenState extends ConsumerState<DSignUpScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String fullPhoneNumber = "";
  File? selectProfile;
  final ImagePicker picker = ImagePicker();

  /// 📸 Camera
  Future<void> pickFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        selectProfile = File(pickedFile.path);
      });
    }
  }

  /// 🖼 Gallery
  Future<void> pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectProfile = File(pickedFile.path);
      });
    }
  }

  /// 📌 Bottom Sheet
  void showPickerOptions() {
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
                  pickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
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
    final registerState = ref.watch(registerProvider);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: Image.asset(
              //     "assets/homebg.png",
              //     width: MediaQuery.of(context).size.width,
              //     // height: MediaQuery.of(context).size.height,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/homebg.png"),
                    fit: BoxFit.fill, // 👈 important
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      "Create Your Doctor Account",
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
                      "Start by providing your basic details to get started with Siha Doctor.",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.white24, height: 1.h),
                    SizedBox(height: 30.h),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 55.r,
                            backgroundColor: Colors.white24,
                            backgroundImage: selectProfile != null
                                ? FileImage(selectProfile!)
                                : null,
                            child: selectProfile == null
                                ? const Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: showPickerOptions,
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Color(0xFF067594),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Full NAME",
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: fullNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        hintText: "Enter Your Full Name",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262933),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Full name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "YOUR EMAIL",
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        hintText: "Enter Your Email",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262933),
                        ),
                      ),
                      validator: (value) {
                        final email = value?.trim() ?? "";

                        if (email.isEmpty) {
                          return "Email is required";
                        }

                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );

                        if (!emailRegex.hasMatch(email)) {
                          return "Enter valid email";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "YOUR NUMBER",
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    IntlPhoneField(
                      controller: phoneController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 18.w,
                          right: 18.w,
                          top: 15.h,
                          bottom: 15.h,
                        ),
                        counterText: "",
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
                        hint: Text(
                          "Enter Your Phone",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262933),
                          ),
                        ),
                      ),
                      initialCountryCode: "IN",
                      onChanged: (phone) {
                        fullPhoneNumber = phone.completeNumber;
                      },
                      validator: (value) {
                        if (value == null || value.number.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "PASSWORD",
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 50.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400.w, 55.h),
                        backgroundColor: Color(0xFF067594),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        final notifier = ref.read(registerProvider.notifier);
                        notifier.fullName = fullNameController.text.trim();
                        notifier.email = emailController.text.trim();
                        notifier.phoneNumber = fullPhoneNumber.toString();
                        notifier.password = passwordController.text.trim();
                        notifier.profilePic = selectProfile;

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => DPracticeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
