<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true">
            <jsp:param name="laman" value="TogetherLearn: Learn Together"/>
        </jsp:include>
    </head>
    <body>
        <div id="homeHeader">
            <div class="homeHeader">
                <div class="sandwichButton"></div>
                <div class="logo">
                    <a href="index.jsp">
                        <img src="img/TogetherLearn.png" width="300" alt="TogetherLearn" class="img-responsive" alt="Responsive image"/>
                    </a>
                </div>
                <div class="navigation-menu">
                    <ul class="Home">
                        <!-- Getting From DB -->
                        <li id="courses">
                            <a href="#">COURSES</a>
                        </li>
                        <li id="codes">
                            <a href="#">CODE PLAYGROUND</a>
                        </li>
                        <li id="discuss">
                            <a href="discuss.jsp">DISCUSS</a>
                        </li>
                        <li id="leaders">
                            <a href="#">TOP LEARNERS</a>
                        </li>
                        <li id="blogPage">
                            <a href="#">BLOG</a>
                        </li>
                        <%
                            if (session.getAttribute("email")==null || session.getAttribute("email").equals("")) {
                                out.println("<li role='presentation' class='signin'><a href='login.jsp'>SIGN IN</a></li>");
                            } else {
                                out.println("<li role='presentation' class='signin'><a href='profile.jsp'>PROFILE</a></li>");
                            }
                        %>
                    </ul>
                </div>
                <div class="slider">
                    <div class="slideText">
                        <span>
                            Learn to code for FREE!
                        </span>
                        <p>
                            Free, fun, effective learning - what can be better?
                        </p>
                    </div>
                    <a href="/Courses/">Start Learning Now</a>
                </div>
            </div>
        </div>

        <div class="storesOutline wrapper Android">
            <a href="https://play.google.com/store/apps/developer?id=TogetherLearn" target="_blank" class="learnOnAndroid">
                <div class="homeGooglePlay"></div>
            </a>
            <a href="https://itunes.apple.com/us/developer/togetherlearn-inc/id933957049" target="_blank" class="learnOnIOS">
                <div class="homeAppStore"></div>
            </a>
            <a href="https://www.microsoft.com/en-us/store/search/apps?q=togetherlearn+inc" target="_blank" class="learnOnWP">
                <div class="homeWindowsStore"></div>
            </a>
            <a href="/Courses/" target="_blank" class="learnOnWeb">
                <div class="homeWeb"></div>
            </a>
        </div>

        <div class="homeCourseContent wrapper">
            <div class="courseItem block noPadding" data-category="">
                <a href="/Course/CPlusPlus/">
                    <img src="Icons/Courses/1051.png" alt="C++ Tutorial" class="courseIcon">
                    <div class="courseDescription">
                        <div>C++ Tutorial</div>
                        <p>
                            Our C++ tutorial covers basic concepts, data types, arrays, pointers, conditional statements, loops, functions, classes, objects, inheritance, and polymorphism.
                        </p>
                    </div>
                </a>
                <div class="courseStores">
                    <a href="/Play/CPlusPlus/">Take This Course</a>
                </div>
            </div>
            <div class="courseItem block noPadding" data-category="">
                <a href="/Course/Java/">
                    <img src="Icons/Courses/1068.png" alt="Java Tutorial" class="courseIcon">
                    <div class="courseDescription">
                        <div>Java Tutorial</div>
                        <p>
                            With our interactive Java course, you?ll learn object-oriented Java programming and have the ability to write clear and valid code in almost no time at all.
                        </p>
                    </div>
                </a>
                <div class="courseStores">
                    <a href="/Play/Java/">Take This Course</a>
                </div>
            </div>
            <div class="courseItem block noPadding" data-category="">
                <a href="/Course/Python/">
                    <img src="Icons/Courses/1073.png" alt="Python 3 Tutorial" class="courseIcon">
                    <div class="courseDescription">
                        <div>Python 3 Tutorial</div>
                        <p>
                            Learn Python, one of today&#39;s most in-demand programming languages on-the-go! Practice writing Python code, collect points, &amp; show off your skills now!
                        </p>
                    </div>
                </a>
                <div class="courseStores">
                    <a href="/Play/Python/">Take This Course</a>
                </div>
            </div>

            <a href="/Courses/" class="viewAll">View All Our Courses</a>
        </div>

        <div id="storeInfo">
            <div class="storeInfoContent">
                <div class="usersInfo">
                    <div>
                        <p>
                            <span>14,313,035</span>
                            Learners
                        </p>
                        <p>
                            <span>940</span>
                            Lessons
                        </p>
                    </div>
                    <div>

                        <p>
                            <span>6222</span>
                            Quizzes
                        </p>
                    </div>
                </div>
                <div class="topInfo">
                    <div class="phoneImg">
                        <img src="Images/devices.png" alt="Phone">
                    </div>
                    <div class="mainInfo">
                        <div class="infoTitle">
                            <span>
                                Available Anytime & Anywhere for FREE!
                            </span>
                            <p>
                                Learn on the web and on the go.
                                <br />Available on all major devices and platforms. 
                                <br />Always pick up where you left off. 
                                <br />More simple and enjoyable than ever!
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div id="reviews">
            <div class="reviewTitle">
                <p>YOU ARE IN GOOD COMPANY.</p>
                <span>Over <span> 14,000,000 </span> learners all over the world use our apps on all types of devices.</span>
            </div>
            <div class="socialIcons">
                <a href="http://www.facebook.com/TogetherLearn/" class="facebook" target="_blank"></a>
                <a href="https://twitter.com/TogetherLearn/" class="twitter" target="_blank"></a>
                <a href="https://plus.google.com/+Togetherlearn/" class="googleplus" target="_blank"></a>
            </div>
            <div class="reviewsContent">
                <div class="review left">
                    <div class="reviewText">
                        <p>
                            Probably the best way to use my phone. This is a revolutionary way to learn code. The comments on each question/section adds a real world perspective.
                        </p>
                    </div>
                    <div class="reviewInfo">
                        <img src="Images/1MatWatson.jpg" alt="Mat Watson " class="reviewUserAvatar">
                        <div class="reviewUser">
                            <span class="reviewUserName">Mat Watson </span>
                            <div class="reviewUserLoaction">
                                <span>Python</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="review right">
                    <div class="reviewText">
                        <p>
                            Appreciations! Superb application with step-by-step teaching. You are making a lot of impacts especially in Ghana, Africa. I couldn't afford the university to learn to code. Thanks so much. Keep it up.
                        </p>
                    </div>
                    <div class="reviewInfo">
                        <img src="Images/3OdjerOnline.jpg" alt="Odjer Online " class="reviewUserAvatar">
                        <div class="reviewUser">
                            <span class="reviewUserName">Odjer Online </span>
                            <div class="reviewUserLoaction">
                                <span>Java</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="review center">
                    <div class="reviewText">
                        <p>
                            Wow... I mean... WOW! Boys and girls, just go for it... I mean, it's just so simple, so pretty and we'll organized. I've been looking for free, self learning tools all over for all kinds of stuff and this is by far, the best one. Just too good! And by the way, the community is there, always, to help.
                        </p>
                    </div>
                    <div class="reviewInfo">
                        <img src="Images/2NevileRuas.jpg" alt="Nevile Ruas " class="reviewUserAvatar">
                        <div class="reviewUser">
                            <span class="reviewUserName">Nevile Ruas </span>
                            <div class="reviewUserLoaction">
                                <span>HTML</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="socialElements">
            <div class="socialContent">
                <p class="socialTitle">
                    Become a member of our growing community!
                </p>
                <a href="/Courses/" class="reviewStart">Start Learning Now</a>

            </div>
        </div>

        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
