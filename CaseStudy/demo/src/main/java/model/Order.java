package model;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class Order {
    private int id;
    private Timestamp purchaseDate;
    private double totalPrice;
    private static int count = 0;

    public Order() {
    }

    public Order(int id) {
        this.id = ++count;
    }

    public int getId() {
        return id;
    }


    public Timestamp getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Timestamp purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
