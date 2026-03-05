import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/logic/toggle/toggle_icon_state.dart';

class ToggleIconCubit extends Cubit<ToggleIconState> {
  ToggleIconCubit() : super(ToggleIconState()) {
    loadNotificationSwitches();
    loadSecuritySwitches();
  }

  void togglePasswordVisibility() {
    emit(
      state.copyWith(togglePasswordVisibility: !state.togglePasswordVisibility),
    );
  }

  void toggleCheckBoxVisibility() {
    emit(state.copyWith(toggleTermsVisibility: !state.toggleTermsVisibility));
  }

  void toggleNotificationSwitch(int index) async {
    final updatedSwitches = Map<int, bool>.from(state.toggleNotificationSwitch);
    updatedSwitches[index] = !(updatedSwitches[index] ?? false);
    emit(state.copyWith(toggleSwitch: updatedSwitches));
    await CacheHelper.appSettings!.put(
      ApiKeys.notificationSwitches,
      updatedSwitches,
    );
  }

  void loadNotificationSwitches() {
    final savedSwitch = CacheHelper.appSettings!.get(
      ApiKeys.notificationSwitches,
    );
    if (savedSwitch != null) {
      final loadedSwitches = Map<int, bool>.from(savedSwitch);
      emit(state.copyWith(toggleSwitch: loadedSwitches));
    }
  }

  void toggleSecuritySwitches(int index) async {
    final updatedSwitch = Map<int, bool>.from(state.toggleSecuritySwitch);
    updatedSwitch[index] = !(updatedSwitch[index] ?? false);
    emit(state.copyWith(toggleSecuritySwitch: updatedSwitch));
    await CacheHelper.appSettings!.put(ApiKeys.securitySwitches, updatedSwitch);
  }

  void loadSecuritySwitches() {
    final loadedSwitched = CacheHelper.appSettings!.get(
      ApiKeys.securitySwitches,
    );
    if (loadedSwitched != null) {
      final switched = Map<int, bool>.from(loadedSwitched);
      emit(state.copyWith(toggleSecuritySwitch: switched));
    }
  }

  void showAnswer(int index) {
    final answerIsShown = Map<int, bool>.from(state.showAnswer);
    answerIsShown[index] = !(answerIsShown[index] ?? false);
    emit(state.copyWith(showAnswer: answerIsShown));
  }
}
