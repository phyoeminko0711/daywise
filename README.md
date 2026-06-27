# DayWise

DayWise is a modern Flutter mobile app that provides daily guidance based on the Gregorian and Myanmar calendars, including daily do's and don'ts, auspicious day information, and traditional calendar insights.

## Overview

DayWise is designed as a clean, offline-first daily guidance experience with a polished Material 3 interface. Users can select a date and view a combined Gregorian and Myanmar calendar reading, along with practical daily guidance and future-ready premium placeholders.

## Features

- Splash screen with smooth fade animation
- Home dashboard with date selection and recent dates
- Gregorian date picker
- Myanmar calendar conversion and display
- Daily guidance result screen
- Daily do's section
- Daily don'ts section
- Auspicious day information
- Lucky color, number, and direction metadata
- Favorite date support
- Settings screen
- Premium screen placeholder
- Offline-first local sample data architecture

## Tech Stack

- Flutter
- Dart
- Material 3
- `google_fonts`
- `intl`
- `myanmar_calendar`
- `share_plus`

## Folder Structure

```text
lib/
  main.dart
  app/
    app.dart
    routes/
      app_router.dart
    theme/
      app_theme.dart
    constants/
      app_colors.dart
  core/
    models/
      daily_guidance.dart
      myanmar_date_info.dart
    services/
      app_state.dart
      daywise_scope.dart
      guidance_repository.dart
      myanmar_calendar_service.dart
    utils/
      date_formatters.dart
    extensions/
      date_time_extension.dart
    widgets/
      animated_entrance.dart
      app_card.dart
      mm_text.dart
      scale_tap.dart
  features/
    splash/
      splash_screen.dart
    home/
      home_screen.dart
      widgets/
        guide_tab_content.dart
        home_dashboard.dart
        today_tab_content.dart
    calendar/
      calendar_screen.dart
    guidance/
      guidance_screen.dart
    premium/
      premium_screen.dart
    settings/
      settings_screen.dart
```

## Screenshots

Add project screenshots to a local `screenshots/` folder when available.

Suggested files:

- `screenshots/splash.png`
- `screenshots/home.png`
- `screenshots/calendar.png`
- `screenshots/guidance.png`
- `screenshots/settings.png`
- `screenshots/premium.png`

Example markdown:

```md
![Splash](screenshots/splash.png)
![Home](screenshots/home.png)
```

## Getting Started

### Prerequisites

- Flutter stable SDK
- Dart SDK
- Android Studio or VS Code with Flutter support
- Android device or emulator

### Installation

```bash
git clone <your-repository-url>
cd daywise
flutter pub get
```

### Run the app

```bash
flutter run
```

### Useful commands

```bash
flutter analyze
flutter test
```

### Windows note

If you use plugin packages such as `share_plus` on Windows during development, enable Windows Developer Mode so Flutter can create symlinks during dependency resolution.

## Future Roadmap

- Replace sample guidance data with a persistent local database
- Add favorites history and saved guidance views
- Add local notifications and reminder scheduling
- Add richer Myanmar calendar annotations
- Add search and filtering by date and weekday
- Introduce multilingual content handling
- Add premium insights and extended reading flows
- Add optional cloud sync in a later version

## License

This project is licensed under the terms of the [MIT License](LICENSE).
