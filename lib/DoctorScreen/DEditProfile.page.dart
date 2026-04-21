import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DEditProfilePage extends StatefulWidget {
  const DEditProfilePage({super.key});

  @override
  State<DEditProfilePage> createState() => _DEditProfilePageState();
}

class _DEditProfilePageState extends State<DEditProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  /// 📸 Camera
  Future<void> pickFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  /// 🖼 Gallery
  Future<void> pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
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
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Image.asset(
            "assets/homebg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Back + Title
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Update Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  /// Profile Image
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.white24,
                          // child: Icon(
                          //   Icons.person,
                          //   size: 50.sp,
                          //   color: Colors.white,
                          // ),
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!)
                              : null,
                          child: selectedImage == null
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

                  SizedBox(height: 30.h),

                  /// Form Fields
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildTextField("Full Name", nameController),

                          buildTextField("Email", emailController),

                          buildTextField("Phone Number", phoneController),

                          buildTextField("Bio", bioController, maxLines: 3),

                          SizedBox(height: 30.h),

                          /// Update Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50.h),
                              backgroundColor: Color(0xFF067594),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              // API call here
                            },
                            child: Text(
                              "Update Profile",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common TextField Widget
  Widget buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        // style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF262933),
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
      ),
    );
  }
}
