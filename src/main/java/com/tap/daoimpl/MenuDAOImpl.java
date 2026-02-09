package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DBconnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public Menu getMenu(int menuId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Menu menu = null;
        
        try {
            con = DBconnection.getConnection();
            String query = "SELECT * FROM menu WHERE menu_id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menuId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                menu = new Menu(
                    rs.getInt("menu_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("item_name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("image_url"),
                    rs.getDouble("rating")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
        
        return menu;
    }

    @Override
    public List<Menu> getAllMenuByRestaurant(int restaurantId) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Menu> menuList = new ArrayList<>();
        
        try {
            con = DBconnection.getConnection();
            String query = "SELECT * FROM menu WHERE restaurant_id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, restaurantId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("menu_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("item_name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("image_url"),
                    rs.getDouble("rating")
                );
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
        
        return menuList;
    }
}
