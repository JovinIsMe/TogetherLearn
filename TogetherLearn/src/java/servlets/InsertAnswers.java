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
import model.Answers;
import model.Questions;
import model.Users;
import util.DataAkses;

@WebServlet(name = "InsertAnswers", urlPatterns = {"/InsertAnswers"})
public class InsertAnswers extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        DataAkses da = new DataAkses();
        Long userId = Long.parseLong(request.getParameter("userId"));
        
        Users u = new Users();
        u = da.getUser(userId);
        String question_id = request.getParameter("question");
        Questions q = da.getQuestion(Long.parseLong((String) question_id));
        String message = request.getParameter("answerMessage");

        Answers answer = new Answers();
        answer.setUsers(u);
        answer.setContent(message);
        answer.setQuestions(q);
        answer.setTime(new Date());
        answer.setAnswerId((long) new Date().getTime());
        PrintWriter out = response.getWriter();
        
        if(da.newAnswer(answer)){
            response.sendRedirect("discuss.jsp");
           
        }
    }
}
