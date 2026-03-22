# Coding Standards - Rate My Prayer Flutter

This document outlines the coding standards and architectural principles for the Flutter migration of Rate My Prayer.

## 1. General Principles
- **KISS (Keep It Simple, Stupid):** Avoid over-engineering and unnecessary abstractions.
- **YAGNI (You Ain't Gonna Need It):** Only implement features and logic required for the current task.
- **DRY (Don't Repeat Yourself):** Extract reusable UI components and logic.
- **Consistency:** Follow the same patterns throughout the application.

## 2. Flutter & Dart Standards
- **Naming Conventions:**
    - Classes: `UpperCamelCase`
    - Variables & Functions: `lowerCamelCase`
    - Files: `snake_case.dart`
- **Widgets:**
    - Prefer `StatelessWidget` whenever possible.
    - Use `const` constructors for widgets to improve performance.
    - Use `SizedBox` for spacing instead of `Padding` when simple gaps are needed.
- **State Management (Riverpod):**
    - Use `ConsumerWidget` or `ConsumerStatefulWidget` to access providers.
    - Keep business logic inside `StateNotifier` or `Notifier` classes.

## 3. Architecture (Lean Clean)
The project is organized into layers:
- **Data Layer:** 
    - `models/`: Data transfer objects and JSON serialization.
    - `database/`: Drift database definitions and DAOs.
    - `repositories/`: Concrete implementations of repository interfaces.
- **Domain Layer:**
    - `entities/`: Pure business objects.
    - `repositories/`: Abstract repository interfaces.
- **Application Layer:**
    - `providers/`: Riverpod providers and state management logic.
- **UI Layer:**
    - `screens/`: Individual app pages.
    - `widgets/`: Reusable UI components.
    - `theme/`: Styling and color schemes.

## 4. Documentation & Testing
- Every task must be documented in `PROGRESS.md`.
- Unit tests must be written for all business logic and data layer operations.
- Ensure all tests pass before moving to the next task.
