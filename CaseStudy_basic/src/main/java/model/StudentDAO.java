package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/basic_case";
    private String jdbcUserName = "root";
    private String jdbcPassword = "votinh9$";
    private static final String SELECT_ALL_STUDENT_SQL ="select*from students;";
    private static final String FIND_BY_ID_SQL = "SELECT * FROM students WHERE id =?;";
    private static final String FIND_BY_NAME_SQL = "SELECT * FROM students WHERE `Name` =?;";
    private static final String ADD_STUDENT_SQL = "insert into students(`id`,`Name`,`Date of Birth`,Email,Address,Classroom,`Number Phone`) values(?,?,?,?,?,?,?);";
    private static final String UPDATE_STUDENT_SQL = "update students set `Name`=?,`Date of Birth`=?,Email=?,Address=?,Classroom = ?,`Number Phone`=? where `id` = ?;";
    private static final String DELETE_STUDENT_SQL = "DELETE FROM students WHERE id = ?;";


    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
        } catch (SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    public List<Student> selectAll() {
        List<Student> list = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_STUDENT_SQL);) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {  //lấy data tu database
                int id = rs.getInt("id");
                String name = rs.getString("Name");
                String dateOB = rs.getString("Date of Birth");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                String classroom = rs.getString("Classroom");
                String numberPhone = rs.getString("Number Phone");
                list.add(new Student(id,name,dateOB,email,address,classroom,numberPhone));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }


    public void create(Student student) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(ADD_STUDENT_SQL);) {
//        Statement là một trong 3 loại interace hỗ trợ thực thi câu lệnh truy vấn sử dụng SQL tĩnh, dùng một lần
            statement.setInt(1,student.getId());
            statement.setString(2, student.getName());
            statement.setString(3, student.getDateOB());
            statement.setString(4, student.getEmail());
            statement.setString(5, student.getAddress());
            statement.setString(6, student.getClassroom());
            statement.setString(7, student.getNumberPhone());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        public void update(Student student) {
            try(Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_SQL);){
                statement.setInt(7,student.getId());
                statement.setString(1,student.getName());
                statement.setString(2,student.getDateOB());
                statement.setString(3,student.getEmail());
                statement.setString(4,student.getAddress());
                statement.setString(5,student.getClassroom());
                statement.setString(6,student.getNumberPhone());

                statement.executeUpdate();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }

        public List<Student> findByName(String name) {
            List<Student> list = new ArrayList<>();
            try (Connection connection = getConnection();
                 PreparedStatement statement = connection.prepareStatement(FIND_BY_NAME_SQL);) {
                statement.setString(1, name);
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String fullname = rs.getString("Name");
                    String dateOB = rs.getString("Date of Birth");
                    String email = rs.getString("Email");
                    String address = rs.getString("Address");
                    String classroom = rs.getString("Classroom");
                    String numberPhone = rs.getString("Number Phone");
                    list.add(new Student(id,fullname,dateOB,email,address,classroom,numberPhone));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }


    public Student findById(int id) {
        Student student = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_BY_ID_SQL);) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String fullname = rs.getString("Name");
                String dateOB = rs.getString("Date of Birth");
                String email = rs.getString("Email");
                String address = rs.getString("Address");
                String classroom = rs.getString("Classroom");
                String numberPhone = rs.getString("Number Phone");
                student = new Student(id,fullname,dateOB,email,address,classroom,numberPhone);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public boolean remove(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

}

