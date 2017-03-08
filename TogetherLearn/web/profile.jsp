<%@page import="util.DataAkses"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="Profile"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <%
            if (session.getAttribute("email")==null || session.getAttribute("email").equals("")) {
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
            } else {
                Users user = new Users();
                user = new DataAkses().getUser((String) session.getAttribute("email"));
        %>
        <div class="block">
            <div class="userProfile  current">
            <div class="user">        
                <div class="avatar">
                    <img src="<%=user.getAvatar()%>" alt="<%=user.getName()%>" />
                </div>
                <div class="details">
                    <h1 class="name ">
                        <%=user.getEmail()%>
                    </h1>
                    <%--<div class="detail">
                        <div>
                            <label>Level</label>
                            8
                        </div>
                            <div>
                                <span>3273 XP</span>
                            </div>
                    </div>--%>            
                        <a class="materialButton elevated" href="logout.jsp">Sign out</a>
                        <a class="materialButton primary elevated" href="editProfile.jsp">Edit Profile</a>
                </div>
                <div class="socialOutline">

                    <div class="facebookShare">
                        <div class="fb-share-button" data-href="https://www.togetherlearn.com/profile/3494319/" data-layout="button_count"></div>
                    </div>
                    <div class="googleplusShare">
                        <div class="g-plusone" data-size="medium" data-href="https://www.togetherlearn.com/profile/3494319/"></div>
                    </div>
                    <div class="twitterShare">
                        <a class="twitter-share-button"
                           href="https://twitter.com/share"
                           data-url="https://www.togetherlearn.com/profile/3494319/"
                           data-via="TogetherLearn">
                            Tweet
                        </a>
                    </div>
                </div>        
            </div>
        </div>
        <hr/>
        <%}%>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
