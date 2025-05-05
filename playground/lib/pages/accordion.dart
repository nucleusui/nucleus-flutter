import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum AccordionStyle {
  simple,
  card,
}

class AccordionPage extends StatelessWidget {
  const AccordionPage({super.key, required this.style});

  final AccordionStyle style;

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        title: 'What is accordion in UI design?',
        content:
            'An accordion is a vertically stacked list of items that can be expanded or collapsed to reveal more information.',
      ),
      (
        title: 'What is accordion in UI design?',
        content:
            'An accordion is a vertically stacked list of items that can be expanded or collapsed to reveal more information.',
      ),
    ];
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (style) {
                AccordionStyle.simple => Accordion(
                    items: items.map((e) {
                      return AccordionItem(
                        title: e.title,
                        content: e.content,
                      );
                    }).toList(),
                  ),
                AccordionStyle.card => Accordion(
                    type: AccordionType.card,
                    items: items.map((e) {
                      return AccordionItem(
                        title: e.title,
                        content: e.content,
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
