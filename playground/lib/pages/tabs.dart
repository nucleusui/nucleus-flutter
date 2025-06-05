import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum TabsStyle {
  basic,
  topIcon,
  bottomIcon,
}

class TabsPage extends StatefulWidget {
  const TabsPage({super.key, required this.style});

  final TabsStyle style;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (widget.style) {
                TabsStyle.basic => const Tabs(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                TabsStyle.topIcon => const Tabs(
                    tabs: [
                      Tab(
                        text: 'Tab 1',
                        icon: Icon(Icons.circle_outlined, size: 20),
                      ),
                      Tab(
                        text: 'Tab 2',
                        icon: Icon(Icons.circle_outlined, size: 20),
                      ),
                      Tab(
                        text: 'Tab 3',
                        icon: Icon(Icons.circle_outlined, size: 20),
                      ),
                    ],
                  ),
                TabsStyle.bottomIcon => Tabs(
                    onTap: (value) => setState(() => selectedIndex = value),
                    tabs: [
                      (label: 'Home', icon: 'assets/home.svg'),
                      (label: 'Star', icon: 'assets/location.svg'),
                      (label: 'Settings', icon: 'assets/square.svg'),
                    ].asMap().entries.map((e) {
                      final active = selectedIndex == e.key;
                      return Tab(
                        child: Column(
                          spacing: 4,
                          children: [
                            SvgPicture.asset(
                              e.value.icon,
                              width: 16,
                              height: 16,
                              colorFilter: ColorFilter.mode(
                                active
                                    ? context.color.accentModerate
                                    : context.color.fgSubtle,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              e.value.label,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight:
                                    active ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
