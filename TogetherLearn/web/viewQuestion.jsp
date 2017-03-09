<%-- 
    Document   : viewQuestion
    Created on : Mar 9, 2017, 12:49:31 AM
    Author     : Filipus
--%>

<%@page import="model.Answers"%>
<%@page import="model.Users"%>
<%@page import="util.DataAkses"%>
<%@page import="model.Questions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="View Question"/>
        </jsp:include>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String email = request.getParameter("email");
        %>
        <style>
            .mainBody{
                margin-left: 18%;
                margin-right: 18%;
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp" flush="true"/>
        <div class="mainBody">
            <%
                if (session.getAttribute("userId") == null || session.getAttribute("userId").equals("")) {
                    RequestDispatcher rd = request.getRequestDispatcher("index.html");
                    rd.include(request, response);
                } else {

                    String que_id = request.getParameter("question_id");
                    System.out.println("QUESTION ID : " + que_id);
                    DataAkses da = new DataAkses();
                    Questions q = da.getQuestions(Long.parseLong((String) que_id));

                    out.println("<h2>" + q.getTitle() + "</h2>");
                    out.println("<h3>" + q.getMessage() + "</h2>");
                    String tags[] = q.getTag().split(", ");
                    for (int idx = 0; idx < tags.length; idx++) {
                        out.println("<button type='submit' class='btn btn-primary'>" + tags[idx] + "</button>");
                    }

                    out.println("<hr><h4>Asked by : " + q.getUsers().getName()+"</h4>");
                    out.println("<h4>Posted on : "+q.getTime()+"</h4>");

            %>
            <hr>
            <h3>Some already answered this questions :</h3>
            <%                int i = 1;
                for (Answers a : da.getAnswers(q.getQuestionId())) {
                    out.println("<div style='background-color:#f5f5f5'><hr>");
                    out.println("<h4 style='margin-left:2%;'>" + i + ". " + a.getContent() + "</h4>");
                    out.println("<h4 style='margin-left:2%;'>Answered by : " + a.getUsers().getName() + "</h4>");
                    out.println("<h4 style='margin-left:2%;'>Posted on : "+q.getTime()+"</h4>");

                    out.println("<hr></div>");
                    i++;
                }
            %>
            <hr>
            <h2>New Answer</h2>
            <div style='margin-left: 10%;margin-top:2%'>

                <form class="form-horizontal" action="InsertAnswers" method="POST">
                    <%//                        Users user = new DataAkses().getUser(request.getParameter("email"));
//                        out.println("<img src='" + user.getAvatar() + "' alt='profile_photo' class='courseIcon'>");
//                        out.println("<h2>" + user.getName() + "</h2>");
                        out.println("<img src='Icons/Courses/1068.png' alt='profile_photo' class='courseIcon'>");
                        out.println("<h2>User Name</h2>");
                    %>


                    <h3>Level : 1 - XP: 1000</h3>

                    <div class="form-group">
                        <label for="Title" style="margin-top:1%">Your Answer</label>
                        <div style="margin-top:3%">
                            <textarea class="form-control" rows="4" cols="50" name="answerMessage" id="message" placeholder="Write your answer here" required></textarea> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Title" class="col-sm-4 control-label"></label>
                        <div class="col-sm-4">

                            <button type="submit" class="btn btn-primary">Post Answer</button>
                        </div>
                    </div>
                    <input type="hidden" name="email" value="<%=email%>" id="email"/>
                    <input type="hidden" name="question" value="<%=que_id%>" id="email"/>
                </form>

            </div>
        </div>
        <%}%>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
