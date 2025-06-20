# Nucleus UI

[![Pub Version](https://img.shields.io/pub/v/nucleus_ui.svg)](https://pub.dev/packages/nucleus_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive Flutter UI component library inspired by modern design systems. Nucleus UI provides beautiful, customizable, and accessible components for building exceptional Flutter applications.

## 📖 Documentation

Visit our [documentation site](https://nucleus-plus.web.app/) to:

- View live component examples
- Access detailed API documentation
- Learn about theming and customization
- Explore advanced usage patterns

## 📦 Installation

Add `nucleus_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  nucleus_ui: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 🎯 Quick Start

Import the package and start using components:

```dart
import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Nucleus UI Example')),
        body: Column(
          children: [
            // Button component
            NucleusButton(
              onPressed: () => print('Button pressed!'),
              child: Text('Click me'),
            ),
            
            // Avatar component
            NucleusAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
            ),
            
            // Badge component
            NucleusBadge(
              label: 'New',
              child: Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 📚 Components

### ✅ Available Components

- **[Accordion](https://nucleus-ui.web.app/components/accordion/)** - Collapsible content sections
- **[AspectRatio](https://nucleus-ui.web.app/components/aspect-ratio/)** - Maintain aspect ratios for responsive layouts
- **[Avatar](https://nucleus-ui.web.app/components/avatar/)** - User profile images and placeholders
- **[Badge](https://nucleus-ui.web.app/components/badge/)** - Status indicators and notifications
- **[Breadcrumb](https://nucleus-ui.web.app/components/breadcrumb/)** - Navigation path indicators
- **[Button](https://nucleus-ui.web.app/components/button/)** - Primary and secondary action buttons
- **[ButtonGroup](https://nucleus-ui.web.app/components/button-group/)** - Grouped button collections
- **[Checkbox](https://nucleus-ui.web.app/components/checkbox/)** - Boolean input controls
- **[Chip](https://nucleus-ui.web.app/components/chip/)** - Compact elements for tags and filters
- **[DatePicker](https://nucleus-ui.web.app/components/date-picker/)** - Date selection interfaces
- **[Dialog](https://nucleus-ui.web.app/components/dialog/)** - Modal dialogs and overlays
- **[InputField](https://nucleus-ui.web.app/components/input-field/)** - Text input components
- **[InputPin](https://nucleus-ui.web.app/components/input-pin/)** - PIN code input fields
- **[MobileNumber](https://nucleus-ui.web.app/components/mobile-number/)** - Phone number input with country codes
- **[NavBar](https://nucleus-ui.web.app/components/nav-bar/)** - Navigation bars and bottom bars
- **[PageControl](https://nucleus-ui.web.app/components/page-control/)** - Page indicators for carousels
- **[Progress](https://nucleus-ui.web.app/components/progress/)** - Progress bars and indicators
- **[Radio](https://nucleus-ui.web.app/components/radio/)** - Single-choice selection controls
- **[SearchField](https://nucleus-ui.web.app/components/search-field/)** - Search input components
- **[SegmentedControl](https://nucleus-ui.web.app/components/segmented-control/)** - Multi-option selection controls
- **[SelectInput](https://nucleus-ui.web.app/components/select-input/)** - Dropdown selection inputs
- **[Separator](https://nucleus-ui.web.app/components/separator/)** - Visual content dividers
- **[Skeleton](https://nucleus-ui.web.app/components/skeleton/)** - Content loading placeholders
- **[Slider](https://nucleus-ui.web.app/components/slider/)** - Range and value selection sliders
- **[Steppers](https://nucleus-ui.web.app/components/steppers/)** - Multi-step process indicators
- **[Tabs](https://nucleus-ui.web.app/components/tabs/)** - Tabbed content navigation
- **[Toast](https://nucleus-ui.web.app/components/toast/)** - Temporary notification messages
- **[Toggle](https://nucleus-ui.web.app/components/toggle/)** - Switch and toggle controls
- **[Tooltip](https://nucleus-ui.web.app/components/tooltip/)** - Contextual help overlays
- **[TopBar](https://nucleus-ui.web.app/components/top-bar/)** - Application top bars and headers

## 🎨 Customization

Nucleus UI components are highly customizable. You can override colors, typography, and spacing:

```dart
// Custom button styling
NucleusButton(
  style: NucleusButtonStyle(
    backgroundColor: Colors.purple,
    textColor: Colors.white,
    borderRadius: 12.0,
  ),
  onPressed: () {},
  child: Text('Custom Button'),
)

// Theme-based customization
ThemeData(
  extensions: [
    NucleusTheme(
      primaryColor: Colors.blue,
      cornerRadius: NucleusCornerRadius.medium,
      typography: NucleusTypography.custom(
        fontFamily: 'Figtree',
      ),
    ),
  ],
)
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](https://github.com/nucleusui/nucleus-plus/blob/main/CONTRIBUTING.md) for details on:

- Setting up the development environment
- Submitting bug reports and feature requests
- Code style guidelines
- Pull request process

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Documentation](https://nucleus-ui.web.app/)
- [GitHub Repository](https://github.com/nucleusui/nucleus-flutter)
- [Issue Tracker](https://github.com/nucleusui/nucleus-flutter/issues)
- [Pub.dev Package](https://pub.dev/packages/nucleus_ui)

## ⭐ Support

If you find this package helpful, please give it a star on [GitHub](https://github.com/nucleusui/nucleus-flutter) and like it on [pub.dev](https://pub.dev/packages/nucleus_ui)!
