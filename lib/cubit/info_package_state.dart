part of 'info_package_cubit.dart';

@immutable
sealed class InfoPackageState {}

class InfoPackageInitial extends InfoPackageState {}

class CurrentVersion extends InfoPackageState {
  final String version;

  CurrentVersion({
    required this.version,
  });
}

