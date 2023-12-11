import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:vidas/view/education/education_view.dart';
import 'package:vidas/view/vida/vida_view.dart';

class GameShellView extends StatefulWidget {
  const GameShellView({super.key});

  @override
  GameShellViewState createState() => GameShellViewState();
}

class GameShellViewState extends State<GameShellView> {
  final PageController _pageController = PageController(initialPage: 1);
  int _selectedTab = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          EducationView(),
          VidaView(),
          // StatsView(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        elevation: 0,
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.school, title: 'Education'),
          TabItem(icon: Icons.heart_broken, title: 'Vida'),
          // TabItem(icon: Icons.bar_chart, title: 'Stats'),
        ],
        initialActiveIndex: _selectedTab,
        onTap: _onTap,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        activeColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
