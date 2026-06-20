<div align="center">
  <br/>
  <img src="https://img.icons8.com/fluency/96/book.png" alt="Book Reader Logo" width="96"/>
  <h1>📚 Book Reader App</h1>
  <p>
    <strong>A Flutter-powered book browsing experience powered by Google Books API</strong>
  </p>
  <p>
    <img src="https://img.shields.io/badge/Flutter-3.1+-02569B?style=flat&logo=flutter" alt="Flutter"/>
    <img src="https://img.shields.io/badge/State%20Management-Riverpod-7B1FA2?style=flat" alt="Riverpod"/>
    <img src="https://img.shields.io/badge/Architecture-MVVM-4CAF50?style=flat" alt="MVVM"/>
    <img src="https://img.shields.io/badge/API-Google%20Books-4285F4?style=flat&logo=google" alt="Google Books API"/>
    <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat" alt="License"/>
  </p>
  <br/>
</div>

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📖 **Browse Books** | Fetch and explore a curated list of programming books from Google Books |
| 🔍 **View Details** | See book title, description, cover image, and metadata |
| 🌐 **Read Online** | Open books directly in your browser via integrated web links |
| 📡 **Connectivity Check** | Smart internet detection with user-friendly offline messaging |
| ⚡ **State Management** | Robust state handling with Riverpod's reactive architecture |
| 🏗️ **MVVM Architecture** | Clean separation of concerns for maintainable code |

---

## 🏗️ Architecture

The app follows the **MVVM** (Model-View-ViewModel) pattern, leveraging **Riverpod** for state management:

```
lib/
├── 📦 domain/           # Business logic & API integration
│   └── my_domain.dart
├── 📦 models/           # Data models (Freezed + JSON)
│   ├── mymodel.dart
│   ├── mymodel.freezed.dart
│   └── mymodel.g.dart
├── 📦 provider/         # State management (Riverpod)
│   ├── my_provider.dart
│   ├── my_event.dart
│   ├── my_state.dart
│   └── ref.dart
├── 📦 utils/            # Utilities & services
│   ├── http_helper.dart
│   └── services.dart
├── 📦 view/             # UI screens (Flutter widgets)
│   └── my_screen.dart
└── 🚀 main.dart        # App entry point
```

### Data Flow

```
User Action → View (ConsumerWidget) → StateNotifier → Domain → API
                                        ↑                         |
                                        └── State ← JSON ←───────┘
```

---

## 📋 Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.1+)
- [Dart SDK](https://dart.dev/get-dart) (3.1+)
- A code editor (VS Code, Android Studio, etc.)

---

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone <repository-url>
cd book-reader-main
```

### 2️⃣ Install dependencies

```bash
flutter pub get
```

### 3️⃣ Run the app

```bash
flutter run
```

### 4️⃣ (Optional) Regenerate code models

If you modify the Freezed models, regenerate the serialization code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | UI framework |
| `flutter_riverpod` | ^1.0.4 | State management |
| `freezed_annotation` | ^2.4.1 | Immutable data classes |
| `json_annotation` | ^4.8.1 | JSON serialization |
| `url_launcher` | ^6.2.0 | Opening external links |
| `cupertino_icons` | ^1.0.2 | iOS-style icons |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `freezed` | ^2.4.2 | Code generator for data classes |
| `json_serializable` | ^6.7.1 | Code generator for JSON |
| `build_runner` | ^2.4.6 | Code generation runner |
| `flutter_lints` | ^2.0.0 | Lint rules |

---

## 🔌 API Reference

The app uses the **Google Books API** to fetch book data:

```
GET https://www.googleapis.com/books/v1/volumes?q=programming
```

Response includes book metadata such as:
- `id`, `kind`, `etag` — Identifiers
- `volumeInfo.title` — Book title
- `volumeInfo.description` — Book description
- `volumeInfo.imageLinks.thumbnail` — Cover image URL
- `volumeInfo.imageLinks.accessInfo.webReaderLink` — Read online link

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 🛠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| `flutter: command not found` | Ensure Flutter is installed and added to your PATH |
| Build failures | Run `flutter clean` then `flutter pub get` |
| Code generation errors | Run `dart run build_runner build --delete-conflicting-outputs` |
| No books loaded | Check your internet connection |

---

## 📄 License

This project is licensed under the MIT License.

---

<div align="center">
  <sub>Built with ❤️ using Flutter & Dart</sub>
</div>


