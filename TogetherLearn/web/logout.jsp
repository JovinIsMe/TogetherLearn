<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            session.setAttribute("email", null);
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
