import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SearchFieldStyle {
  withContainer,
  noContainer,
  withLeading,
}

class SearchFieldPage extends StatelessWidget {
  const SearchFieldPage({super.key, required this.style});

  final SearchFieldStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 200),
          child: switch (style) {
            SearchFieldStyle.withContainer => SearchField(
                hintText: 'Search',
                suffixIcon: Icon(Icons.mic_none, color: context.color.fgMuted),
              ),
            SearchFieldStyle.noContainer => SearchField(
                hintText: 'Search',
                type: SearchFieldType.noContainer,
                prefixIcon: Icon(Icons.search, color: context.color.fgMuted),
                suffixIcon: Icon(Icons.mic_none, color: context.color.fgMuted),
              ),
            SearchFieldStyle.withLeading => SearchField(
                hintText: 'Search',
                autoImautomaticallyImplyLeading: true,
                suffixIcon: Icon(Icons.clear, color: context.color.fgMuted),
              ),
          },
        ),
      ),
    );
  }
}
