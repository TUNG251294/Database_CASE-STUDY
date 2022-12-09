package model;

public class Student {
    private int id;
    private String name;
    private String dateOB;
    private String email;
    private String address;
    private String classroom;
    private String numberPhone;

    public Student() {
    }

    public Student(int id, String name, String dateOB, String email, String address, String classroom, String numberPhone) {
        this.id = id;
        this.name = name;
        this.dateOB = dateOB;
        this.email = email;
        this.address = address;
        this.classroom = classroom;
        this.numberPhone = numberPhone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOB() {
        return dateOB;
    }

    public void setDateOB(String dateOB) {
        this.dateOB = dateOB;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }
}
