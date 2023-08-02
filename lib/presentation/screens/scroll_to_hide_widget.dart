import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const kBottomNavigationBarHeight = 56.0;

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget({
    super.key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listen);
  }

  void listen() {
    final scrollDirection = widget.controller.position.userScrollDirection;
    if (scrollDirection == ScrollDirection.forward) {
      show();
    } else {
      hide();
    }
  }

  void show() {
    if (!_isVisible) setState(() => _isVisible = true);
  }

  void hide() {
    if (_isVisible) setState(() => _isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: _isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(children: [widget.child]),
    );
  }
}
