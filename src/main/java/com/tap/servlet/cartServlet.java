package com.tap.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.tap.dao.MenuDAO;
import com.tap.daoimpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class cartServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Integer currentRestaurantID = (Integer) session.getAttribute("restaurantId");
		int newRestaurantID = Integer.parseInt(req.getParameter("restaurantId"));
		
		if(cart == null || currentRestaurantID != newRestaurantID) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantID);
		}
		String action = req.getParameter("action");
		try {
			if ("add".equals(action)) {
		         addItemToCart(req, cart); 
			}
			else if ("update".equals(action)) {
		         updateCartItem(req, cart);
		     } 
		     else if ("remove".equals(action)) { 
			      removeItemFromCart(req, cart);
		     }
		}
        catch (Exception e) {
	        e.printStackTrace();
        }
		resp.sendRedirect("cart.jsp");
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) throws SQLException {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

	    MenuDAO menuDAO = new MenuDAOImpl();
        Menu menuItem = menuDAO.getMenu(itemId);

        System.out.println("The menu in Cart Servlet: " + menuItem);

	    if (menuItem != null) {
            CartItem item = new CartItem(menuItem.getMenuId(), menuItem.getRestaurantId(), menuItem.getItemName(), quantity, menuItem.getPrice());
            cart.addItem(item);
        }
	    
	}
	
	private void updateCartItem(HttpServletRequest req, Cart cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		cart.updateItem(itemId, quantity);
	}
	
	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		cart.removeItem(itemId);
	}
}