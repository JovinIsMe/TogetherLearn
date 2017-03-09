<%-- 
    Document   : Question
    Created on : Mar 6, 2017, 9:29:29 PM
    Author     : Christian
--%>

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
        %>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
