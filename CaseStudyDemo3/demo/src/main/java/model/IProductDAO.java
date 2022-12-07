package model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface IProductDAO {
    void create(Product product);
    void update(Product product);

    boolean remove(String id);
    List<Product> selectAll();
    Product findById(String id);
    List<Product> findByName(String name);
//    void order(String id, int amount) throws SQLException;
//    HashMap<String,Integer> order(String id, int amount) throws SQLException;
}
