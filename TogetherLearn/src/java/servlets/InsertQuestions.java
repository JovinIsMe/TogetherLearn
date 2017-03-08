package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Questions;
import model.Users;
import static servlets.Login.session;
import util.DataAkses;

@WebServlet(name = "InsertQuestions", urlPatterns = {"/InsertQuestions"})
public class InsertQuestions extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataAkses da = new DataAkses();
        
        Users u = new Users();
        u = da.getUser((String) session.getAttribute("email"));
        String email = u.getEmail();
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        String tag = request.getParameter("tag");
        
        
        Questions baru = new Questions();
        baru.setUsers(u);
        baru.setMessage(message);
        baru.setTitle(title);
        baru.setTime(new Date());
        baru.setTag(tag);
        baru.setQuestionId((long) new Date().getTime());
        
        if(da.newQuestion(baru)){
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
        }else{
            PrintWriter out = response.getWriter();
            out.println("<html><body><center><h2 style=\"color:red;\">Register Failed, please check your data!</h3></center></body></html>");
        }
    }
}
