import 'package:flutter/material.dart';

enum FadeType { fadeIn, fadeInRigth, fadeInLeft, fadeInTop, fadeInBottom }

class FadeAnimation extends StatefulWidget {
  final FadeType fadeType;
  final Widget child;
  final Duration? duration;
  const FadeAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 300),
      this.fadeType = FadeType.fadeIn})
      : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;

  @override
  void initState() {
    animatedController =
        AnimationController(vsync: this, duration: widget.duration);
    animatedController.forward();
    super.initState();
  }

  @override 
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animatedController,
        builder: (context, child) {
          switch (widget.fadeType) {
            case FadeType.fadeIn:
              return AnimatedOpacity(
                  duration: widget.duration!,
                  opacity: animatedController.value,
                  child: widget.child);
            case FadeType.fadeInLeft:
              return AnimatedOpacity(
                  duration: widget.duration!,
                  opacity: animatedController.value,
                  child: Transform.translate(
                      offset: Offset(100 - 100 * animatedController.value, 0),
                      child: widget.child));
            case FadeType.fadeInRigth:
              return AnimatedOpacity(
                  duration: widget.duration!,
                  opacity: animatedController.value,
                  child: Transform.translate(
                      offset: Offset(-100 + 100 * animatedController.value, 0),
                      child: widget.child));
            case FadeType.fadeInBottom:
              return AnimatedOpacity(
                  duration: widget.duration!,
                  opacity: animatedController.value,
                  child: Transform.translate(
                      offset: Offset(0, -100 + 100 * animatedController.value),
                      child: widget.child));
            case FadeType.fadeInTop:
              return AnimatedOpacity(
                  duration: widget.duration!,
                  opacity: animatedController.value,
                  child: Transform.translate(
                      offset: Offset(0, 100 - 100 * animatedController.value),
                      child: widget.child));
          }
        });
  }
}
