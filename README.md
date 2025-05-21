# Time Tracking App

A Flutter-based time tracking application that helps users manage and track their time effectively.

## Features

- Time tracking and management
- Local data persistence using Hive
- State management with Provider
- Material Design UI

## Dependencies

- Flutter SDK (^3.7.2)
- Provider (^6.1.5) - For state management
- Hive (^2.2.3) - For local data storage
- Intl (^0.20.2) - For date and time formatting
- UUID (^4.5.1) - For generating unique identifiers
- Path Provider (^2.1.5) - For file system access
- Local Storage (^6.0.0) - For persistent storage

## Project Structure

```
lib/
├── models/      # Data models
├── providers/   # State management
├── screens/     # UI screens
├── services/    # Business logic
├── utils/       # Utility functions
├── widgets/     # Reusable UI components
├── app.dart     # App configuration
└── main.dart    # Entry point
```

## Getting Started

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Development

This project uses:
- Flutter Lints for code quality
- Provider for state management
- Hive for local data persistence

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
