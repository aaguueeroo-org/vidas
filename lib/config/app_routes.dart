import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/model/vida.dart';
import 'package:vidas/view/vida/vida_view.dart';
import 'package:vidas/view/vida/vida_view_model.dart';

/// Contains methods for navigating between views.
class AppRoutes {

  /// Replaces the current view with a new [VidaView] and adds the
  /// [VidaViewModel] to the widget tree.
  static void createVidaView(NavigatorState navigator, Vida vida) {
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => VidaViewModel(vida: vida),
          child: const VidaView(),
        ),
      ),
    );
  }
}