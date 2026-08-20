import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'info_package_state.dart';

class InfoPackageCubit extends Cubit<InfoPackageState> {
  InfoPackageCubit() : super(InfoPackageInitial());

  Future<void> getVersion() async {

      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;

      emit(CurrentVersion(version: version));

  }
}