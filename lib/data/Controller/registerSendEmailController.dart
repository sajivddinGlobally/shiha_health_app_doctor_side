// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:siha_health_doctor_side/DoctorScreen/Dotp.screen.dart';
// import 'package:siha_health_doctor_side/config/network/api.state.dart';
// import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
// import 'package:siha_health_doctor_side/data/Model/registerSendEmailBodyModel.dart';
// import 'package:siha_health_doctor_side/data/Model/registerSendEmailResModel.dart';

// class LoginSendEmailControlle
//     extends StateNotifier<AsyncValue<RegisterSendEmailResModel?>> {
//   LoginSendEmailControlle() : super(AsyncValue.data(null));

//   Future<void> loginSendEmail({
//     required String email,
//     String? fullName,
//     String? phoneNumber,
//     required String password,
//     String? confirmPassword,
//     required BuildContext context,
//   }) async {
//     try {
//       state = AsyncValue.loading();

//       final body = RegisterSendEmailBodyModel(
//         email: email,
//         fullName: fullName,
//         phoneNumber: phoneNumber,
//         password: password,
//         confirmPassword: confirmPassword,
//       );
//       final service = APIStateNetwork(callDio());
//       final response = await service.loginSendEmail(body);
//       if (response != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("OTP Send Sucess"),
//             backgroundColor: Color(0xFF067594),
//             behavior: SnackBarBehavior.floating,
//             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             elevation: 6,
//           ),
//         );
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => DOtpScreen(email: email, phone: phoneNumber),
//           ),
//         );
//         state = AsyncValue.data(response);
//       }
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }

// final loginSendEmailProvider =
//     StateNotifierProvider<
//       LoginSendEmailControlle,
//       AsyncValue<RegisterSendEmailResModel?>
//     >((ref) {
//       return LoginSendEmailControlle();
//     });
