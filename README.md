# X Clone App - Flutter

A Flutter-based mobile application that replicates the functionality and user experience of X (formerly known as Twitter). This app demonstrates a clean, responsive, and scalable approach to building social media platforms using Flutter.

> The app connects to a specialized backend API that manages interactions such as user management, post creation and likes. You can find the backend [API repository here.](https://github.com/MASalmanss/XCloneSpringBoot)

## Features

- **User Authentication:** Sign up and log in functionality with token-based authentication.
- **Home Feed:** Displays a list of posts with real-time updates.
- **Post Creation:** Create new posts with text content.
- **Likes :** Engage with posts by liking.
- **Profile Management:** Update user profile and view personal posts.
- **Responsive UI:** Adaptive layouts for different screen sizes.
- **State Management:** Utilizes Riverpod for efficient state management.
- **API Integration:** Communicates with a backend API using Dio for seamless data fetching and updates.

> This project is ideal for developers looking to explore modern Flutter development techniques, including state management with Riverpod, API handling with Dio, and creating responsive UIs.

## Dependencies
- [**Flutter Riverpod:**](https://riverpod.dev/) For state management.
- [**Dio:**](https://pub.dev/packages/dio) For handling HTTP requests.
- [**Flutter Secure Storage:**](https://pub.dev/packages/flutter_secure_storage) For secure token storage.
- [**Shared Preferences:**](https://pub.dev/packages/shared_preferences) For storing simple data
- [**Timeago:**](https://pub.dev/packages/timeago) For make time readable
- [**Image Picker:**](https://pub.dev/packages/image_picker) For select images from the image library and take new pictures with the camera

## Screenshots

Welcome Page (Light)       |  Welcome Page (Dark)      | Login Page (Light)        | Login Page (Dark) 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/95596660-a742-441b-921b-773a37e404d8)|![](https://github.com/user-attachments/assets/0518aad9-10c1-4d45-b159-ed06ff1475d8)|![](https://github.com/user-attachments/assets/03ffee0b-10cb-43ee-9c03-49002fc2f562)|![](https://github.com/user-attachments/assets/f3fcf9fd-d73e-4cfe-962b-1b76b0805573)

Signup Page (Light)        |  Signup Page (Dark)       | Home Page (Light)         | Home Page (Dark) 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/2290c6cb-0e20-4271-89b7-abb972eadac4)|![](https://github.com/user-attachments/assets/cc0349a8-c816-446e-851f-80c2f80f4533)|![](https://github.com/user-attachments/assets/5d79254a-40a2-4bda-8706-550846268a22)|![](https://github.com/user-attachments/assets/005afb90-0fa8-4ad4-a09a-f5e3a84415a8)

Home Page Drawer (Light)   |  Home Page Drawer (Dark)  | Post Creation Page (Light)| Post Creation Page (Dark)  
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/6f4da0fa-0277-4087-b2dc-d9ce263116de)|![](https://github.com/user-attachments/assets/607c85ba-d42a-4b60-8f2a-c85b3abd4b6f)|![](https://github.com/user-attachments/assets/bac6fcca-b38c-407d-8fd2-e4de27e4ca31)|![](https://github.com/user-attachments/assets/05cf6613-e2dd-4e89-bcaf-6448a2ba8bde)

Profile Page (Light)       |  Profile Page (Dark)      | Edit Profile Page (Light) | Edit Profile Page (Dark)  
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/user-attachments/assets/61ee03d2-6140-43d6-bfed-0532d8e4b21c)|![](https://github.com/user-attachments/assets/ce8a7054-94e8-46f1-9701-967d0095a6c4)|![](https://github.com/user-attachments/assets/3d2f3e1e-e2af-448b-9063-3f6804bb7e0c)|![](https://github.com/user-attachments/assets/5e66005e-a16f-4e0d-8b29-6816d0e7e1be)|

## Requirements

- Flutter SDK
- Dart 2.0 or above
- Android Studio or Xcode for iOS
- [Back-end API.](https://github.com/MASalmanss/XCloneSpringBoot)

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/metinilgar/x-clone-flutter.git
    ```
2. Navigate to the project directory:
    ```bash
    cd x-clone-flutter
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app on an emulator or physical device:
    ```bash
    flutter run
    ```

## Usage

To explore the app, simply run it on your local environment using Flutter's `run` command. The app connects to a specialized backend API that manages interactions such as user management, post creation and likes. You can find the backend [API repository here.](https://github.com/MASalmanss/XCloneSpringBoot) This app serves as a starting point for Flutter developers looking to build "X"-type clone apps. 

## Contribution
Contributions are welcome! If you have any ideas for improvements or find any bugs, please feel free to submit an issue or create a pull request.

To contribute:

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-branch
    ```
3. Commit your changes:
    ```bash
    git commit -m "Add new feature"
    ```
4. Push to the branch:
    ```bash
    git push origin feature-branch
    ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/metinilgar/x-clone-flutter/blob/main/LICENSE) file for more details.

## Contact

If you have any questions or suggestions, feel free to reach out to me on [LinkedIn](https://www.linkedin.com/in/metinilgarmutlu/) or visit my [GitHub](https://github.com/metinilgar) profile for more projects.
