---
title: Getting started
description: Nucleus UI - A modern, customizable UI component library for Flutter applications
prev: false
---

Welcome to Nucleus UI for Flutter! This library provides a comprehensive set of customizable UI components designed to help you build beautiful Flutter applications faster.

## Prerequisites

- Flutter SDK (1.17.0 or higher)
- Dart SDK (3.0.0 or higher)
- Basic understanding of Flutter development

## Installation

You can add Nucleus UI to your project using either of these methods:

**Using Flutter CLI**:

```bash
flutter pub add nucleus_ui
```

**Manual installation in `pubspec.yaml`**:

```yaml
dependencies:
  nucleus_ui: ^0.0.1 # use latest version
```

Then run:

```bash
flutter pub get
```

## Import

Add this import to your Dart code:

```dart
import 'package:nucleus_ui/nucleus_ui.dart';
```

## Basic Usage

Here's a simple example using a Nucleus UI button:

```dart
import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Button(
            onPressed: () {},
            child: const Text('My First Nucleus Button'),
          ),
        ),
      ),
    );
  }
}
```

## Next Steps

Check out our [Components](/components) section to explore all available UI components and their usage.
