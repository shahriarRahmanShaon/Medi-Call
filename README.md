# Medi-Call

**Medi-Call** is a modern SwiftUI-based iOS application designed to help users **manage their medications**. Built with a **MVVM architecture and Coordinator Pattern** and Firebase Authentication, Medi-Call delivers a sleek, intuitive, and accessible experience.

---

## 🌟 Features

- **Login with Firebase Email Authentication**
- **Persistent Login State** using Firebase's `Auth` state listener
- **Medication Dashboard**: View saved medications in a clean, scrollable list
- **Search and Add Medications** with dynamic drug search API integration
- **Coordinator Pattern** for navigation management
- **MVVM Architecture**: Clean, testable, and modular code
- **Accessibility Identifiers** for UI testing and automation

---

## 🛠️ Tech Implementations

| **Area**              | **Implementations**                                            |
|-----------------------|-------------------------------------------------------------|
| Combine               | Used combine for reactivity on apiClient, service layer and other places |
| Repository Pattern    | Repository and RepositoryImpl for clean functionality       |
| Dependency Injection  | Used @Environment injectable, and class init injection specially on repository and viewModels|
| Coordinator Pattern   | Implemented coordinator pattern for modularized navigation and dynamic navigation|
| Memory Management     | Used Welk self and Unowned self where needed specially during long service calls|
| Testing               | Tested Dashboard viewmodel and Mock repository for testing|
| Accessibility         | Added accessibilty inspector on multiple components so that it can be used during accessibility options|
| Animation             | Animation added specially table list operations|
| Documentation         | DocC documentation for methods understanding and overview|

## 🛠️ Future Tech Updatable areas
- Use more combine features like passthroughsubject and others
- Make more reusable components
- Use modulerization architecture specially make a module for service layer for multi project reusability
- Use third party animations
- Use SSL pinning and keychain for saving info so that user have more control over their data



## 📁 App Flow and architecture
<img width="839" alt="flow" src="https://github.com/user-attachments/assets/e02caf63-c726-473f-9973-b6e6cb63c856" />



## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/7b986015-a9cd-4491-b99b-a95f6b168875" width="300" />
  <img src="https://github.com/user-attachments/assets/1486475b-10c3-4ca5-862c-8381097a5b8f" width="300" />
  <img src="https://github.com/user-attachments/assets/1ec7c74d-3f22-4cdd-ad0a-8c6c52733c00" width="300" />
  <img src="https://github.com/user-attachments/assets/ca0a5595-b2da-4be8-845e-33b000fff25b" width="300" />
  <img src="https://github.com/user-attachments/assets/00b782df-0a3f-4387-af53-c37957bd5105" width="300" />
  <img src="https://github.com/user-attachments/assets/9325b94a-2a0c-4c18-a8b7-e6d6e0978546" width="300" />
  <img src="https://github.com/user-attachments/assets/79a4d43f-b732-42c0-8deb-0f6ea4566e9e" width="300" />
  <img src="https://github.com/user-attachments/assets/c7a08687-0727-4815-b88b-d86b0a59b7d5" width="300" />
  <img src="https://github.com/user-attachments/assets/d3dcf169-b6cd-4b2c-9d8c-b7b25aac3264" width="300" />
  <img src="https://github.com/user-attachments/assets/9425cdf8-230a-46c4-88b8-7c10a6cd88e5" width="600" />
  <img src="https://github.com/user-attachments/assets/c31a57de-f128-4ef7-9da7-5995a7897e20" width="300" />

</p>

---

## 📁 App Demo
[![Watch Demo](https://img.youtube.com/vi/UgRGTNJbrH4/0.jpg)](https://youtube.com/shorts/UgRGTNJbrH4?feature=share)

---

## 📁 Folder Structure
![folder](https://github.com/user-attachments/assets/4b61c014-d1f5-4b5b-b21b-a5a1d2cf647a)


---

## 🔐 Authentication

The app uses **Firebase Email/Password Authentication** with session persistence:

- The `AuthViewModel` observes Firebase auth state.
- If a user is already logged in, the app navigates directly to the `DashboardView`.
- All navigation is handled via a **Coordinator**.

---

## 💊 Medicine Management

- **Saved Medications** are stored locally or via Realm
- Users can **add new medications** via a dedicated `DrugSearchView`.
- They can see their saved drugs on dashboard

---

## 🔔 Local Notifications (Not fully covered due to time limit)
- Local Notification manager setup
- Popup for add reminder

---

## 🛠️ Specification
- Xcode 16
- Swift 5
- iOS 18

## 🛠️ Packages (SPM)
- Realm-Swift
- Firebase (Core & Authentication)



