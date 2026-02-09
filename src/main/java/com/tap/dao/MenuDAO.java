package com.tap.dao;

import java.sql.SQLException;
import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {
    Menu getMenu(int menuId) throws SQLException;
    List<Menu> getAllMenuByRestaurant(int restaurantId) throws SQLException;
}
