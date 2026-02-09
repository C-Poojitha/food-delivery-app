<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List,com.tap.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Delivery – Restaurants</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      background: #f5f5f5;
      padding: 30px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #222;
    }

    .restaurant-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 25px;
    }

    .card {
      background: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0,0,0,0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-6px);
      box-shadow: 0 12px 28px rgba(0,0,0,0.12);
    }

    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .card-content {
      padding: 16px;
    }

    .card-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 8px;
    }

    .card-header h2 {
      font-size: 18px;
      color: #111;
    }

    .rating {
      background: #2ecc71;
      color: #fff;
      padding: 4px 8px;
      border-radius: 8px;
      font-size: 14px;
      font-weight: 600;
    }

    .address {
      font-size: 13px;
      color: #777;
      margin-bottom: 8px;
    }

    .description {
      font-size: 14px;
      color: #555;
      margin-bottom: 12px;
      line-height: 1.4;
    }

    .card-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 14px;
      color: #333;
      font-weight: 500;
    }

    .eta {
      color: #e67e22;
    }
  </style>
</head>
<body>

  <h1>Popular Restaurants Near You</h1>
  <div class="restaurant-container">
  
  <%
   List<Restaurant> allRestaurants = (List<Restaurant>)request.getAttribute("allRestaurants");
  for(Restaurant restaurant : allRestaurants) {
  %>
	  
	<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">
	       <div class="card">
      <img src="<%= restaurant.getImageUrl() %>" alt="Restaurant" />
      <div class="card-content">
        <div class="card-header">
          <h2><%= restaurant.getName() %></h2>
          <span class="rating">★ <%= restaurant.getRating() %></span>
        </div>
        <p class="address"><%= restaurant.getAddress() %></p>
        <p class="description"><%= restaurant.getDeliveryTime() %></p>
      </div>
      </div>
	</a>
      
      <%}
  
      %>

  </div>

</body>
</html>
    