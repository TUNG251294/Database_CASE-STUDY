package model;

import java.util.HashMap;

public class OrderDetail {
    private int orderId;
    private String productId;
    private int amount;
    private double Price;
    private HashMap<String, Integer> hashMap = new HashMap<>();

    public HashMap<String, Integer> getHashMap() {
        return hashMap;
    }

    public OrderDetail() {
    }

    public OrderDetail(int orderId) {
        this.orderId = orderId;
        getHashMap();
    }

    public void addProduct(String productId, int amount) {
        getHashMap().put(productId, amount);
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }


    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }
}