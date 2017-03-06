<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Login"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <h2 style='margin-left:40%' class="col-sm-10">Sign In</h2>
        <div style='margin-left: 10%'>
        <form class="form-horizontal" action="Login" method="POST">
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">Email</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-4">
                    <div class="checkbox">
                        <label for="rememberMe">
                            <input type="checkbox" name="rememberMe">Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-4">
                    <input type="button" class="btn btn-primary" onclick="location.href = 'register.jsp';" value="Register" />
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
            
        </form>
        </div>
        <%
            String status = request.getParameter("status");
            if (status != null) {
                if (status.equals("0")) {
        %>
    <center><p style='color:red'>Login failed, please check your username and password !</p></center>
        <%
                }
            }
        %>
        <jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
