package model;

import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ProductDAO implements IProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy";
    private String jdbcUserName = "root";
    private String jdbcPassword = "votinh9$";
    private static final String SELECT_ALL_PRODUCT_SQL = "select*from products;";
    private static final String FIND_BY_ID_SQL = "SELECT * FROM products WHERE id =?;";
    private static final String FIND_BY_NAME_SQL = "SELECT * FROM products WHERE name LIKE CONCAT('%',?,'%');";
    private static final String ADD_PRODUCT_SQL = "insert into products(id,name,price,quantity,image) values(?,?,?,?,?);";
    private static final String UPDATE_PRODUCT_SQL = "update products set name=?,price=?,quantity=?,image=? where id = ?;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?;";
    private static final String ADD_ORDER_SQL = "insert into `order` values();";
    private static final String ADD_ORDER_DETAIL_SQL = "insert into orderdetail(oId,pId,amount) values((select max(id) from `order`),?,?);";
    private static final String SELECT_ORDER_DETAIL_SQL = "SELECT * FROM orderdetail where oId = (select max(oId) from orderdetail);";

    public ProductDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Product> selectAll() {
        List<Product> list = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PRODUCT_SQL);) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {  //lấy data tu database
                String id = rs.getString("id");
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                Integer quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                list.add(new Product(id, name, price, quantity, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void create(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(ADD_PRODUCT_SQL);) {
//        Statement là một trong 3 loại interace hỗ trợ thực thi câu lệnh truy vấn sử dụng SQL tĩnh, dùng một lần
            statement.setString(1, product.getId());
            statement.setString(2, product.getName());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getQuantity());
            statement.setString(5, product.getImage());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL);) {
            statement.setString(5, product.getId());
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getImage());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean remove(String id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public Product findById(String id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_BY_ID_SQL);) {
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                Integer quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                product = new Product(id, name, price, quantity, image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> list = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_BY_NAME_SQL);) {
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
//              dang truy van nhung ten gan giong nen phai lay name chinh xac tu database
                String fullName = rs.getString("name");
                Double price = rs.getDouble("price");
                Integer quantity = rs.getInt("quantity");
                String image = rs.getString("image");
                Product foundProduct = new Product(id, fullName, price, quantity, image);
                list.add(foundProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void buy() throws SQLException {
        String query = "{CALL submitOrder()}"; //Stored Procedure submitOrder() trong database
        try (Connection connection = getConnection();
             CallableStatement statement = connection.prepareCall(query);) {
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createOrder() throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(ADD_ORDER_SQL);) {
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //them tam thoi vao orderDetail, tat ca don hang dang có ben trong la khong xac dinh, can tao them bang don hang da mua
    //bao gom nhung don hang da chay ham submitOrder trong Servlet va dong thoi da update so luong vao bang products
    public void createOrderDetail(String productId, int amount) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(ADD_ORDER_DETAIL_SQL);) {
            statement.setString(1, productId);
            statement.setInt(2, amount);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //do column typePrice trong orderdetail được cập nhật sau khi có sản phẩm và số lượng nên phải dùng câu lệnh để tạo
    private void updateTypePrice() throws SQLException {
        String query = "{CALL updateTypePrice()}";   //Stored Procedure updateTypePrice() trong database
        try (Connection connection = getConnection();
             CallableStatement statement = connection.prepareCall(query);) {
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public OrderDetail selectOrderDetail() throws SQLException {
        OrderDetail orderDetail = new OrderDetail();
        double Price = 0.0;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ORDER_DETAIL_SQL);) {
            updateTypePrice();
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("oId");
                String productId = rs.getString("pId");
                int amount = rs.getInt("amount");
                double typePrice = rs.getDouble("typePrice");
                Price += typePrice;
                orderDetail.setOrderId(orderId);
                orderDetail.setPrice(Price);
                orderDetail.addProduct(productId, amount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetail;
    }
}
