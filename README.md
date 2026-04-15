# 📅 Evently

### Task & Event Management App built with Flutter & Firebase

---

## 📖 Overview

**Evently** is a professional task and event management application.  
It helps users organize their daily activities, manage tasks efficiently, and create events بسهولة مع real-time data synchronization.

---

## 📸 Screenshots Gallery

---

### 1️⃣ Onboarding Experience
Simple and clean introduction screens to guide new users.

<p align="center">
  <img src="assets/screenshots/intro3.png" width="159" alt="Onboarding 1">
  <img src="assets/screenshots/intro4.png" width="169" alt="Onboarding 2">
</p>

---

### 2️⃣ Authentication Flow
Secure login system with full RTL & LTR support.

<p align="center">
  <img src="assets/screenshots/login.png" width="166" alt="Login">
  <img src="assets/screenshots/register.png" width="161" alt="Register">
  <img src="assets/screenshots/forget.png" width="165" alt="Forgot Password">
</p>

---

### 3️⃣ Task Management & Search
Dynamic dashboard with advanced task filtering.

<p align="center">
  <img src="assets/screenshots/home.png" width="162" alt="Home">
  <img src="assets/screenshots/serch.png" width="162" alt="Search">
  <img src="assets/screenshots/details.png" width="163" alt="Details">
</p>

---

### 4️⃣ Profile & Event Creation
Create new tasks and manage your profile .

<p align="center">
  <img src="assets/screenshots/add.png" width="161" alt="Add Task">
  <img src="assets/screenshots/profile.png" width="159" alt="Profile">
</p>

---

## 🌍 Localization

The app supports multiple languages:

- 🇪🇬 Arabic (RTL support)
- 🇺🇸 English (LTR support)
- 🔄 Dynamic language switching using `easy_localization`

---

## 🚀 Features

- ✅ Create and manage tasks بسهولة
- 🔍 Advanced task search
- 🔄 Real-time data updates
- 🔐 Secure authentication system
- 🌐 Multilingual support (Arabic / English)
- 📱 Fully responsive UI
- 🎯 Smooth and user-friendly experience

---

## 🛠️ Technologies Used

- **Flutter**
- **Provider (State Management)**
- **Firebase Authentication**
- **Cloud Firestore**
- **easy_localization**
- **flutter_screenUtil**

---

## 📂 Project Structure

```text
lib/
├── core/                    # App constants, themes, and shared resources
├── models/                  # Data models (Event, User, etc.)
├── Provider/                # State management (Provider)
├── screens/                 # Application screens
│   ├── add_event/           # Add new event screen
│   ├── authentication_screens/  # Login, Register, Forgot Password
│   ├── detils_event/        # Event details screen
│   ├── home_screen/         # Main dashboard
│   ├── localizing_screen/   # Language selection
│   ├── onbording_screen/    # Onboarding screens
├── firebase_options.dart    # Firebase configuration
└── main.dart               # App entry point