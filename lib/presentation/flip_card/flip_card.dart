import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/flip_card/flip_card_model.dart';

class FlipCard extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;

  const FlipCard({
    super.key,
    required this.frontWidget,
    required this.backWidget,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late FlipCardModel _flipCardModel;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _flipCardModel = FlipCardModel();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _flipCardModel.flip();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_flipCardModel.isFrontVisible) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(pi * _animation.value),
            alignment: Alignment.center,
            child: _animation.value <= 0.5
                ? widget.frontWidget
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.backWidget,
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
