package controller;

import model.Student;
import model.StudentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/students")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    viewCreateForm(request, response);
                    break;
                case "update":
                    viewUpdateForm(request,response);
                    break;
                case "remove":
                    removeStudent(request,response);
                    break;
                default:
                    listStudent(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Set VNI cho du lieu khi post di
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createStudent(request, response);
                    break;
                case "update":
                    updateStudent(request, response);
                    break;
                case "search":
                    search(request,response);
                    break;
                default:
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Student> listAll = this.studentDAO.selectAll();
        request.setAttribute("listStudent", listAll);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/list.jsp");
        dispatcher.forward(request, response);
    }

    private void viewCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
        dispatcher.forward(request, response);
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOB = request.getParameter("dateOB");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String classroom = request.getParameter("classroom");
        String numberPhone = request.getParameter("numberPhone");
        Student student = new Student(id, name, dateOB, email, address, classroom, numberPhone);
        studentDAO.create(student);

        request.setAttribute("createMes", "New student was create");
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/create.jsp");
        dispatcher.forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        List<Student> student = studentDAO.findByName(name);
        request.setAttribute("student", student);

        RequestDispatcher dispatcher = request.getRequestDispatcher("student/search.jsp");
        dispatcher.forward(request, response);
    }


    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

                String name = request.getParameter("name");
        String dateOB = request.getParameter("dateOB");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String classroom = request.getParameter("classroom");
        String numberPhone = request.getParameter("numberPhone");

        Student student = new Student(id,name, dateOB, email, address, classroom, numberPhone);
        studentDAO.update(student);

        request.setAttribute("updateMes", "This student was updated");
        viewUpdateForm(request, response);
    }

    private void viewUpdateForm(HttpServletRequest request,HttpServletResponse response)
            throws SQLException, ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Student foundStudent = studentDAO.findById(id);
        request.setAttribute("student", foundStudent);

        RequestDispatcher dispatcher = request.getRequestDispatcher("student/update.jsp");
        dispatcher.forward(request, response);
    }


    private void removeStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentDAO.remove(id);

        request.setAttribute("removeMes", "The student was deleted");

        listStudent(request, response);
    }
}
