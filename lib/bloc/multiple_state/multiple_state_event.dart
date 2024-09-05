abstract class MultipleStateEvent {
  MultipleStateEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends MultipleStateEvent {}

class IncreaseOrDecreaseSliderValue extends MultipleStateEvent {
  double sliderValue;

  IncreaseOrDecreaseSliderValue({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];

}
