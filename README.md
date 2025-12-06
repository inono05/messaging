# Messaging App

A modern Flutter messaging application with real-time chat capabilities,
push notifications, and local data persistence.

## Features

- **Push Notifications**: Firebase Cloud Messaging integration for instant notifications
- **Local Storage**: Hive database for offline message persistence
- **Image Sharing**: Pick and share images from gallery or camera
- **User-friendly UI**: Modern, responsive design with smooth animations
- **State Management**: Riverpod for efficient state management
- **Navigation**: Go Router for seamless navigation
- **Simulated Agent**: Agent that simulated an auto-reply to user's messages

## Prerequisites

- Flutter SDK: ^3.10.1
- Dart SDK: ^3.10.1
- Android Studio or Xcode (for iOS development)
- Firebase project configured

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/inono05/messaging.git
   cd messaging
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build
   ```

4. **Configure Firebase**
    - Follow [Firebase setup guide](https://firebase.google.com/docs/flutter/setup)
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)

5. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── src/
│   ├── app/                    # App configuration and startup
│   ├── config/                 # App configuration (routes, themes, etc.)
│   ├── core/                   # Core utilities and constants
│   ├── features/
│   │   ├── chat/              # Chat feature (controllers, providers, UI)
│   │   ├── dashboard/         # Dashboard feature
│   │   └── splash/            # Splash screen
│   └── shared/                # Shared utilities, widgets, and helpers
└── main.dart                  # App entry point
```

## Key Dependencies

- **flutter_riverpod**: State management
- **go_router**: Navigation and routing
- **hive**: Local data persistence
- **firebase_core & firebase_messaging**: Push notifications
- **flutter_local_notifications**: Local notifications
- **image_picker**: Image selection
- **chopper**: HTTP client for API calls
- **intl**: Internationalization support
- **flutter_animate**: Animation utilities

## Development

### Build Runner

Generate code for Riverpod and other code generators:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Code Generation

Watch for changes and auto-generate:

```bash
flutter pub run build_runner watch
```

## Architecture

The app follows **Clean Architecture** principles with:

- **Presentation Layer**: UI components and controllers
- **Domain Layer**: Business logic and entities
- **Data Layer**: Repositories and data sources
- **Shared Layer**: Common utilities and widgets





