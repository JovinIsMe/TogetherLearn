<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page import="model.Answers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Questions"%>
<%@page import="util.DataAkses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Discuss"/>
        </jsp:include>
        <%
            String email = "";
            Long userId = Long.MIN_VALUE;
            boolean loggedin = false;
            if (!(session.getAttribute("userId") == null || session.getAttribute("userId").equals(""))) {
                loggedin = true;
                email = (String) session.getAttribute("email");
                userId = Long.parseLong(session.getAttribute("userId") + "");
            }
        %>
        <style>
            .mainBody{
                margin-left: 18%;
                margin-right: 18%;
            }
            .inside{
                background-color:white;
                margin-left:28%;
                padding-top: 1%;
                border: solid;
            }
            #photo{
                margin-left:60%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class='mainBody'>
            <h2>Q&A Discussions</h2>

            <div class="row">
                <div class="col-lg-2">
                    <div class="input-group">
                        <a href="newQuestion.jsp?email=<%=email%>">
                            <button type="submit" class="btn btn-info">NEW QUESTION</button>
                        </a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <form action="#" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" name="search" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-info" aria-label="Left Align" >
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>


            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="discuss.jsp?ordering=MostRecent">Most Recent</a></li>
                <li role="presentation"><a href="discuss.jsp?ordering=MostUpvote">Most Upvote</a></li>
                <li role="presentation"><a href="discuss.jsp?ordering=MostAnswered">Most Answered</a></li>
                <li role="presentation"><a href="discuss.jsp?ordering=Unanswered">Unanswered</a></li>
                <li role="presentation"><a href="discuss.jsp?ordering=MyQuestions">My Questions</a></li>
                <li role="presentation"><a href="discuss.jsp?ordering=MyAnswers">My Answers</a></li>
            </ul>
            <%
                DataAkses da = new DataAkses();
                //out.println("USER ID : " + session.getAttribute("userId").toString());
                //out.println("Email ID: " + session.getAttribute("email").toString());
                String output = request.getParameter("search");
                if (output == null || output.equals("")) {
                    out.println("");
                } else {
                    out.println("<h3>Result for " + output + ", " + da.getSearched(output).size() + " found</h3>");
                    for (Questions q : da.getSearched(output)) {
                        out.println("<div style='background-color:#f5f5f5'><hr>");
                        out.println("<h2><a href=\"viewQuestion.jsp?question_id=" + q.getQuestionId() + "\" style='margin-left:2%'>" + q.getTitle() + "</a></h2>");
                        out.println("<h4 style='margin-left:2%'>" + q.getMessage() + "</h5>");
                        String tags[] = q.getTag().split(",");
                        for (int idx = 0; idx < tags.length; idx++) {
                            out.println("<form action='#' method='post'><button type='submit' name='search' value='"+ tags[idx] +"' class='btn btn-info' style='margin-left:4%'>" + tags[idx] + "</button></form>");
                        }
                        try {
                            Long uid = q.getUsers().getUserId();
                            Users user = da.getUser(uid);
                            System.out.println(user.getName());
                            out.println("<h4 style='margin-left:2%'>From : " + user.getName() + "</h5>");
                        } catch (Exception ex) {}
                        out.println("<hr><h4 style='margin-left:5%'>Votes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer</h4>");
                        out.println("<h4 style='margin-left:5%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + da.getSumQuestionVote(q.getQuestionId()) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + da.getAnswers(q.getQuestionId()).size() + "</h4>");
                        out.println("<hr></div>");
                    }
                    out.println("<hr>");
                }

            %>
            <h3>Trending Posts</h3>

            <%                
                List<Questions> questions;
                String param = request.getParameter("ordering") + "";
                if (param.equals("MostUpvote")) {
                    questions = da.getAllQuestions();
                } else if (param.equals("MostAnswered")) {
                    questions = da.getAllQuestions();
                } else if (param.equals("Unanswered")) {
                    questions = da.getUnanswered();
                } else if (param.equals("MyQuestions") && loggedin) {
                    questions = da.getMyQuestions(userId);
                } else if (param.equals("MyAnswers") && loggedin) {
                    questions = da.getMyAnswers(userId);
                } else {
                    questions = da.getAllQuestions();
                }

                for (Questions q : questions) {
                    out.println("<div style='background-color:#f5f5f5'><hr>");
                    out.println("<h2><a href=\"viewQuestion.jsp?question_id=" + q.getQuestionId() + "\" style='margin-left:2%'>" + q.getTitle() + "</a></h2>");
                    String tags[] = q.getTag().split(",");
                    for (int idx = 0; idx < tags.length; idx++) {
                        out.println("<form action='#' method='post'><button type='submit' name='search' value='"+ tags[idx] +"' class='btn btn-info' style='margin-left:4%'>" + tags[idx] + "</button></form>");
                    }
                    try {
                        Long uid = q.getUsers().getUserId();
                        Users user = da.getUser(uid);
                        System.out.println(user.getName());
                        out.println("<h4 style='margin-left:2%'>From : " + user.getName() + "</h5>");
                        out.println("<h4 style='margin-left:2%'>Posted on : " + q.getTime() + "</h5>");

                        //out.println("<img src='"+user.getAvatar()+"' class='courseIcon'>");
                    } catch (Exception ex) {
                    }

                    out.println("<hr><h4 style='margin-left:5%'>Votes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer</h4>");
                    out.println("<h4 style='margin-left:5%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + da.getSumQuestionVote(q.getQuestionId()) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + da.getAnswers(q.getQuestionId()).size() + "</h4>");
                    out.println("<br><hr></div>");
                }
            %>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
