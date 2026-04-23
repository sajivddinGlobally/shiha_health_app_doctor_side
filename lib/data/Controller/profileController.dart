import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siha_health_doctor_side/config/network/api.state.dart';
import 'package:siha_health_doctor_side/config/utils/pretty.dio.dart';
import 'package:siha_health_doctor_side/data/Model/profileResModel.dart';

final profileController = FutureProvider.autoDispose<ProfileResModel>((
  ref,
) async {
  final service = APIStateNetwork(callDio());
  return await service.fetchProfile();
});
