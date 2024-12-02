# Task Management Application

This is a Flutter-based task management application that helps users organize their tasks by adding, filtering, and completing them. It follows a structured architecture for better maintainability and scalability.

---

## Features

- Add tasks with a title and completion status.
- Filter tasks by **All**, **Completed**, or **Pending**.
- Mark tasks as completed or delete them.
- Pagination support for tasks.
- Integrated with `BLoC` for state management.
- Unit-tested using `bloc_test` and `mockito`.
- Included (Dark Mode and Language change es, en)

---

## Project Structure

The project follows a modular structure to separate concerns and make the codebase more manageable.

```
lib/
├── app/
│   ├── blocs/          # BLoC state management for the app
│   │   ├── task/       # Task-related BLoC, events, and states
│   ├── common_widgets/ # Shared UI components
│   ├── constants/      # Constants for reusable values (e.g., styles, strings)
│   ├── data_source/    # SQLite-based data sources
│   ├── entity_models/  # Entity models (e.g., TaskEntity)
│   ├── enums/          # Enums used throughout the app
│   ├── repository/     # Repositories for data handling logic
│   ├── ui/             # UI screens and widgets
│   │   ├── task/       # Task screen-specific widgets and pages
│   ├── utils/          # Helper classes and extensions
│   └── main.dart       # Entry point of the application
│   └── app-release.apk # Apk
├── test/
│   └── test.mocks.dart # Auto-generated mocks for tests
```

---

## Getting Started

### Prerequisites

- Flutter 3.19.4 or above
- Dart SDK
- Android Studio / Xcode for running on emulators or devices

### Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---

## Testing

The application includes unit tests for key components. To run the tests:

1. Ensure the `test` directory is present with test files ending in `_test.dart`.
2. Run:
   ```bash
   flutter test
   ```

---

## Key Classes

### TaskBloc

Manages the business logic and state for tasks.

- **Events**:

  - `LoadTasksEvent`
  - `AddTaskEvent`
  - `DeleteTaskEvent`
  - `CompleteTaskEvent`
  - `ChangeFilterEvent`

- **States**:
  - `TaskStateEnum.initial`
  - `TaskStateEnum.loading`
  - `TaskStateEnum.loaded`
  - `TaskStateEnum.error`

### TaskEntity

Represents a task in the application with the following fields:

- `id`: Unique identifier
- `title`: Task title
- `date`: Creation or due date
- `isComplete`: Boolean indicating if the task is completed

### TaskRepository

Handles interaction with the data source (SQLite).

---

## Authors

- **Mauricio Munoz**
  - Role: Developer

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
