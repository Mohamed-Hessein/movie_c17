# 🎬 Movie C17 App

A premium Movie Exploration application built with **Flutter**. This project demonstrates an advanced implementation of **Clean Architecture**, **State Management (Bloc)**, and **Cloud/Local Persistence**.

---

## 📸 Screenshots

Here is a visual overview of the application modules.

### 🔐 Auth & Onboarding
| Login Screen | Register Screen |
| :---: | :---: |
| <img src="screenshots/login.png" width="250" alt="Login"> | <img src="screenshots/register.png" width="250" alt="Register"> |

### 🏠 Discovery & Navigation
| Home Screen | Browser | Search |
| :---: | :---: | :---: |
| <img src="screenshots/home.png" width="200" alt="Home"> | <img src="screenshots/browser.png" width="200" alt="Browser"> | <img src="screenshots/search.png" width="200" alt="Search"> |

### 👤 Profile & Details
| Movie Details | Profile | Edit Profile |
| :---: | :---: | :---: |
| <img src="screenshots/details.png" width="200" alt="Details"> | <img src="screenshots/profile.png" width="200" alt="Profile"> | <img src="screenshots/edit_profile.png" width="200" alt="Edit Profile"> |

---

## ✨ Key Features (Based on project structure)

* **Multi-Module Discovery:** Navigate through **Home**, **Browser**, and **Search** for a comprehensive movie experience.
* **Complete User Profile:** Features dedicated **Profile** management with an **Edit Profile** flow.
* **Authentication Flow:** Secure user access managed via the **Auth** module.
* **In-depth Content:** Detailed movie information screens within the **Details** module.
* **Clean Architecture:** Strictly organized into feature-based folders for maximum scalability.

---

## 🛠 Tech Stack (Project Dependencies)

* **State Management:** `flutter_bloc` & `bloc` (v9.1+)
* **Navigation:** `auto_route` (v11.1+)
* **Networking:** `dio` & `pretty_dio_logger`
* **Local Storage:** `hive` & `shared_preferences`
* **Dependency Injection:** `get_it` & `injectable`
* **Backend:** `firebase_core`, `firebase_auth`, `cloud_firestore`
* **UI Enhancements:** `carousel_slider`, `flutter_screenutil`, `cached_network_image`

---

## 🚀 Installation & Setup

1. **Clone:** `git clone https://github.com/Mohamed-Hessein/movie_c17.git`
2. **Packages:** `flutter pub get`
3. **Generate Assets/Routes:** ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
