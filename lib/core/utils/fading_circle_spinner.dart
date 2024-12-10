import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math' as math show sin, pi;

class FadingCircleSpinner extends StatefulWidget {
  const FadingCircleSpinner({
    super.key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color');

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  FadingCircleSpinnerState createState() => FadingCircleSpinnerState();
}

class FadingCircleSpinnerState extends State<FadingCircleSpinner>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(delays.length, (i) {
            final position = widget.size * .5;

            return Positioned.fill(
              left: position,
              bottom: position,
              child: Transform(
                transform: Matrix4.rotationZ(3.5),
                child: Transform(
                  transform: Matrix4.rotationZ(30 * i * 0.03),
                  child: Align(
                    alignment: Alignment.center,
                    child: FadeTransition(
                      opacity:
                          _DelayTween(begin: 0.0, end: 1.0, delay: delays[i])
                              .animate(_controller),
                      child: SizedBox.fromSize(
                          size: Size.square(widget.size * i * 0.04),
                          child: _itemBuilder(i)),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        );
}

class _DelayTween extends Tween<double> {
  _DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
