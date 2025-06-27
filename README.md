# Ideas and Concepts Profile App

This is a Flutter project designed to manage user profiles, including features like editing profile information and viewing past orders. The application leverages Firebase for backend services.

## Features

- User Profile Management
- Edit Profile Information
- View My Orders
- Firebase Integration

## Technologies Used

- Flutter
- Dart
- Firebase

## Setup and Installation

To get this project up and running on your local machine, follow these steps:

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/ideas_and_concepts_profile.git
    cd ideas_and_concepts_profile
    ```

2.  **Install Flutter dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Firebase Setup:**

    - Create a new Firebase project in the Firebase Console.
    - Add Android, iOS, and Web applications to your Firebase project.
    - Download the `google-services.json` file for Android and place it in `android/app/`.
    - Download the `GoogleService-Info.plist` file for iOS and place it in `ios/Runner/`. (Note: This file is not present in the current directory structure, so the user will need to add it manually).
    - Ensure your Firebase project has Firestore enabled.
    - Run the FlutterFire CLI to generate `lib/firebase_options.dart`:
      ```bash
      flutterfire configure
      ```

4.  **Run the application:**
    ```bash
    flutter run
    ```
5. **Screenshots:**
![Screenshot_1751053353](https://github.com/user-attachments/assets/dd8191bd-6331-4bc6-ae73-caad2bceb861)
![Screenshot_1751053347](https://github.com/user-attachments/assets/663db370-54bc-490b-ac26-bd2353a6fc42)
![Screenshot_1751053342](https://github.com/user-attachments/assets/1e7d16de-b321-4b01-a49c-57e6ece3efb1)
![Screenshot_1751053549](https://github.com/user-attachments/assets/301bff90-b807-4b9d-8ef4-3e5199c61865)
