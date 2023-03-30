import 'package:betterrank/config/routes/app_routes.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.child, super.key});

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Widget _child;

  var _currentIndex = 0;
  final List<String> _pages = [
    AppRoutes.trending,
    AppRoutes.search,
    AppRoutes.create,
    AppRoutes.notifications,
    AppRoutes.profile,
  ];

  @override
  void initState() {
    super.initState();
    _child = widget.child;
  }

  void _onTabClick(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    context.go(_pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(child: _child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        unselectedLabelStyle: GoogleFonts.inter(
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .unselectedItemColor
              ?.withOpacity(.5),
        ),
        unselectedItemColor: Theme.of(context)
            .bottomNavigationBarTheme
            .unselectedItemColor
            ?.withOpacity(.5),
        fixedColor: Theme.of(context).textSelectionTheme.cursorColor,
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.trending_up_rounded),
            ),
            label: l10n.trending,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.search_rounded),
            ),
            label: l10n.search,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.add_circle_outline_rounded),
            ),
            label: l10n.create,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.notifications_none_rounded),
            ),
            label: l10n.notifications,
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.person_2_outlined),
            ),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}
