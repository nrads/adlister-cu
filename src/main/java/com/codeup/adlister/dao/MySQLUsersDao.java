package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;


    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
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
    public User findByUsername(String username) {

        User user = new User();
        try {
            String sql = "SELECT * FROM user where username = ?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                user.setId(rs.getLong("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving users.", e);
        }
        return user;
    }

    @Override
    public Long insert(User user) {
            try {
                String sql = "INSERT INTO user(username, email, password) VALUES (?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getEmail());
                stmt.setString(3, user.getPassword());
                stmt.executeUpdate();
                ResultSet generatedIdResultSet = stmt.getGeneratedKeys();
                generatedIdResultSet.next();
                return generatedIdResultSet.getLong(1);
            } catch (SQLException e) {
//                throw new RuntimeException("Error creating a new user.", e);
                return -12L;
            }
    }

//    public void updateUsername(String newUsername) {
//        try{
//            String sql = "UPDATE user SET username = ? WHERE id = ?";
//            PreparedStatement stmt = connection.prepareStatement(sql);
//
//        } catch (SQLException e){
//            throw new RuntimeException("Error updating username.", e);
//        }
//    }
}
