import 'package:equatable/equatable.dart';

class ToggleIconState extends Equatable {
  final bool togglePasswordVisibility;
  final bool toggleTermsVisibility;
  final Map<int, bool> toggleNotificationSwitch;
  final Map<int, bool> toggleSecuritySwitch;
  final Map<int, bool> showAnswer;
  const ToggleIconState({
    this.togglePasswordVisibility = true,
    this.toggleTermsVisibility = false,
    this.toggleNotificationSwitch = const {},
    this.toggleSecuritySwitch = const {},
    this.showAnswer = const {},
  });

  ToggleIconState copyWith({
    bool? togglePasswordVisibility,
    bool? toggleTermsVisibility,
    Map<int, bool>? toggleSwitch,
    Map<int, bool>? toggleSecuritySwitch,
    Map<int, bool>? showAnswer,
  }) {
    return ToggleIconState(
      togglePasswordVisibility:
          togglePasswordVisibility ?? this.togglePasswordVisibility,
      toggleTermsVisibility:
          toggleTermsVisibility ?? this.toggleTermsVisibility,
      toggleNotificationSwitch: toggleSwitch ?? this.toggleNotificationSwitch,
      showAnswer: showAnswer ?? this.showAnswer,
      toggleSecuritySwitch: toggleSecuritySwitch ?? this.toggleSecuritySwitch,
    );
  }

  @override
  List<Object?> get props => [
    togglePasswordVisibility,
    toggleTermsVisibility,
    toggleNotificationSwitch,
    showAnswer,
    toggleSecuritySwitch,
  ];
}
