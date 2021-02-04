import 'package:example_navigator_20/data/model/profile/user_profile_model.dart';
import 'package:example_navigator_20/data/repository/app_repository.dart';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  AppRepository _appRepository = AppRepository();

  DashboardCubit() : super(DashboardState.init());

  getProfile() async {
    emit(DashboardState.loading());
    final result = await _appRepository.getProfileUser();
    if (result.code == 200) {
      UserProfileModel data = UserProfileModel.fromJson(result.data);
      emit(DashboardState.loaded(profile: data));
    }
  }

}