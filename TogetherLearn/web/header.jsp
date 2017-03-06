<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="header">
    <div class="header wrapper">
        <div class="sandwichButton"></div>
        <div class="logo">
            <a href="index.jsp">
                <img src="img/TogetherLearn.png" width="350" alt="TogetherLearn" class="img-responsive" alt="Responsive image"/>
            </a>
        </div>
        <div class="navigation-menu">
            <ul class="User">
                <!-- Getting From DB -->
                <li id="courses">
                    <a href="#">COURSES</a>
                </li>
                <li id="codes">
                    <a href="#">CODE PLAYGROUND</a>
                </li>
                <li id="discuss">
                    <a href="discuss.jsp" value="discuss">DISCUSS</a>
                </li>
                <li id="leaders">
                    <a href="#">TOP LEARNERS</a>
                </li>
                <li id="blogPage">
                    <a href="#">BLOG</a>
                </li>
                <%
                    if (session.getAttribute("email") == null || session.getAttribute("email").equals("")) {
                        out.println(
                                "<li role='presentation' class='signin'><a href='login.jsp'>SIGN IN</a></li>");
                    } else {
                        out.println("<li role='presentation' class='signin'><a href='profile.jsp'>PROFILE</a></li>");
                    }
                %>
            </ul>
        </div>
    </div>
</div>