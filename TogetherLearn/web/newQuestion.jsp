<%-- 
    Document   : newQuestion
    Created on : Feb 21, 2017, 9:24:27 PM
    Author     : Christian
--%>

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

        <!--        <form class="col-sm-10" action="InsertQuestions" method="POST">
                    <div class="form-group">
                        <label for="Title" class="col-sm-4 control-label">Title</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="title" id="title" placeholder="title" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Title" class="col-sm-4 control-label">Message</label>
                        <div class="col-sm-4">
                            <textarea rows="4" cols="50" class="col-sm-10 control-label" name="message" id="message" placeholder="message" required>
                                
                            </textarea> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Title" class="col-sm-4 control-label">Tags</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="tag" id="tag" placeholder="tag" required>
                        </div>
                    </div>
                    <input type="hidden" name="email" value="<%=email%>" id="email"/>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-4">
                            <button type="submit" class="btn btn-default">Sign in</button>
                        </div>
                    </div>
                    
                </form>-->
<!--        <div style='margin-left: 40%'>
            <form action="InsertQuestions" method="POST" >
                <div class="form-group">
                    <label for="Title" class="col-sm-12 control-label">Title</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="title" id="title" placeholder="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-12 control-label">Message</label>
                    <div class="col-sm-4">
                        <textarea rows="4" cols="50" class="col-sm-10 control-label" name="message" id="message" placeholder="message" required>    
                        </textarea> 
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-12 control-label">Tags</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="tag" id="tag" placeholder="tag" required>
                    </div>
                </div>
                <input type="hidden" name="email" value="<%=email%>" id="email"/>
                <br><br>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-default">Post It!</button>
                    </div>
                </div>
            </form>
        </div>
        -->
            
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
                        <textarea rows="4" cols="50" class="col-sm-10 control-label" name="message" id="message" placeholder="message" required>    
                        </textarea> 
                    </div>
                </div>
                <div class="form-group">
                    <label for="Title" class="col-sm-4 control-label">Tags</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="tag" id="tag" placeholder="tag" required>
                        <button type="submit" class="btn btn-default">Post It!</button>
                    </div>
                </div>
                <input type="hidden" name="email" value="<%=email%>" id="email"/>
        </form>
            
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
    
</html>
