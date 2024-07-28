package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Passenger;

public class PassengerDAO {
    public boolean addPassenger(Passenger passenger) {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "INSERT INTO passengers (pnr, name, gender, age, origin, destination, ticket_price, train_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, passenger.getPnr());
            statement.setString(2, passenger.getName());
            statement.setString(3, passenger.getGender());
            statement.setInt(4, passenger.getAge());
            statement.setString(5, passenger.getOrigin());
            statement.setString(6, passenger.getDestination());
            statement.setDouble(7, passenger.getTicketPrice());
            statement.setInt(8, passenger.getTrainNumber());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Passenger> getAllPassengers() {
        List<Passenger> passengers = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT * FROM passengers";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Passenger passenger = new Passenger(
                    resultSet.getString("pnr"),
                    resultSet.getString("name"),
                    resultSet.getString("gender"),
                    resultSet.getInt("age"),
                    resultSet.getString("origin"),
                    resultSet.getString("destination"),
                    resultSet.getDouble("ticket_price"),
                    resultSet.getInt("train_number")
                );
                passengers.add(passenger);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return passengers;
    }

    public Passenger getPassenger(String pnr) {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT * FROM passengers WHERE pnr = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, pnr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Passenger(
                    resultSet.getString("pnr"),
                    resultSet.getString("name"),
                    resultSet.getString("gender"),
                    resultSet.getInt("age"),
                    resultSet.getString("origin"),
                    resultSet.getString("destination"),
                    resultSet.getDouble("ticket_price"),
                    resultSet.getInt("train_number")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePassenger(Passenger passenger) {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "UPDATE passengers SET name = ?, gender = ?, age = ?, origin = ?, destination = ?, ticket_price = ?, train_number = ? WHERE pnr = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, passenger.getName());
            statement.setString(2, passenger.getGender());
            statement.setInt(3, passenger.getAge());
            statement.setString(4, passenger.getOrigin());
            statement.setString(5, passenger.getDestination());
            statement.setDouble(6, passenger.getTicketPrice());
            statement.setInt(7, passenger.getTrainNumber());
            statement.setString(8, passenger.getPnr());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deletePassenger(String pnr) {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "DELETE FROM passengers WHERE pnr = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, pnr);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
