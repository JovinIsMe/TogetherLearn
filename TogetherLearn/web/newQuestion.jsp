<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Discuss"/>
        </jsp:include>
        <%
            String email = request.getParameter("email");
            
        %>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <%
            if(session.getAttribute("userId")== null || session.getAttribute("userId").equals("")){
                //RequestDispatcher rd = request.getRequestDispatcher("discuss.jsp");
                //rd.forward(request, response);
                response.sendRedirect("discuss.jsp");
            }
        %>
        <div style='margin-left: 10%;margin-top:2%'>
        <form class="form-horizontal" action="InsertQuestions" method="POST">
            
            <div class="form-group">
                    <label for="Title" class="col-sm-4 control-label">Title</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="title" id="title" placeholder="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-4 control-label">Message</label>
                    <div class="col-sm-4">
                        <textarea class="form-control" rows="4" cols="50" name="message" id="message" placeholder="message" required></textarea> 
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-4 control-label">Tags</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="tag" id="tag" placeholder="tag" required>
                        <button type="submit" class="btn btn-primary">Post</button>
                    </div>
                </div>
                <input type="hidden" name="email" value="<%=email%>" id="email"/>

        </form>
            
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
    
</html>
