package servlets;

import controller.RegisterController;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import util.DataAkses;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    public static HttpSession session;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            password = RegisterController.encryptPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        DataAkses da = new DataAkses();

        Users u = new Users();
        u = da.login(email, password);
        
        if (u == null || u.getName().isEmpty()) {
            System.out.println("Sorry, you are not registered!");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp?status=0");
            rd.include(request, response);
        } else {
            String userId = u.getUserId()+"";
            session.setAttribute("userId", userId);
            session.setAttribute("email", email);
            RequestDispatcher rd = request.getRequestDispatcher("discuss.jsp");
            rd.include(request, response);
            System.out.println("You are registered!");
        }
    }
}
