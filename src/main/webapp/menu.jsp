<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List, com.tap.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Menu</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      background-color: #f4f5f7;
      padding: 30px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #222;
    }

    .menu-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 24px;
    }

    .menu-card {
      background: #ffffff;
      border-radius: 18px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0,0,0,0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .menu-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 14px 32px rgba(0,0,0,0.12);
    }

    .menu-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .menu-content {
      padding: 16px;
    }

    .menu-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 8px;
    }

    .menu-header h2 {
      font-size: 18px;
      color: #111;
    }

    .rating {
      background: #27ae60;
      color: #fff;
      padding: 4px 8px;
      border-radius: 8px;
      font-size: 13px;
      font-weight: 600;
    }

    .description {
      font-size: 14px;
      color: #555;
      margin: 10px 0;
      line-height: 1.4;
    }

    .menu-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 12px;
    }

    .price {
      font-size: 16px;
      font-weight: 600;
      color: #e67e22;
    }

    .btn {
      background: #ff4d4d;
      color: #fff;
      border: none;
      padding: 8px 14px;
      border-radius: 10px;
      font-size: 14px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .btn:hover {
      background: #e63e3e;
    }
  </style>
</head>
<body>

  <h1>Our Menu</h1>

  <div class="menu-container">
  
  <% List<Menu> allMenuByRestaurant = (List<Menu>)request.getAttribute("allMenuByRestaurant");
  for(Menu menu : allMenuByRestaurant) {
	  %>
	  <div class="menu-card">
      <img src="<%=menu.getImageUrl() %>" alt="Ice Cream" />
      <div class="menu-content">
        <div class="menu-header">
          <h2><%=menu.getItemName() %></h2>
        </div>
        <p class="description"><%=menu.getDescription() %></p>
        <div class="menu-footer">
          <span class="price"><%=menu.getPrice() %></span>
          
          <form action="cart">
          <input type="hidden" name="itemId" value=" <%=menu.getMenuId() %>">
          <input type="hidden" name="quantity" value=" 1">
          <input type="hidden" name="restaurant" value=" <%=menu.getRestaurantId() %>">
          <input type="hidden" name="action" value=" add">
          <input type="submit" value="Add To Cart">
          </form>
          
        </div>
	<% }
  %>

    
      </div>
    </div>

  </div>

</body>
</html>