package com.tap.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.tap.daoimpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class menuservlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		try {
			MenuDAOImpl impl = new MenuDAOImpl();
			int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
			List<Menu> allMenuByRestaurant = impl.getAllMenuByRestaurant(restaurantId);
			for(Menu menu : allMenuByRestaurant) {
				System.out.println(menu);
			}
			req.setAttribute("allMenuByRestaurant", allMenuByRestaurant);
			RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
			rd.forward(req,  resp);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
}

}
