# Rate My Prayer 2 (Flutter)

A cross-platform prayer quality tracker and spiritual companion, migrated from native Android (Jetpack Compose) to Flutter.

## Features
- **Daily Prayer Tracking**: Log and rate (1-10) the five daily prayers (Fajr, Dhuhr, Asr, Maghrib, Isha) with optional spiritual notes.
- **Spiritual Practice Logs**: Record additional prayers (Nawafil/Sunnah) with rakat count and khushu rating.
- **Monthly Calendar**: Visualize your consistency with color-coded daily summaries (Green = 5 prayers, Yellow = 3-4, Red = 1-2).
- **In-Depth Statistics**: View average ratings overall and for each specific prayer over time.
- **Real-time Clock**: Integrated clock and automatic day transitions.
- **Material 3 Design**: Modern, clean UI with full support for Light and Dark modes.
- **Local Persistence**: Fast and secure offline storage using Drift (SQLite).

## Tech Stack
- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev)
- **Database**: [Drift](https://drift.simonbinder.eu/) (SQLite)
- **Theming**: Material 3
- **Utilities**: Hijri Calendar, Intl (Internationalization)

## Project Structure
- `lib/core`: Shared constants and date utilities.
- `lib/data`: Database definitions (Drift) and repository implementations.
- `lib/domain`: Pure business entities and repository interfaces.
- `lib/providers`: Riverpod providers for state management and business logic.
- `lib/ui/screens`: Main application pages (Home, Practice, Calendar, Stats, Settings).
- `lib/ui/widgets`: Reusable atomic UI components.
- `lib/theme`: App-wide styling and color schemes.

## Getting Started
1. Install Flutter (>=3.0.0).
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter pub run build_runner build` to generate the database code.
5. Run `flutter run` to launch the app on your preferred device.

## Testing
To run the unit tests:
```bash
flutter test
```
