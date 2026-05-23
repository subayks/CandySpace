# CandySpace
Streaming Platform
A SwiftUI streaming-style homepage application built for the Candyspace iOS Developer Technical Assessment.

---

# Features

- SwiftUI
- MVVM Architecture
- Async/Await Networking
- Codable JSON Parsing
- Horizontal Content Rails
- Dynamic Aspect Ratio Support
- Async Image Loading + Caching
- Pull To Refresh
- Loading & Error States
- Unit Testing Support
- Fully Programmatic UI

---

# Architecture

The project follows MVVM with clear separation of concerns.

## Structure

```text
CandySpace/
│
├── App/
├── Core/
│   ├── Networking/
│   ├── ImageCache/
│   ├── Constants/
│   └── Extensions/
│
├── Features/
│   └── Home/
│       ├── Models/
│       ├── ViewModels/
│       └── Views/
│
├── CandySpaceTests/
└── README.md
```

---

# Technical Decisions

## Why MVVM?

MVVM keeps:
- UI logic separated from networking
- state management predictable
- components reusable and testable

## Why Lazy Stacks?

`LazyVStack` and `LazyHStack` are used for better performance and memory efficiency when rendering large scrollable content.

## Image Loading

Images are loaded asynchronously using Swift Concurrency and cached using `NSCache` to avoid unnecessary network requests and improve scrolling performance.

## Error Handling

The app safely handles:
- missing fields
- empty images
- decoding failures
- network errors

without crashing.

---

# API

Endpoint:

```text
https://api.jsonbin.io/v3/b/69df608e36566621a8b675e1
```

No authentication required.

---

# Requirements

- Xcode 16+
- iOS 18+
- Swift 5.10+

---

# Build & Run

1. Clone repository

```bash
git clone https://github.com/subayks/CandySpace.git
```

2. Open:

```text
CandySpace.xcodeproj
```

3. Run using iPhone simulator or physical device.

---

# Testing

Basic unit tests are included for:
- ViewModel state updates
- API integration validation

Run tests using:

```text
CMD + U
```

---

# Assumptions

- API response fields may be optional or missing
- Unknown content types are rendered generically
- Some image URLs may be empty

---
# Author

Subendran Kumaravel
iOS Developer
