import 'package:flutter/material.dart';

class SlidingButton extends StatefulWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double containerHeight;
  final double borderRadius;
  final double maxContainerWidth;
  final double padding;
  final String buttonText;

  const SlidingButton({
    super.key,
    this.buttonWidth = 60.0,
    this.buttonHeight = 40.0,
    this.containerHeight = 40.0,
    this.borderRadius = 18.0,
    this.maxContainerWidth = 156.0,
    this.padding = 8.0,
    this.buttonText = 'Glad Kova St 25',
  });

  @override
  _SlidingButtonState createState() => _SlidingButtonState();
}

class _SlidingButtonState extends State<SlidingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isOpened = false;
  double dragPosition = 0.0;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animation
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.maxContainerWidth - widget.buttonWidth,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    // Start Animation
    _controller.forward();

    // Listen to Animation Changes
    _animation.addListener(() {
      setState(() {
        dragPosition = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Container(
        width: widget.maxContainerWidth,
        height: widget.containerHeight,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: dragPosition,
              top: (widget.containerHeight - widget.buttonHeight) / 2,
              child: Container(
                width: widget.buttonWidth,
                height: widget.buttonHeight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    setState(() {
      dragPosition = details.localPosition.dx
          .clamp(0.0, widget.maxContainerWidth - widget.buttonWidth);
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.localPosition.dx
          .clamp(0.0, widget.maxContainerWidth - widget.buttonWidth);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() {
      if (dragPosition >=
          (widget.maxContainerWidth - widget.buttonWidth) * 0.75) {
        isOpened = true;
      } else {
        isOpened = false;
        dragPosition = 0.0;
      }
    });
  }
}
