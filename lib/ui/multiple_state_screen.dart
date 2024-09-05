import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_event.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_state.dart';

class MultipleStateScreen extends StatefulWidget {
  const MultipleStateScreen({super.key});

  @override
  State<MultipleStateScreen> createState() => _MultipleStateScreenState();
}

class _MultipleStateScreenState extends State<MultipleStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple States'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<MultipleStateBloc, MultipleStateStates>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            context
                                .read<MultipleStateBloc>()
                                .add(EnableOrDisableNotification());
                          });
                    })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<MultipleStateBloc, MultipleStateStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<MultipleStateBloc, MultipleStateStates>(
                builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print(value);
                    context
                        .read<MultipleStateBloc>()
                        .add(IncreaseOrDecreaseSliderValue(sliderValue: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}
