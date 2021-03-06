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
        try { // added the date created when inserting a new ad into the data base
            String sql = "INSERT INTO ads(title, description, user_id, date_created) VALUES (?, ?, ?, curdate())";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getUserId());
            stmt.executeUpdate();
            ResultSet generatedIdResultSet = stmt.getGeneratedKeys();

            generatedIdResultSet.next();

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
        Ad ad = new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("date_created")
        );
        ad.setCategories(searchCategoryByAdId(rs.getLong("id")));
        return ad;
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }


    private List<String> searchCategoryByAdId(Long adId) {
        String sql = "select name from ad_categories " +
                "join categories c on ad_categories.categories_id = c.id " +
                "where ad_id = ?";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, adId);

            ResultSet rs =  stmt.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                list.add(rs.getString("name"));
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Error searching all ads.", e);
        }
    }

    public Long update(Ad ad) {
        try {
            String sql = "update ads set title = ?, description = ? where id = ? and user_id = ? limit 1";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getId());
            stmt.setLong(4, ad.getUserId());

            return Long.valueOf(stmt.executeUpdate());
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    public Long delete(Ad ad) {
        try {
            String sql = "delete from ads where id = ? and user_id = ? limit 1";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getId());
            stmt.setLong(2, ad.getUserId());

            return Long.valueOf(stmt.executeUpdate());
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
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

    public Ad searchAdById(Long adId) {
        String sql = "Select * from ads where id = ? limit 1";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, adId);

            ResultSet rs =  stmt.executeQuery();
            rs.next();
            return new Ad(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("date_created")
            );
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

    public List<Ad> ownerAds(Long user_id) {
        String sql = "SELECT * FROM ads WHERE user_id = ?";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, user_id);

            ResultSet rs = stmt.executeQuery();

            return createAdsFromResults(rs);
        }catch (SQLException e){
            throw new RuntimeException("Error loading your ads.", e);
        }
    }

}