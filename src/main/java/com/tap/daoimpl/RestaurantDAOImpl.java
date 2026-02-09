package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.model.Restaurant;
import com.tap.util.DBconnection;

public class RestaurantDAOImpl {

    private static final String GET_ALL_RESTAURANTS ="SELECT * FROM restaurant";

    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurantList = new ArrayList<>();

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ALL_RESTAURANTS)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Restaurant restaurant = new Restaurant();

                // ⭐ VERY IMPORTANT (THIS FIXES YOUR ERROR)
                restaurant.setRestaurantId(rs.getInt("restaurant_id"));

                restaurant.setName(rs.getString("name"));
                restaurant.setImageUrl(rs.getString("image_url"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setDescription(rs.getString("description"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));

                restaurantList.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurantList;
    }
}
