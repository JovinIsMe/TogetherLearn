package servlets;

import controller.RegisterController;
import java.io.IOException;
import java.io.PrintWriter;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            password = RegisterController.encryptPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        DataAkses da = new DataAkses();
        System.out.println(email);
        System.out.println(password);

        Users u = new Users();
        u = da.login(email, password);

        if (u == null || u.getName().isEmpty()) {
            System.out.println("Sorry, you are not registered!");
//            PrintWriter out = response.getWriter();
//            out.println("<html><body><center><h2 style=\"color:red;\">Login Failed, please check again!</h3></center></body></html>");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp?status=0");
            rd.include(request, response);
        } else {
            session.setAttribute("email", email);
            RequestDispatcher rd = request.getRequestDispatcher("discuss.jsp");
            rd.include(request, response);
            System.out.println("You are registered!");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
