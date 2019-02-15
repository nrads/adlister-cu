package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM ads");
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {                                        // added the date created when inserting a new ad into the data base
            String sql = "INSERT INTO ads(title, description, user_id, date_created) VALUES (?, ?, ?, curdate())";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getUserId());
            stmt.executeUpdate();
            ResultSet generatedIdResultSet = stmt.getGeneratedKeys();
            System.out.println(generatedIdResultSet);
            System.out.println("next " + generatedIdResultSet.next());
            return generatedIdResultSet.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private String createInsertQuery(Ad ad) {
        return "INSERT INTO ads(user_id, title, description) VALUES "
            + "(" + ad.getUserId() + ", "
            + "'" + ad.getTitle() +"', "
            + "'" + ad.getDescription() + "')";
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("date_created")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public List<Ad> searchAds(String searchQuery) {
        String sql = "Select * from ads where title like ? or description like ?";
        searchQuery = "%" + searchQuery +"%";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, searchQuery);
            stmt.setString(2, searchQuery);

            ResultSet generatedIdResultSet =  stmt.executeQuery();

            return createAdsFromResults(generatedIdResultSet);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching all ads.", e);
        }

    }
    @Override
    public void setAdCategory(Long adId, String[] array){

        try {
            for (int i = 0; i < array.length; i++) {
                if (array[i] != null ){
                    String sql = "INSERT INTO ad_categories(ad_id, categories_id) VALUES (?, ?)";
                    PreparedStatement stmt = connection.prepareStatement(sql);
                    stmt.setLong(1, adId);
                    stmt.setLong(2, i+1);
                    stmt.executeUpdate();
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error setting categories to ad: "+ adId, e);
        }
    }

    @Override
    public List<Ad> categoryFilter(String searchQuery) {
        return null;
    }
}