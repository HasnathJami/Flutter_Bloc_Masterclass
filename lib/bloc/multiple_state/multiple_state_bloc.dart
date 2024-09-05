import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_event.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_state.dart';

class MultipleStateBloc extends Bloc<MultipleStateEvent, MultipleStateStates> {
  MultipleStateBloc() : super( MultipleStateStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<IncreaseOrDecreaseSliderValue>(_increaseOrDecreaseSliderValue);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification events, Emitter<MultipleStateStates> emit) {
    emit(state.copyWith(isSwitch:!state.isSwitch));
  }

  void _increaseOrDecreaseSliderValue(IncreaseOrDecreaseSliderValue events, Emitter<MultipleStateStates> emit) {
    emit(state.copyWith(slider:events.sliderValue));

  }
}
