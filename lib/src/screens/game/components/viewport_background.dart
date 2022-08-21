import 'package:flutter/material.dart';

import 'package:flame/components.dart';

import '../../../configuration/configuration.dart';

class ViewportBackground extends RectangleComponent {
  ViewportBackground({super.size});

  @override
  Paint get paint => Paint()..color = GameColors.lavenderGrey;
}
