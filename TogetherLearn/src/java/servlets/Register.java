package servlets;

import controller.RegisterController;
import model.Users;
import java.io.IOException;
import java.io.PrintWriter;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
            //PelangganController.loginVerification(email, password);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
//            rd.forward(request, response);
            //bisa masukkin parameter
        } else {
            //PrintWriter out = response.getWriter();
            //out.println("<html><body><center><h2 style=\"color:red;\">Register Failed, please check your data!</h3></center></body></html>");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp?status=0");
            rd.include(request, response);
            //bisa masukkin parameter tapi harus pke get jadi linknya ...?...=...&...=...
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
