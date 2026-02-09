package com.tap.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.daoimpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/home")
public class homeservlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html");
		try {
		    RestaurantDAOImpl impl = new RestaurantDAOImpl();
		    List<Restaurant> allRestaurants = impl.getAllRestaurants();
		    for(Restaurant restaurant : allRestaurants) {
			     System.out.println(restaurant);
		    }
		    req.setAttribute("allRestaurants", allRestaurants);
		    RequestDispatcher rd= req.getRequestDispatcher("home.jsp");
		    rd.forward(req, resp);
		}
	    catch(Exception e) {
		    e.printStackTrace();
	    }
    }
}
