🍓 Fruit Hub

Fruit Hub is a Flutter e-commerce application where users can browse and purchase fresh products. Users can add items to the cart, proceed to checkout by entering their shipping information, and complete payment via PayPal. The app supports login using Google and Facebook through Firebase Authentication, while user data is stored in Firebase Database. Product images and other files are stored securely in Supabase Storage.


✨ Features
Browse a list of products.

Add products to the cart.

Checkout by adding address and personal information.

Pay securely using PayPal integration.

User authentication with Google and Facebook (via Firebase).

Manage user sessions securely.

Responsive UI for mobile.

Firebase database integration

Supabase storage for images/files

🛠️ Technologies Used

Cubit for State Management

Clean Architecture for better project structure

GetIt for Dependency Injection

PayPal SDK for payment integration

Firebase Authentication for social login (Google, Facebook)

Firebase Database – User data and cart data

Supabase Storage – File/image handling


🏛️ Architecture
The app is structured based on Clean Architecture principles, dividing the project into clear layers:

Presentation Layer (UI + Cubit)

Domain Layer (Entity , Repositories)

Data Layer (Repositories, Model)

🔒 Secure Storage
User tokens and sensitive data are handled securely using Firebase Authentication.

