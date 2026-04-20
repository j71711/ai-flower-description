##🤖 AI Image Caption App

AI Image Caption is a Flutter application that generates smart captions for images using AI.

The app provides a clean, modern UI with a soft design, allowing users to select images and instantly receive AI-generated descriptions.


##✨ Features
🖼️ Image Selection
Browse multiple images
Switch between images easily
Selected image is highlighted
🤖 AI Caption Generation
Tap on any image to generate a caption
Uses AI API for smart descriptions
Displays results instantly
 State Management
Built using Cubit (Bloc)
Smooth UI updates when changing images
Handles loading, success, and error states
 Error Handling
Friendly error messages
Handles API limits (429 errors)
Prevents multiple requests during loading
## 🎨 UI Design
Soft pink modern design
Rounded card layout
Clean and minimal interface
Inspired by product-style UI
## 🧱 Project Structure
lib
┣ core
┃ ┣ errors
┃ ┣ network
┃ ┗ utils
┣ features
┃ ┗ home
┃   ┣ data
┃   ┃ ┣ datasources
┃   ┃ ┣ models
┃   ┃ ┗ repositories
┃   ┣ domain
┃   ┃ ┣ entities
┃   ┃ ┣ repositories
┃   ┃ ┗ use_cases
┃   ┗ presentation
┃     ┣ cubit
┃     ┗ screens
┣ main.dart

## 🛠️ Technologies Used
Flutter
Dart
Flutter Bloc (Cubit)
Dio (Networking)
Freezed (Model generation)
Injectable + GetIt (Dependency Injection)
Multiple Result (Error Handling)
⚙️ Architecture
UI → Cubit → UseCase → Repository → DataSource → API

## 🚀 How It Works
User selects an image
Cubit updates selected image
User taps image
API request is sent
AI returns caption
Caption is displayed in UI

##🎥 Demo



https://github.com/user-attachments/assets/3e767ad5-1bcd-44fb-944c-ee9c69e6ed50


👩🏻‍💻 Developed By

Jalnar Alharthi
