import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/model/vida.dart';
import 'package:vidas/view/game_shell_view.dart';
import 'package:vidas/view/vida/vida_view.dart';
import 'package:vidas/view/vida/vida_view_model.dart';
import 'package:vidas/view/options/options_view.dart';
import 'package:vidas/view/education/education_view_model.dart';

import 'package:vidas/config/get_it.dart';

/// Contains methods for navigating between views.
class AppRoutes {
  /// Replaces the current view with a new [VidaView] and adds the
  /// [VidaViewModel] to the widget tree.
  static void createVidaView(
    NavigatorState navigator,
  ) {
    // Removes al views in stack
    navigator.popUntil((route) => route.isFirst);

    // Shows VidaView as the only view in the stack.
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<VidaViewModel>(
              create: (_) => VidaViewModel(),
            ),
            ChangeNotifierProvider<EducationViewModel>(
              create: (_) => EducationViewModel(),
            ),
          ],
          child: const GameShellView(),
        ),
      ),
    );
  }

  /// Shows the options view.
  static void pushOptionView(
    BuildContext context,
  ) {
    Vida vida = locator.get<Vida>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OptionsView(vida: vida),
      ),
    );
  }
}
