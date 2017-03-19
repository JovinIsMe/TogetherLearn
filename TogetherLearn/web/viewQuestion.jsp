<%@page import="java.util.ArrayList"%>
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
                    Long userId = Long.parseLong(session.getAttribute("userId") + "");
                    Long que_id = Long.parseLong((String) request.getParameter("question_id"));
                    DataAkses da = new DataAkses();
                    Questions q = da.getQuestion(que_id);

                    out.println("<h2>" + q.getTitle() + "</h2>");
                    out.println("<h3>" + q.getMessage() + "</h2>");
                    out.println("<h3><button type='submit' class='btn btn-primary'>" + q.getTag() + "</button></h3>");

                    String vote = request.getParameter("vote") + "";
                    System.out.println("VOTE " + vote);
                    if (vote.equals("up") || vote.equals("down")) {
                        da.voteQuestion(que_id, userId, vote);
                    }
                    out.println("<hr><h4 style='margin-left:5%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + 0 + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + da.getAnswers(q.getQuestionId()).size() + "</h4>");
            %>

            <h4 style='margin-left:5%'>Votes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer</h4>
            <span class='input-group-btn'>
                <a href="viewQuestion.jsp?question_id=<%=que_id%>&vote=up" style='margin-top:2%;margin-left:5%;' class='btn btn-info' aria-label='Left Align' >
                    <span class='glyphicon glyphicon-plus' aria-hidden='true'/>
                </a>
                <a href="viewQuestion.jsp?question_id=<%=que_id%>&vote=down" style='margin-top:2%;margin-left:5%;' class='btn btn-info' aria-label='Left Align' >
                    <span class='glyphicon glyphicon-minus' aria-hidden='true'/>
                </a>
            </span>

            <%
                out.println("<hr><h4>Asked by : " + q.getUsers().getName());

                int i = 1;
                ArrayList<Answers> answer = da.getAnswers(q.getQuestionId());
                if (answer.size() > 0) {
                    out.println("<hr><h3>Someone already answered this question:</h3>");
                }
                for (Answers a : answer) {
                    out.println("<div style='background-color:#f5f5f5'><hr>");
                    out.println("<h4 style='margin-left:2%;'>" + i + ". " + a.getContent() + "</h4>");
                    out.println("<hr><h4>Answered by : " + a.getUsers().getName());
                    out.println("<hr></div>");
                    i++;
                }
            %>
            <hr>
            <h2>New Answer</h2>
            <div style='margin-left: 10%;margin-top:2%'>

                <form class="form-horizontal" action="InsertAnswers" method="POST">
                    <%
                        Users user = new DataAkses().getUser(userId);
                        out.println("<img src='" + user.getAvatar() + "' alt='profile_photo' class='courseIcon'>");
                        out.println("<h2>" + user.getName() + "</h2>");
                    %>

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
                    <input type="hidden" name="userId" value="<%=userId%>" id="email"/>
                    <input type="hidden" name="question" value="<%=que_id%>" id="email"/>
                </form>

            </div>
        </div>
        <%}%>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
