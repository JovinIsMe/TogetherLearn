<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Register"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <h1 style='margin-left:40%' class="">Register</h1>

    
        <div style='margin-left: 10%;margin-top:2%'>
        <form class="form-horizontal" action="Register" method="POST">
            
            <div class="form-group">
                <label for="fullName" class="col-sm-4 control-label">Full Name</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">Email address</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="retypeEmail"  class="col-sm-4 control-label">Re-type email</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" id="retypeEmail" name="retypeEmail" placeholder="Confirm Email" required>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-4 control-label">Password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>
            </div>
            <div class="form-group">
                <label for="retypePassword" class="col-sm-4 control-label">Re-type password</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="retypePassword" name="retypePassword" placeholder="Confirm Password" required>
                </div>
            </div>
            <div class="form-group">
                <label for="avatar" class="col-sm-4 control-label">Avatar</label>
                <div class="col-sm-4">
                    <input type="file" class="" id="avatar" name="avatar" accept="image/*" required>
                    <p class="help-block">Upload your profile picture</p>
                </div>
            </div>
            
            <div class="form-group">
                <label for="submit" class="col-sm-4 control-label"></label>
                <div class="col-sm-4">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
            
            

        </form>
            
        </div>
        <%
            String status = request.getParameter("status");
            if (status != null) {
                if (status.equals("0")) {
        %>
    <center><p style='color:red'>Register failed, please check your data !</p></center>
        <%
                }
            }
        %>
        <jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
