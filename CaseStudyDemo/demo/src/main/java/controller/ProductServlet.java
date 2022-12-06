package controller;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    public void init(){
        productDAO = new ProductDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null){
        action ="";
    }
    try {
        switch (action){
            case "create":
                viewCreateForm(request,response);
                break;
            case "update":
                viewUpdateForm(request,response);
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            case "order":
                viewOrder(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    } catch (SQLException e){
        e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Set VNI cho du lieu khi post di
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "search":
                    search(request,response);
                    break;
                case "order":
                    order(request,response);
                    break;
                default:
                    break;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request,HttpServletResponse response)
            throws SQLException, ServletException,IOException{
        List<Product> listAll = this.productDAO.selectAll();
        request.setAttribute("listProduct",listAll);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request,response);
    }
    private void viewCreateForm(HttpServletRequest request,HttpServletResponse response)
            throws SQLException,ServletException,IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }
    private void createProduct(HttpServletRequest request,HttpServletResponse response)
        throws SQLException, ServletException,IOException{

        String id = request.getParameter("id");
        if(productDAO.findById(id) == null) {   //chi tao ra san pham moi khi id chua duoc su dung
            String name = request.getParameter("name");
            Double price = Double.parseDouble(request.getParameter("price"));
            Integer quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            Product product = new Product(id, name, price, quantity, image);
            productDAO.create(product);

            request.setAttribute("createMes", "New product was create");
        } else{
            request.setAttribute("createMes","This id was existed");
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }
    private void viewUpdateForm(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        //UpdateForm khac voi CreateFrom khi hien len thong tin cu de update
        String id = request.getParameter("id");
        Product foundProduct = productDAO.findById(id);
        request.setAttribute("product",foundProduct);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/update.jsp");
        dispatcher.forward(request,response);
    }
    private void updateProduct(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");
        Product updatedProduct = new Product(id,name,price,quantity,image);
        productDAO.update(updatedProduct);

        request.setAttribute("updateMes","This product was updated");
        viewUpdateForm(request,response);
    }
    private void removeProduct(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        String id = request.getParameter("id");
//        System.out.println(productDAO.remove(id));
        productDAO.remove(id);

        request.setAttribute("removeMes","The product was deleted");

        listProduct(request,response);
    }
    private void viewProduct(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        String id = request.getParameter("id");
        Product foundProduct = productDAO.findById(id);
        request.setAttribute("product",foundProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/view.jsp");
        dispatcher.forward(request,response);
    }
    private void search(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        String name = request.getParameter("name");
        List<Product> foundProduct = productDAO.findByName(name);
        request.setAttribute("product",foundProduct);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        dispatcher.forward(request,response);
    }

    private void viewOrder(HttpServletRequest request,HttpServletResponse response)
            throws SQLException,ServletException,IOException{

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/order.jsp");
        dispatcher.forward(request,response);
    }
    private void order(HttpServletRequest request,HttpServletResponse response)
        throws SQLException,ServletException,IOException{
        String id = request.getParameter("id");
        Integer amount = Integer.parseInt(request.getParameter("amount"));
        productDAO.order(id,amount);

        request.setAttribute("id",id);
        request.setAttribute("amount",amount);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/order.jsp");
        dispatcher.forward(request,response);
    }
}
