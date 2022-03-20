import 'package:flutter/material.dart';

class UpToDown extends StatefulWidget {
  final Duration duration;
  final Widget child;
  const UpToDown({
    Key key,
    this.duration = const Duration(milliseconds: 300),
    @required this.child,
  }) : super(key: key);

  @override
  _UpToDownState createState() => _UpToDownState();
}

class _UpToDownState extends State<UpToDown> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    // _animation = Tween<double>(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(_controller);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          final value = _animation.value;
          return Transform.translate(
            offset: Offset(
              0,
              -(1 - value) * constraints.maxHeight * 0.1,
            ),
            child: Opacity(
              opacity: value.clamp(0, 1),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
