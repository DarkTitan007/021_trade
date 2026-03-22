# 021 Trade — Premium Stock Watchlist

021 Trade is a high-performance, aesthetically pleasing stock watchlist application built with Flutter. It follows the BLoC (Business Logic Component) architecture to ensure a clean separation of concerns and a reactive user interface.

## 🚀 Features

- **Dynamic Watchlist**: View a curated list of top-performing stocks with real-time price updates (simulated).
- **Interactive UI**: Smooth animations and a premium dark-themed design for an enhanced user experience.
- **Reorderable List**: Easily organize your watchlist by dragging and dropping stocks to your preferred order.
- **Detailed Insights**: Get comprehensive data for each stock, including:
    - Current Price & Price Change
    - Percentage Change
    - Daily High & Low
    - Trading Volume
- **Clean Architecture**: Built using the BLoC pattern for scalable and maintainable code.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Data Modeling**: [equatable](https://pub.dev/packages/equatable)
- **Typography**: [google_fonts](https://pub.dev/packages/google_fonts)

## 📂 Project Structure

```
lib/
├── core/
│   └── theme/          # Custom theme and color definitions
├── features/
│   └── watchlist/
│       ├── bloc/       # Watchlist state management
│       ├── data/       # Data repository and providers
│       ├── models/     # Stock data models
│       └── presentation/ # UI components and pages
└── main.dart           # Application entry point
```

## 🏁 Getting Started

### Prerequisites
- Flutter SDK installed on your machine.
- An Android/iOS emulator or a physical device.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/DarkTitan007/021_trade.git
   ```
2. Navigate to the project directory:
   ```bash
   cd 021_trade
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```
