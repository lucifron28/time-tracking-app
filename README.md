# Time Tracking App

A Flutter-based time tracking application that helps users manage and track their time effectively.

## Features

- Time tracking and management
- Local data persistence using Hive
- State management with Provider
- Material Design UI

## Dependencies

### Main Dependencies
- Flutter SDK (^3.7.2)
- Provider (^6.1.5) - For state management
- Hive (^2.2.3) - For local data storage
- Hive Flutter (^1.1.0) - Flutter integration for Hive
- Intl (^0.20.2) - For date and time formatting
- UUID (^4.5.1) - For generating unique identifiers
- Path Provider (^2.1.5) - For file system access
- Local Storage (^6.0.0) - For persistent storage
- Collection (^1.19.1) - Enhanced collection utilities
- Cupertino Icons (^1.0.8) - iOS-style icons

### Development Dependencies
- Flutter Test - For testing
- Flutter Lints (^5.0.0) - For code quality and style enforcement
- Build Runner (^2.4.15) - For code generation
- Hive Generator (^2.0.1) - For generating Hive adapters

## Project Structure

```
lib/
├── models/
│   ├── project.dart
│   ├── project.g.dart
│   ├── task.dart
│   ├── task.g.dart
│   ├── time_entry.dart
│   └── time_entry.g.dart
├── providers/
│   ├── project_management_provider.dart
│   ├── task_management_provider.dart
│   └── time_entry_provider.dart
├── screens/
│   ├── tab_bar_views/
│   │   ├── all_entries.dart
│   │   └── group_by_projects.dart
│   ├── create_time_entry.dart
│   ├── home_screen.dart
│   ├── project_management.dart
│   └── task_management.dart
├── services/
│   ├── project_services.dart
│   ├── task_services.dart
│   └── time_entry_services.dart
├── utils/
│   ├── date_formatter.dart
│   └── id_generator.dart
├── widgets/
│   ├── add_project_form.dart
│   └── add_task_form.dart
├── app.dart
└── main.dart
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
