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
        <div class='mainBody'>
            <h2>Q&A Discussions</h2>

            <div class="row">
                <div class="col-lg-2">
                    <div class="input-group">
                        <a href="newQuestion.jsp?email=<%= email%>"
                           <button type="submit" class="btn btn-info">NEW QUESTION</button>
                        </a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-group">
                        <input type="search" class="form-control" id="search" placeholder="Search...">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-info" aria-label="Left Align">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </button>
                        </span>
                    </div>
                </div>
            </div>


            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="#">Most Recent</a></li>
                <li role="presentation"><a href="#">Most Upvote</a></li>
                <li role="presentation"><a href="#">Most Answered</a></li>
                <li role="presentation"><a href="#">Unanswered</a></li>
                <li role="presentation"><a href="#">My Questions</a></li>
                <li role="presentation"><a href="#">My Answers</a></li>
            </ul>

            <h3>Trending Posts</h3>

            <%
                DataAkses da = new DataAkses();

                for (Questions q : da.getAllQuestions()) {
                    out.println("<div style='background-color:#f5f5f5'><hr>");
                    out.println("<h4 style='margin-left:2%'>Title   : " + q.getTitle() + "</h5>");
                    out.println("<h4 style='margin-left:2%'>Message : " + q.getMessage() + "</h5>");
                    out.println("<button type='submit' class='btn btn-info' style='margin-left:4%'>" + q.getTag() + "</button>");
                    out.println("<hr></div>");
                }
            %>
            <ul>
                <li><a href="#">Python 3.7 Released</a></li>
                <li><a href="#">Utilising Arrow Keys in C++</a></li>
                <li><a href="#">How to convert .java into .apk?</a></li>
                <li><a href="#">How do you make a programming language?</a></li>
                <li><a href="#">Is it still relevant to put <!DOCTYPE html> at the beginning</a></li>
                <li><a href="#">Different between Python 2 and Python 3?</a></li>
                <li><a href="#">How to make header files</a></li>
                <li><a href="#">What do you know now that you wish you knew when you started</a></li>
                <li><a href="#">In Java when is it appropriate to use Array, ArrayList, and</a></li>
                <li><a href="#">Why do books and people normally use 'i' for 'for statement'</a></li>
            </ul>

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
