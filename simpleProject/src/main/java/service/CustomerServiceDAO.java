package service;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceDAO  implements CustomerService{
    private static final String jdbcURL ="jdbc:mysql://localhost:3306/demo1";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "votinh9$";

    private static final String SELECT_ALL_CUSTOMERS ="select*from customer";
    private static final String INSERT_CUSTOMERS ="insert into customer(id,name,email,address) values (?,?,?,?);";
    private static final String UPDATE_CUSTOMERS ="update customer set name = ?,email = ?,address =? where id=?;";

    public CustomerServiceDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = getConnection();
//             Statement interface trong java cung cấp các phương thức để thực thi các câu lệnh truy vấn
//             với cơ sở dữ liệu SQL. Statement interface cung cấp phương thức để tạo ra đối tượng ResultSet
             PreparedStatement stm = connection.prepareStatement(SELECT_ALL_CUSTOMERS);) {
//            System.out.println(preparedStatement);
            ResultSet rs = stm.executeQuery();

            //executeQuery chỉ sử dụng cho các hiển thị (từ khóa SELECT), query đi với ResultSet, còn Update thì k

//Lấy dữ liệu từ Database, có kiểu trong Database
            while (rs.next()) { //lấy từng dòng trong Database
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customers.add(new Customer(id, name, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }


    @Override
    public void save(Customer customer) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS)) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getAddress());

            preparedStatement.executeUpdate();
            //executeUpdate sử dụng khi thay đổi dữ liệu database, các từ khóa INSERT INTO, UPDATE, DELETE FROM
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer findById(int id) {

        return null;
    }

    @Override
    public void update(int id, Customer customer) {
            try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMERS);) {
                statement.setString(1, customer.getName());
                statement.setString(2, customer.getEmail());
                statement.setString(3, customer.getAddress());
                statement.setInt(4, customer.getId());

                statement.executeUpdate();
            }catch (SQLException e) {
                e.printStackTrace();
            }

    }

    @Override
    public void remove(int id) {

    }
}
