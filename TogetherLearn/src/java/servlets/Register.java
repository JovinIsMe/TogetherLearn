package servlets;

import controller.FileController;
import controller.RegisterController;
import java.io.File;
import model.Users;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DataAkses;

@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    //private final static String DEST = System.getProperty("user.dir") + "/web/ava";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        DataAkses da = new DataAkses();
        
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String retypeEmail = request.getParameter("retypeEmail");
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retypePassword");
        String avatar = request.getParameter("avatar");
        
        try {
            password = RegisterController.encryptPassword(password);
            retypePassword = RegisterController.encryptPassword(retypePassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Users u = new Users(name, email, password, avatar);
        
        if(email.equals((retypeEmail)) && password.equals(retypePassword) && da.register(u)){
            //FileController.copyFile(new File(avatar), new File(DEST)); //masih error get absoulte path dr input filenya
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp?status=0");
            rd.include(request, response);
        }
    }
}
