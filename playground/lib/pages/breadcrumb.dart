import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum BreadcrumbStyle {
  slash,
  chevron,
  withIcons,
  withEllipsis,
  withDropdown,
}

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key, required this.style});

  final BreadcrumbStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                switch (style) {
                  BreadcrumbStyle.slash => Breadcrumb(items: [
                      BreadcrumbItem(label: 'Parent'),
                      BreadcrumbItem(label: 'Parent'),
                      BreadcrumbItem(label: 'Parent'),
                      BreadcrumbItem(label: 'Current', isActive: true),
                    ]),
                  BreadcrumbStyle.chevron => Breadcrumb(
                      separatorIcon: Icons.chevron_right,
                      items: [
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Current', isActive: true),
                      ],
                    ),
                  BreadcrumbStyle.withIcons => Breadcrumb(
                      items: [
                        BreadcrumbItem(
                          label: 'Parent',
                          icon: SvgPicture.asset('assets/home.svg', width: 14),
                        ),
                        BreadcrumbItem(
                          label: 'Parent',
                          icon: SvgPicture.asset('assets/cube.svg', width: 14),
                        ),
                        BreadcrumbItem(
                          label: 'Parent',
                          icon:
                              SvgPicture.asset('assets/circle.svg', width: 14),
                        ),
                        BreadcrumbItem(
                          label: 'Current',
                          isActive: true,
                          icon:
                              SvgPicture.asset('assets/square.svg', width: 14),
                        ),
                      ],
                    ),
                  BreadcrumbStyle.withEllipsis => Breadcrumb(
                      maxVisibleItems: 2,
                      showEllipsis: true,
                      items: [
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Current', isActive: true),
                      ],
                    ),
                  BreadcrumbStyle.withDropdown => Breadcrumb(
                      items: [
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(
                          label: 'Parent',
                          isDropdown: true,
                          onTap: () => debugPrint('object'),
                        ),
                        BreadcrumbItem(label: 'Parent'),
                        BreadcrumbItem(label: 'Current', isActive: true),
                      ],
                    ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
