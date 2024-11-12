# ShopHub-E-Commerce-Application

A Flutter-based e-commerce application that uses REST API for user authentication, displaying products, product details, and adding items to the cart. The app is designed for selling tech products like laptops and phones, providing a smooth and responsive user experience.

## Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [API Integration](#api-integration)
- [Pages and Functionality](#pages-and-functionality)
- [Setup](#setup)
- [Screenshots](#screenshots)
- [Contributors](#contributors)
- [License](#license)

## Features

- **User Authentication**: Login and registration using API.
- **Product Catalog**: Displays all products fetched from an API.
- **Product Details**: Shows detailed product information.
- **Add to Cart**: Add products to the cart using API calls.
- **Responsive UI**: Optimized for both mobile and tablet.

## Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: REST API for authentication, products, and cart management.

## API Integration

The app integrates with a custom REST API for the following features:

- **Authentication API**: Users log in or register through an API.
- **Products API**: Fetch all products to display in the catalog.
- **Product Details API**: Retrieve details of a selected product.
- **Cart API**: Add items to the cart and retrieve cart details.

### Example API Endpoints:

1. **Login API**: `/api/auth/login`
   - Method: `POST`
   - Body: `{ "email": "user@example.com", "password": "password123" }`

2. **Products API**: `/api/products`
   - Method: `GET`
   - Response: `[{ "id": 1, "name": "Laptop", "price": 999, ... }]`

3. **Product Details API**: `/api/products/{id}`
   - Method: `GET`
   - Response: `{ "id": 1, "name": "Laptop", "price": 999, "description": "...", ... }`

4. **Add to Cart API**: `/api/cart/add`
   - Method: `POST`
   - Body: `{ "productId": 1, "quantity": 1 }`

## Pages and Functionality

### Authentication Pages

- **Login Page**: Users can log in using email and password through the authentication API.
- **Register Page**: New users can sign up by providing an email, password, and other details.

### Product Catalog

- **Product List Page**: Displays all products retrieved from the products API.
- Users can scroll through products and filter them.

### Product Details

- **Product Details Page**: Shows detailed information about a product, including images, specifications, and pricing.
- API fetches product details for each selected item.

### Cart

- **Add to Cart**: Users can add products to their cart via the cart API.
- **Cart Page**: Displays items in the cart with options to update quantities or proceed to checkout.


## Setup

To set up and run the project locally, follow the steps below:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/techstore-app.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd techstore-app
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Set up the API**:

   - Configure your API endpoints in the project, typically in a `config.dart` file.
   - Ensure your backend API is running and ready to handle authentication, products, and cart operations.

5. **Run the app**:

   ```bash
   flutter run
   ```

   Ensure your API is live and accessible.

## Contributors

 - **Rohit Prajapati** - API Integration / Junior Developer

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Android ScreenShot

![Add a subheading (1)](https://github.com/user-attachments/assets/6000df8b-4201-41f4-96e4-aa35e0d6ad32)



