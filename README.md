# MoneyExpense - Personal Expense Tracker

A beautiful and intuitive Flutter app for tracking personal expenses with category-based organization and local data storage.

## 📱 Features

- **Expense Tracking**: Add, view, and manage your daily expenses
- **Category Management**: 9 predefined categories with custom icons and colors
- **Local Storage**: Data stored locally using Hive database
- **Beautiful UI**: Modern design with shadows, animations, and responsive layout
- **Statistics**: View daily and monthly expense summaries
- **Category Analytics**: See spending breakdown by category

## 🎨 Design

The app follows a clean, modern design with:
- White background with subtle shadows
- Teal and blue color scheme
- Category-based icons and colors
- Responsive card-based layout
- Intuitive navigation

## 🛠️ Tech Stack

- **Framework**: Flutter 3.32.8
- **State Management**: GetX
- **Local Database**: Hive
- **Icons**: Custom SVG assets
- **Architecture**: Feature-driven modular structure

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_svg: ^2.0.10+1
  uuid: ^4.4.2
  intl: ^0.19.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.32.8 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/moneyexpense.git
   cd moneyexpense
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── app/
│   ├── bindings/          # Global dependency injection
│   ├── controllers/       # Global controllers
│   └── data/             # Data layer (models, repositories, providers)
├── modules/
│   ├── home/             # Home module
│   └── expense/          # Expense module
├── routes/               # App routing
└── utils/
    ├── constants/        # App constants (colors, spacing, etc.)
    ├── helpers/          # Utility functions
    └── widgets/          # Reusable widgets
```

## 🎯 Key Features

### Categories
- **Makanan** (Food) - Yellow
- **Internet** - Blue
- **Edukasi** (Education) - Orange
- **Hadiah** (Gift) - Red
- **Transportasi** (Transport) - Purple
- **Belanja** (Shopping) - Green
- **Alat Rumah** (Home) - Purple
- **Olahraga** (Sports) - Blue
- **Hiburan** (Entertainment) - Blue

### Architecture
- **Feature-driven structure** for better organization
- **Repository pattern** for data access
- **GetX state management** for reactive programming
- **Modular design** for maintainability

## 📱 Screenshots

[Add screenshots here]

## 🔧 Development

### Code Style
- Follows Flutter/Dart best practices
- Uses `flutter_lints` for code quality
- Consistent naming conventions
- Comprehensive documentation

### Performance
- Optimized for minimal APK size
- Efficient widget rendering
- Local data storage for offline use
- Tree-shaking enabled

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

If you have any questions or need help, please open an issue on GitHub.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX for state management
- Hive for local storage
- All contributors and testers

---

**Made with ❤️ using Flutter**