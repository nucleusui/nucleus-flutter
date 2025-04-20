import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// The interface for a tooltip builder. This is useful when the user wants to
/// insert the tooltip into a stack rather than an overlay
typedef TooltipBuilder = Widget Function(
  BuildContext context,
  Widget tooltip,

  /// This widget should be placed behind the tooltip. When tapped, it will
  /// collapse the tooltip. When, isModal is set to false, this will always be
  /// null
  Widget scrim,
);

class InheritedTooltipArea extends InheritedWidget {
  const InheritedTooltipArea({
    super.key,
    required this.data,
    required super.child,
  });
  final TooltipAreaState data;

  @override
  bool updateShouldNotify(covariant InheritedTooltipArea oldWidget) =>
      data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TooltipAreaState>('data', data));
  }
}

class TooltipArea extends StatefulWidget {
  const TooltipArea({super.key, required this.builder});
  final TooltipBuilder builder;

  /// Used to retrieve the scope of the tooltip. This scope is responsible for
  /// managing the children `JustTheTooltip`s
  static TooltipAreaState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<InheritedTooltipArea>();

    assert(
      () {
        if (scope == null) {
          throw FlutterError(
            'TooltipArea operation requested with a context that does not include a TooltipArea.\n Make sure you wrapped your JustTheTooltip.entry children inside a TooltipArea',
          );
        }
        return true;
      }(),
    );

    return scope!.data;
  }

  static TooltipAreaState? maybeOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<InheritedTooltipArea>();

    return scope?.data;
  }

  @override
  State<TooltipArea> createState() => TooltipAreaState();
}

/// This parent child works around the fact that the [TooltipEntry] will
/// send updates to here and thus manage the state. We must create listenable
/// wrappers aruond the skrim and entry as otherwise, when we update this parent
/// from the child, that would trigger a rebuild of the child... Which, without
/// fancy logic, would cause this parent to rebuild again. To avoid that, we
/// instead update the listeners and they then only update their state.
class TooltipAreaState extends State<TooltipArea> {
  ValueNotifier<Widget?> entry = ValueNotifier<Widget?>(null);
  ValueNotifier<Widget?> skrim = ValueNotifier<Widget?>(null);

  void setEntries({required Widget entry, required Widget skrim}) {
    if (mounted) {
      setState(() {
        this.entry.value = entry;
        this.skrim.value = skrim;
      });
    }
  }

  void updateEntries({required Widget entry, required Widget skrim}) {
    if (mounted) {
      this.entry.value = entry;
      this.skrim.value = skrim;
    }
  }

  void removeEntries() {
    if (mounted) {
      entry.value = null;
      skrim.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedTooltipArea(
      data: this,
      // This Builder allows direct children to call `TooltipArea.of`
      // without requiring a builder themselves.
      child: Builder(
        builder: (context) {
          return widget.builder(
            context,
            ValueListenableBuilder<Widget?>(
              valueListenable: entry,
              builder: (context, widget, child) => widget ?? child!,
              child: const SizedBox.shrink(),
            ),
            ValueListenableBuilder<Widget?>(
              valueListenable: skrim,
              builder: (context, widget, child) => widget ?? child!,
              child: const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
