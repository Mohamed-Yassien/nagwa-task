# 📚 Flutter Book App

A Flutter application that displays a list of books using
   * Clean Architecture principles.
   *   It utilizes Cubit for state management.
   *   Dio for networking.
   *   Hive for local caching.
   *   rename  package for change application name and bundleId.

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK 3.27.2
- Dart SDK  3.6.1
- Android Studio / Xcode / VSCode
- Device or emulator to run the app


## 🔧 How to Build and Run

1. **Clone the Repository**:
   git clone https://github.com/Mohamed-Yassien/nagwa-task
2.   cd nagwa_task
3.   flutter pub get
4.   flutter packages pub run build_runner build --delete-conflicting-outputs
5.   flutter run



## You will find the project structure like this 
lib/
├── core/
│   ├── base_usecase/
│   ├── error/
│   ├── network/
│   ├── services/
│   ├── widgets/
│   └── app_constants.dart
├── books/
│   ├── data/
│   │   ├── datasource/
│   │   ├── models/
│   │   └── repository/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repository/
│   │   └── use_cases/
│   └── presentation/
│       ├── controllers/
│       │   ├── books_cubit.dart
│       │   └── books_states.dart
│       ├── screens/
│       │   └── books_screen.dart
│       └── components/
├── main.dart

