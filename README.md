# 🎬 Movie C17 App

A premium Movie Exploration & Booking application built with **Flutter**. This project demonstrates a high-level implementation of **Clean Architecture**, **State Management (Bloc)**, and a fully immersive **6-step Onboarding flow**.

---

## 📸 Screenshots

### 🌟 Immersive Onboarding Flow (6 Steps)
The app features a guided experience to help users discover, create, and rate content.

| Step 1: Favorites & Step 2: Discover | Step 3: Explore & Step 4: Create | Step 5: Rate & Step 6: Finish |
| :---: | :---: | :---: |
| <img src="screenshots/onboarding_1.png" width="180"> <img src="screenshots/onboarding_2.png" width="180"> | <img src="screenshots/onboarding_3.png" width="180"> <img src="screenshots/onboarding_4.png" width="180"> | <img src="screenshots/onboarding_5.png" width="180"> <img src="screenshots/onboarding_6.png" width="180"> |

### 🔐 Authentication & Profile
| Login Screen | Register Screen | Profile & Edit |
| :---: | :---: | :---: |
| <img src="screenshots/login.png" width="200"> | <img src="screenshots/register.png" width="200"> | <img src="screenshots/profile.png" width="200"> |

### 🍿 Main App Features
| Home Screen | Browser | Search |
| :---: | :---: | :---: |
| <img src="screenshots/home.png" width="200"> | <img src="screenshots/browser.png" width="200"> | <img src="screenshots/search.png" width="200"> |

> **Note:** Ensure all images are placed in the `/screenshots` folder at the root of the project.

---

## ✨ Key Features

### 🚀 Advanced Onboarding
* **Sequential Flow:** 6 distinct pages (`Favorite`, `Discover`, `Explore`, `Create`, `Rate`, `Finish`) using `PageView` and `PageController`.
* **Smart UI Logic:** Context-aware navigation buttons (Back button appears only after step 2).

### 🏗 Architecture & Performance
* **Clean Architecture:** Organized by features (`auth`, `home`, `browser`, `profile`, `details`) for scalability.
* **State Management:** Powered by **Flutter Bloc (9.1+)** for predictable state transitions.
* **Type-Safe Routing:** Advanced navigation using **Auto Route (11.1+)**.

### 🌐 Data & Persistence
* **Firebase Integration:** Secure Auth and Cloud Firestore for user data.
* **Offline Support:** High-performance local caching using **Hive** and **Shared Preferences**.
* **Networking:** Robust API handling with **Dio** and debugging via **Pretty Dio Logger**.

---

## 🛠 Tech Stack

* **UI Framework:** Flutter (SDK >= 3.9.0)
* **Design:** `flutter_screenutil`, `google_fonts`, `carousel_slider`, `cached_network_image`.
* **State:** `flutter_bloc`, `bloc`.
* **Dependency Injection:** `get_it`, `injectable`.
* **Tools:** `auto_route`, `easy_localization`, `connectivity_plus`.

---

## 🚀 Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Mohamed-Hessein/movie_c17.git](https://github.com/Mohamed-Hessein/movie_c17.git)
