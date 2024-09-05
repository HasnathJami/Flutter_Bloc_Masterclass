import 'package:equatable/equatable.dart';

class MultipleStateStates extends Equatable {
  bool isSwitch;
   double slider;

   MultipleStateStates({this.isSwitch = false, this.slider = 1.0});

  @override
  List<Object?> get props => [isSwitch, slider];

  MultipleStateStates copyWith({bool? isSwitch, double? slider}) {
    return MultipleStateStates(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }
}
