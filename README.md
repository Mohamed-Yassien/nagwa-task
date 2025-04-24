# 📚 Flutter Book App

A Flutter application that displays a list of books using
   * Clean Architecture principles.
   *   flutter_bloc for using Cubit for state management.
   *   Dio for networking.
   *   Hive for local caching.
   *   rename  package for change application name and bundleId.
   *   connectivity_plus for check internet connection state.
   *   path_provider for access mobile locale storage.
   *   get_it for dependency injection .
   *   cached_network_image for cache images .
   *   equatable for compare objects by their values instead of their references.
   *   dartz for allowing you return two types in each function .
   *   flutter_staggered_grid_view for using grid view with dynamic height based on content .

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

