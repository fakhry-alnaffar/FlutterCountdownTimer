import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

Widget _defaultCountdownBuilder(
  BuildContext context,
  Duration currentRemainingTime,
) {
  return Text('${currentRemainingTime.inSeconds}');
}

typedef CountdownWidgetBuilder = Widget Function(
    BuildContext context, Duration time);

class Countdown extends StatefulWidget {
  ///controller
  final CountdownController countdownController;
  ///custom widget builder
  final CountdownWidgetBuilder builder;

  const Countdown({super.key,
    required this.countdownController,
    this.builder = _defaultCountdownBuilder,
  });

  @override
  CountdownState createState() => CountdownState();
}

class CountdownState extends State<Countdown> {
  CountdownWidgetBuilder get builder => widget.builder;

  CountdownController get countdownController => widget.countdownController;

  @override
  void initState() {
    super.initState();
    countdownController.addListener(() {
      setState(() {});
    });
  }

  Duration get time => countdownController.currentDuration;

  @override
  Widget build(BuildContext context) {
    return builder.call(context, time);
  }

  @override
  void dispose() {
    countdownController.dispose();
    super.dispose();
  }
}
