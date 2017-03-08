package servlets;

import controller.RegisterController;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;
import util.DataAkses;

@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        String oriEmail = request.getParameter("oriEmail");
        System.out.println("ORI EMAIL" + oriEmail);
            
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String password = "a";
        String retypePassword = "b";
        try {
            password = RegisterController.encryptPassword(request.getParameter("NewPassword"));
            retypePassword = RegisterController.encryptPassword(request.getParameter("ConfirmPassword"));
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        String avatar = request.getParameter("avatar");
        PrintWriter out = response.getWriter();
        if(!(password.equals("") || retypePassword.equals("")) && password.equals(retypePassword)){
            Users u = new Users(name, email, password, avatar);
            u.setUserId(new DataAkses().getUser(oriEmail).getUserId());
            new DataAkses().updateProfile(u);
                out.println("<html>Saved</html>");
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                rd.include(request, response);
            
        } else {
            out.println("Failed");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
        }
    }
}
