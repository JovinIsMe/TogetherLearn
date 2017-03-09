<%-- 
    Document   : Question
    Created on : Mar 6, 2017, 9:29:29 PM
    Author     : Christian
--%>

<%@page import="model.Answers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Questions"%>
<%@page import="util.DataAkses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Question"/>
        </jsp:include>
        
        <%
            String email = request.getParameter("email");
            long questionId = Long.parseLong(request.getParameter("questionId"));
            
            DataAkses da = new DataAkses();
            Questions q = da.getQuestions(questionId);
            ArrayList<Answers> a = new ArrayList();
            a = null;
            
            a = da.getAllAnswers(questionId);
        %>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="mainBody">
        <%
            out.println("<div style='background-color:#f5f5f5'><hr>");
            out.println("<h1 style='margin-left:2%'>"+q.getTitle()+"</h1>");
            //out.println("<h1>"+a.size()+"</h1>");
            out.println("<h5 style='margin-left:2%'>Message : " + q.getMessage() + "</h5>");
        %>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
