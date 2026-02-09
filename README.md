# 🍔 Food Delivery App - Premium Restaurant Ordering System

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/)
[![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)](https://tomcat.apache.org/)

Food Delivery App is a modern, full-stack Java web application that enables users to browse restaurants, explore menus, and manage their food delivery cart with an elegant, responsive user interface. Built with enterprise-grade architecture patterns including **MVC** and **DAO**, this application demonstrates professional web development practices.

---

## ✨ Features

### 🏠 **Restaurant Discovery**
- Browse curated list of top-rated restaurants
- View restaurant details including ratings, delivery time, and descriptions
- Responsive card-based layout with smooth hover animations
- Professional food photography and branding

### 📋 **Dynamic Menu System**
- Restaurant-specific menu items with detailed descriptions
- Real-time pricing in Indian Rupees (₹)
- Quantity selection for each item
- Add to cart functionality with instant feedback

### 🛒 **Smart Shopping Cart**
- Session-based cart persistence
- Add, update, and remove items seamlessly
- Real-time total price calculation
- Quantity controls with increment/decrement buttons
- Restaurant-specific cart management
- Empty cart state with helpful navigation

### 🎨 **Premium UI/UX**
- Modern, clean design with custom Orange (#ff5200) branding
- Google Fonts integration (Outfit font family)
- Smooth CSS transitions and hover effects
- Responsive layout for mobile, tablet, and desktop
- Font Awesome icons for enhanced visual appeal
- Professional color palette and design system

---

## 🖼️ Application Screenshots

### Home Page - Restaurant Discovery
![Home Page](screenshots/home_page.png)

*Browse popular restaurants with ratings, delivery times, and beautiful food imagery*

**Features:**
- Grid layout displaying restaurant cards with images
- Restaurant ratings, delivery time, and descriptions
- Smooth hover effects and transitions
- Click any restaurant to view its menu

---

### Menu Page - Explore Specialties
![Menu Page](screenshots/menu_page.png)

*View restaurant-specific menu items with descriptions, prices, and quantity selectors*

**Features:**
- Display all menu items for selected restaurant
- Food images, names, descriptions, prices (₹), and ratings
- Quantity selector with +/- buttons
- "Add to Cart" button for each item

---

### Shopping Cart - Manage Orders
![Cart Page](screenshots/cart_with_items.png)

*Review cart items, adjust quantities, and proceed to checkout with real-time totals*

**Features:**
- List of all added items with thumbnails
- Item details: name, restaurant, price, quantity
- Quantity controls (increment/decrement)
- Remove item option and total price calculation

---

### Empty Cart State
![Empty Cart](screenshots/empty_cart.png)

*Friendly empty state with clear call-to-action to browse restaurants*

**Features:**
- Clean, friendly empty state message
- "Browse Restaurants" call-to-action button
- Encourages users to start shopping


---

## 🛠️ Technology Stack

### **Backend**
- **Java 17+** - Core programming language
- **Jakarta Servlet API** - Web application framework
- **JDBC** - Database connectivity
- **Apache Tomcat 10+** - Servlet container

### **Frontend**
- **JSP (JavaServer Pages)** - Dynamic page rendering
- **HTML5** - Semantic markup
- **CSS3** - Custom styling with CSS variables
- **Font Awesome 6.0** - Icon library
- **Google Fonts (Outfit)** - Typography

### **Database**
- **MySQL 8.0+** - Relational database management

### **Architecture Patterns**
- **MVC (Model-View-Controller)** - Application structure
- **DAO (Data Access Object)** - Database abstraction layer
- **Singleton Pattern** - Database connection management

---

## 📁 Project Structure

```
food-delivery-app-main/
│
├── src/main/
│   ├── com/tap/
│   │   ├── model/              # POJOs (Plain Old Java Objects)
│   │   │   ├── Restaurant.java
│   │   │   ├── Menu.java
│   │   │   ├── Cart.java
│   │   │   └── CartItem.java
│   │   │
│   │   ├── dao/                # Data Access Object Interfaces
│   │   │   ├── RestaurantDAO.java
│   │   │   └── MenuDAO.java
│   │   │
│   │   ├── daoimpl/            # DAO Implementations
│   │   │   ├── RestaurantDAOImpl.java
│   │   │   └── MenuDAOImpl.java
│   │   │
│   │   ├── servlet/            # HTTP Request Handlers
│   │   │   ├── homeservlet.java
│   │   │   ├── menuservlet.java
│   │   │   └── cartServlet.java
│   │   │
│   │   └── util/               # Utility Classes
│   │       └── DBconnection.java
│   │
│   └── webapp/
│       └── WEB-INF/
│           ├── home.jsp        # Restaurant listing page
│           ├── menu.jsp        # Menu items page
│           ├── cart.jsp        # Shopping cart page
│           └── style.css       # Global stylesheet
│
├── lib/                        # External libraries
│   └── mysql-connector-j-9.1.0/
│
├── build/                      # Compiled classes
│
├── Cart.java                   # Root-level Cart model
│
└── README.md                   # This file
```

---

## 🚀 Setup Instructions

### **Prerequisites**
- **Java Development Kit (JDK) 17 or higher**
- **Apache Tomcat 10.x or higher**
- **MySQL 8.0 or higher**
- **MySQL Connector/J** (included in `lib/` directory)

### **1. Database Configuration**

#### Create Database
```sql
CREATE DATABASE tapfood;
USE tapfood;
```

#### Create Tables

**Restaurant Table:**
```sql
CREATE TABLE restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(500),
    rating DECIMAL(2,1),
    address VARCHAR(255),
    description TEXT,
    delivery_time INT
);
```

**Menu Table:**
```sql
CREATE TABLE menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(500),
    rating DECIMAL(2,1),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);
```

#### Insert Sample Data

**Sample Restaurants:**
```sql
INSERT INTO restaurant (name, image_url, rating, address, description, delivery_time) VALUES
('The Rustic Plate', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1', 4.5, '123 Main St, Downtown', 'Artisan pasta & wood-fired pizza', 30),
('Sushi Haven', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351', 4.8, '456 Oak Ave, Westside', 'Fresh sushi & Japanese fusion', 35),
('Taco Barrio', 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47', 4.3, '789 Maple Dr, Southside', 'Authentic street tacos & margaritas', 25);
```

**Sample Menu Items:**
```sql
INSERT INTO menu (restaurant_id, item_name, description, price, image_url, rating) VALUES
(1, 'Butter Chicken', 'Tender chicken simmered in a rich tomato and butter gravy', 349, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398', 4.6),
(1, 'Paneer Tikka Masala', 'Grilled cottage cheese cubes in a creamy, spiced tomato gravy', 249, 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7', 4.4),
(2, 'California Roll', 'Fresh crab, avocado, and cucumber wrapped in rice', 299, 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351', 4.7),
(3, 'Fish Tacos', 'Crispy fish with cabbage slaw and chipotle mayo', 199, 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47', 4.5);
```

### **2. Update Database Connection**

Edit `src/main/com/tap/util/DBconnection.java`:

```java
private static String URL = "jdbc:mysql://localhost:3306/tapfood";
private static String Username = "your_mysql_username";  // Update this
private static String Password = "your_mysql_password";  // Update this
```

### **3. Build and Deploy**

#### **Option A: Using Eclipse IDE**
1. Import project as **Dynamic Web Project**
2. Add MySQL Connector JAR to build path
3. Right-click project → **Run As** → **Run on Server**
4. Select Apache Tomcat 10.x
5. Access at: `http://localhost:8080/food-delivery-app-main/home`

#### **Option B: Manual Deployment**
1. Compile all Java files:
   ```bash
   javac -cp "lib/mysql-connector-j-9.1.0/mysql-connector-j-9.1.0.jar;lib/servlet-api.jar" -d build/classes src/main/com/tap/**/*.java
   ```

2. Create WAR file structure:
   ```bash
   mkdir -p deploy/WEB-INF/classes
   mkdir -p deploy/WEB-INF/lib
   cp -r build/classes/* deploy/WEB-INF/classes/
   cp -r src/main/webapp/WEB-INF/*.jsp deploy/WEB-INF/
   cp -r src/main/webapp/WEB-INF/*.css deploy/WEB-INF/
   cp lib/mysql-connector-j-9.1.0/*.jar deploy/WEB-INF/lib/
   ```

3. Deploy to Tomcat:
   ```bash
   cp -r deploy $CATALINA_HOME/webapps/TapFood
   ```

4. Start Tomcat and access: `http://localhost:8080/TapFood/home`

---

## 🎯 Usage Guide

### **Browse Restaurants**
1. Navigate to the home page
2. View restaurant cards with ratings and delivery times
3. Click on any restaurant card to view its menu

### **Add Items to Cart**
1. On the menu page, select quantity for desired items
2. Click the **ADD** button
3. Cart icon in navigation bar updates with item count

### **Manage Cart**
1. Click the cart icon in the navigation bar
2. Use **+** and **-** buttons to adjust quantities
3. Click trash icon to remove items
4. View real-time total price updates
5. Click **Proceed to Checkout** when ready

### **Clear Cart**
- Click **Clear Entire Cart** link at the bottom of cart page

---

## 🏗️ Architecture Overview

### **MVC Pattern Implementation**

#### **Model Layer**
- `Restaurant.java` - Restaurant entity
- `Menu.java` - Menu item entity
- `Cart.java` - Shopping cart logic
- `CartItem.java` - Individual cart item

#### **View Layer**
- `home.jsp` - Restaurant listing view
- `menu.jsp` - Menu items view
- `cart.jsp` - Shopping cart view
- `style.css` - Presentation layer

#### **Controller Layer**
- `homeservlet.java` - Handles restaurant listing requests
- `menuservlet.java` - Handles menu display requests
- `cartServlet.java` - Handles cart operations (add, update, remove, clear)

### **DAO Pattern Implementation**

#### **Interfaces**
- `RestaurantDAO.java` - Restaurant data operations contract
- `MenuDAO.java` - Menu data operations contract

#### **Implementations**
- `RestaurantDAOImpl.java` - MySQL implementation for restaurants
- `MenuDAOImpl.java` - MySQL implementation for menus

---

## 🎨 Design System

### **Color Palette**
```css
--primary: #ff5200;           /* Primary Orange */
--primary-hover: #e64a00;     /* Darker orange for hover states */
--secondary: #282c3f;         /* Dark navy for text */
--text-main: #3d4152;         /* Primary text color */
--text-light: #7e808c;        /* Secondary text color */
--white: #ffffff;             /* Pure white */
--bg-light: #f4f4f5;          /* Light gray background */
```

### **Typography**
- **Font Family:** Outfit (Google Fonts)
- **Weights:** 300, 400, 500, 600, 700

### **Spacing & Shadows**
- **Shadow:** `0 4px 12px rgba(0,0,0,0.08)`
- **Transition:** `all 0.3s cubic-bezier(0.4, 0, 0.2, 1)`

---

## 🔒 Security Considerations

> [!WARNING]
> **Current Implementation Notes:**
> - Database credentials are hardcoded in `DBconnection.java`
> - No user authentication/authorization implemented
> - SQL queries should be parameterized to prevent SQL injection
> - Session management is basic and should be enhanced for production

### **Recommended Improvements:**
1. Use environment variables for database credentials
2. Implement prepared statements for all SQL queries
3. Add user authentication and session security
4. Implement HTTPS for production deployment
5. Add input validation and sanitization

---

## 🧪 Testing

### **Manual Testing Checklist**
- [ ] Home page loads with restaurant list
- [ ] Restaurant cards display correct information
- [ ] Clicking restaurant navigates to menu page
- [ ] Menu items display with images and prices
- [ ] Add to cart functionality works
- [ ] Cart count updates in navigation bar
- [ ] Cart page shows correct items and quantities
- [ ] Quantity increment/decrement works
- [ ] Remove item functionality works
- [ ] Total price calculates correctly
- [ ] Clear cart functionality works
- [ ] Empty cart state displays correctly

---

## 🚧 Future Enhancements

- [ ] User authentication and registration
- [ ] Order history and tracking
- [ ] Payment gateway integration
- [ ] Restaurant search and filtering
- [ ] User reviews and ratings
- [ ] Delivery address management
- [ ] Real-time order status updates
- [ ] Admin panel for restaurant management
- [ ] Email notifications
- [ ] Mobile application (Android/iOS)

---

## 🐛 Troubleshooting

### **Common Issues**

#### **404 Error when accessing application**
- Ensure Tomcat is running
- Check deployment path matches URL
- Verify servlet mappings in web.xml (if using)

#### **Database connection failed**
- Verify MySQL is running
- Check database credentials in `DBconnection.java`
- Ensure `tapfood` database exists (or your configured database name)
- Confirm MySQL Connector JAR is in classpath

#### **No restaurants/menu items displayed**
- Check database has sample data
- Verify SQL queries in DAO implementations
- Check console logs for SQL errors

#### **Cart not persisting**
- Ensure session management is working
- Check browser cookies are enabled
- Verify servlet session handling

---

## 📝 License

This project is developed as part of the **Tap Academy Java Full Stack Course** for educational purposes.

---

## 👨‍💻 Developer

**Developed with ❤️ as part of Java Full Stack Development training**

---

## 📞 Support

For issues or questions:
1. Check the troubleshooting section above
2. Review console logs for error messages
3. Verify database connectivity and data
4. Ensure all dependencies are properly configured

---

## 🙏 Acknowledgments

- **Tap Academy** - Java Full Stack Course
- **Unsplash** - Food photography
- **Font Awesome** - Icon library
- **Google Fonts** - Outfit font family

---

<div align="center">

**⭐ Star this repository if you found it helpful!**

Made with Java, JSP, and lots of ☕

</div>