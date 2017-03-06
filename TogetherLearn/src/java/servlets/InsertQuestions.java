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
import model.Questions;
import model.Users;
import util.DataAkses;

/**
 *
 * @author Christian
 */
@WebServlet(name = "InsertQuestions", urlPatterns = {"/InsertQuestions"})
public class InsertQuestions extends HttpServlet {

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
            out.println("<title>Servlet InsertQuestions</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertQuestions at " + request.getContextPath() + "</h1>");
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
        DataAkses da = new DataAkses();
        
        Users u = da.getUser(request.getParameter("email"));
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
