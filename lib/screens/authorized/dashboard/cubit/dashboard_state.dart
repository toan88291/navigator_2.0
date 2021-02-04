part of 'dashboard_cubit.dart';

@freezed
abstract class DashboardState with _$DashboardState{
  const factory DashboardState.init() = _Init;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({UserProfileModel profile}) = _Loaded;
}
