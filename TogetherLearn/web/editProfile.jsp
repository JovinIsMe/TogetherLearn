<%@page import="util.DataAkses"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Edit Profile"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <%
            if(session.getAttribute("userId") == null || session.getAttribute("userId").equals("")){
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
            } else {
                Users user = new Users();
                user = new DataAkses().getUser(Long.parseLong((String) session.getAttribute("userId")));
        %>
        <div class="loginOutline block">
            <h1 class="loginTitle">
                Edit Profile
            </h1>
            <div id="uploadAvatar">
                <div class="imageBox" style="background-image: url(&quot;<%=user.getAvatar()%>&quot;); background-size: 180px 180px; background-position: 0px 0px; background-repeat: no-repeat;">
                    <div class="thumbBox"></div>
                </div>
                <div class="primary">
                    <div class="setAvatar">
                        Set Avatar
                        <input type="file" name="avatar" class="chooseFile" value="Choose">
                    </div>
                    <div class="removeAvatar">Remove</div>
                </div>
            </div>
            <section id="loginForm">
                <form action="EditProfile" method="POST">
                    <input type="hidden" name="oriEmail" value="<%=session.getAttribute("email")%>"/>
                    <div class="materialInput">
                        <input pattern=".{3,100}" id="Email" name="Email" type="text" value="<%=user.getEmail()%>">
                        <label for="Email" style="display: none;">Email</label>
                        <div class="cursor"></div>
                        <div class="underline"></div>
                        <div class="focusedUnderline"></div>
                    </div>
                    <span class="field-validation-valid text-danger"></span>
                    <div class="materialInput">
                        <input pattern=".{3,100}" id="Name" name="Name" type="text" value="<%=user.getName()%>">
                        <label for="Name" style="display: none;">Name</label>
                        <div class="cursor"></div>
                        <div class="underline"></div>
                        <div class="focusedUnderline"></div>
                    </div>
                    <span class="field-validation-valid text-danger"></span>
                    <div class="materialCheckbox checkbox">
                        <input id="ChangePassword" name="ChangePassword" type="checkbox" value="true">
                        <input name="ChangePassword" type="hidden" value="false">
                        <div class="icon">
                            <div class="outline"></div>
                            <div class="fill"></div>
                        </div>
                        <label for="ChangePassword">Change Password</label>
                    </div>
                    <div class="changePasswordBody" style="">
                        <div class="materialInput">
                            <input pattern=".{6,15}" id="NewPassword" name="NewPassword" type="password">
                            <label for="NewPassword" style="display: inline;">New password</label>
                            <div class="cursor"></div>
                            <div class="underline"></div>
                            <div class="focusedUnderline"></div>
                        </div>
                        <span class="field-validation-valid text-danger"></span>

                        <div class="materialInput">
                            <input pattern=".{6,15}" id="ConfirmPassword" name="ConfirmPassword" type="password">
                            <label for="ConfirmPassword" style="display: inline;">Confirm new password</label>
                            <div class="cursor"></div>
                            <div class="underline"></div>
                            <div class="focusedUnderline"></div>
                        </div>
                        <span class="field-validation-valid text-danger"></span>
                    </div>
                    <input id="IsAvatarRemoved" name="IsAvatarRemoved" type="hidden" value="False">
                    <div class="formActions">
                        <a href="profile.jsp" class="materialButton elevated">
                            Cancel
                        </a>
                        <button type="submit" class="materialButton primary elevated">
                            Save
                        </button>
                    </div>
                </form>
            </section>
        </div>
        <%}%>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
