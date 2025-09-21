# Community App

A Flutter-based social media application featuring onboarding and community feed functionality.

## Overview

Community App is a 2-page social media application that allows users to connect with their local communities. The app features a clean, modern interface with onboarding screens and a comprehensive community feed with posting capabilities.

## Features

- **Onboarding Screen**: Multi-language support with authentication options (Apple, Google, Email)
- **Community Feed**: 
  - Community header with member information
  - Tab navigation (Feed, Media, Events)
  - Post creation interface
  - Interactive posts with like, comment, and share functionality
  - User profile integration


## Screenshots
<img width="956" height="737" alt="Screenshot 2025-09-21 at 02 11 29" src="https://github.com/user-attachments/assets/30afd308-f31d-4afe-b934-bd708760c219" />
<img width="806" height="737" alt="Screenshot 2025-09-21 at 02 09 40" src="https://github.com/user-attachments/assets/368d37a6-032c-4d3f-97f5-c33e8e12d6c7" />mg width="956" height="737" alt="Screenshot 2025-09-21 at 02 11 42" src="https://github.com/user-attachments/assets/f0a6bc4b-3b3d-4947-8357-f34c476e2636" />


The app includes:
- Language selection dropdown
- Social authentication buttons
- Community profile with verified badges
- Member avatars with overlap design
- Post creation and interaction features

## Prerequisites

- Flutter SDK 3.35 or higher
- Dart SDK (compatible with Flutter 3.35)
- iOS Simulator / Android Emulator or physical device
- Git

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone [your-repository-url]
   cd community_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── screens/
│   ├── connect_page.dart          # Onboarding screen
│   └── community_feed_screen.dart # Main feed screen
├── widgets/
│   ├── button.dart               # Custom button component
│   ├── drop_down.dart            # Language dropdown
│   ├── show_modal.dart           # Modal dialogs
│   └── language_option.dart      # Language selection options
├── util/
│   └── exports.dart              # Common imports and exports
└── main.dart                     # App entry point
```

## Assets

The app uses various image and icon assets:
- Background images for onboarding and community header
- Member profile pictures
- Social media icons (Apple, Google, SVG icons)
- Nigerian flag for community location
- Post images and interaction icons

Ensure all assets are properly added to your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/
    - assets/images/
    - assets/icons/
```

## Dependencies

Key packages used:
- `flutter_screenutil`: Responsive screen scaling
- `google_fonts`: Custom typography
- `flutter_svg`: SVG icon support
- `page_transition`: Smooth page transitions

## Development Notes

- Uses `TabController` for feed navigation
- Implements custom overlapping image widgets
- Features responsive design with `MediaQuery`
- Includes dark overlay gradients for better text readability
- Uses asset management through `CommunityAppAssets` class

## Known Issues

- Asset loading requires proper file structure in `assets/` directory
- TabController initialization requires proper lifecycle management
- Image assets must exist in specified paths

## Time Spent

**Total Development Time: 5 hours**

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is developed for educational/portfolio purposes.

---

**Flutter Version**: 3.35  
**Target Platforms**: iOS, Android
# community_app
