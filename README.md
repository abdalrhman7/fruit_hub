🍓 Fruit Hub
Fruit Hub is a Flutter e-commerce application where users can browse products, add them to the cart, and complete the checkout process, including address and personal information entry. Payment is processed via PayPal, and users can register/login using Google or Facebook accounts.

✨ Features
Browse a list of products.

Add products to the cart.

Checkout by adding address and personal information.

Pay securely using PayPal integration.

User authentication with Google and Facebook (via Firebase).

Manage user sessions securely.

Responsive UI for mobile and tablet devices.

🛠️ Technologies Used

Cubit for State Management

Clean Architecture for better project structure

GetIt for Dependency Injection

Dio for API communication

Firebase Authentication for social login (Google, Facebook)

PayPal SDK for payment integration

🏛️ Architecture
The app is structured based on Clean Architecture principles, dividing the project into clear layers:

Presentation Layer (UI + Cubit)

Domain Layer (Entity , Repositories)

Data Layer (Repositories, Model)

🔒 Secure Storage
User tokens and sensitive data are handled securely using Firebase Authentication.

