/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import static servlets.Login.session;
import util.DataAkses;

/**
 *
 * @author Filipus
 */
@WebServlet(name = "InsertAnswers", urlPatterns = {"/InsertAnswers"})
public class InsertAnswers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertAnswers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertAnswers at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        DataAkses da = new DataAkses();
        String email = request.getParameter("email");
        
        Users u = new Users();
        u = da.getUser((String) session.getAttribute("email"));
        
        //u = da.getUser(email);
        String question_id = request.getParameter("question");
        Questions q = da.getQuestions(Long.parseLong((String) question_id));
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
