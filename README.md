# Pi Course Mobile - Flutter Frontend
A Flutter mobile application for the Pi Course tutoring platform where students can find tutors and create lesson requests.

## Features

- Authentication: Login/Register with role selection (Student/Tutor)
- Tutor Discovery: Search, filter, and sort tutors by subject and rating
- Lesson Booking: Students can request lessons from tutors
- Request Management: Tutors can approve/reject lesson requests
- Responsive UI: Clean, modern interface with proper loading/error states


<img width="317" height="689" alt="Screenshot 2025-08-23 at 02 47 35" src="https://github.com/user-attachments/assets/19ecf1dc-6baa-4fe5-8f6d-ff518b70f9da" />
<img width="319" height="690" alt="Screenshot 2025-08-23 at 02 47 45" src="https://github.com/user-attachments/assets/55a5d933-09a1-4f7c-9754-cbcf0d9d11e3" />
<img width="318" height="691" alt="Screenshot 2025-08-23 at 02 48 44" src="https://github.com/user-attachments/assets/baaadca9-d2ae-4833-b616-90eec7f72ee1" />
<img width="318" height="689" alt="Screenshot 2025-08-23 at 02 48 52" src="https://github.com/user-attachments/assets/384b5d98-b953-47a6-a608-c0587e6f4284" />
<img width="319" height="692" alt="Screenshot 2025-08-23 at 02 49 00" src="https://github.com/user-attachments/assets/5726ca64-d586-498d-a401-52bfc993ae4e" />
<img width="319" height="690" alt="Screenshot 2025-08-23 at 02 50 28" src="https://github.com/user-attachments/assets/f4a0d64e-c90a-44dd-9632-4d271faf95e5" />


## Technical Stack

- Framework: Flutter 3.10+
- State Management: Riverpod (chosen for its simplicity and type safety)
- HTTP Client: Dio (robust error handling and interceptors)
- JSON Serialization: Freezed + json_serializable (type-safe models)
- Secure Storage: flutter_secure_storage (JWT token management)

## Setup Instructions

**Prerequisites:**

- Flutter SDK 3.10 or higher
- Dart SDK 3.0 or higher
- Android Studio / VS Code with Flutter extensions
- Physical device or emulator for testing

## Installation

1. Clone the repository

```bash
git clone 
cd picourse-mobile
```
2. Install dependencies

```bash
flutter pub get
```

3. Generate code (for Freezed models)

```bash
flutter packages pub run build_runner build
```

4. Configure backend URL: Edit lib/services/api_client.dart and update the baseUrl:

```dart
// For iOS Simulator  
static const String baseUrl = 'http://localhost:8000/api';

// For Physical Device (replace with your computer's IP)
static const String baseUrl = 'http://192.168.1.100:8000/api';
```

5. Run the app

```bash
# For development
flutter run

# For release build
flutter run --release
```

## Project Structure
**State Management (Riverpod)
Why Riverpod over Bloc?**

- Simplicity: Less boilerplate code compared to Bloc
- Type Safety: Compile-time safety with providers
- Testability: Easy to mock and test providers
- Performance: Granular rebuilds and automatic disposal
- Developer Experience: Better debugging and DevTools support

**Key Providers:**

- authProvider - Authentication state and user management
- tutorProvider - Tutor listing, search, and details
- lessonProvider - Lesson request creation and management

**Service Layer:**

- ApiClient - HTTP client with JWT token handling
- AuthService - Authentication operations
- TutorService - Tutor-related API calls
- LessonService - Lesson request operations

## Testing
**Demo Accounts**
Use these accounts created by the backend seed data:
```
Student Account:

Email: student@demo.com
Password: DemoPass123!

Tutor Account:

Email: tutor@demo.com
Password: DemoPass123!
```

## Test Scenarios

- Registration: Create new student and tutor accounts
- Authentication: Login/logout flow
- Tutor Search: Filter by subject, search by name
- Lesson Booking: Complete request flow as student
- Request Management: Approve/reject as tutor
