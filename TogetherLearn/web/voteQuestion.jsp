<%-- 
    Document   : voteQuestion
    Created on : Mar 6, 2017, 9:45:01 PM
    Author     : Christian
--%>

<%@page import="util.DataAkses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   long e = Long.parseLong(request.getParameter("user_id"));
   long q = Long.parseLong(request.getParameter("questionId"));
   DataAkses da = new DataAkses();
    int indi = da.VotedQuestion(e, q);
%>

<div id="button">
    <a href=""
       <button type="submit" class="btn btn-info">+1</button>
    </a>
    <%
       // if (indi == 0) {
    %>
    <a href=""
       <button type="submit" class="btn btn-info">+1</button>
    </a>
    <a href=""
       <button type="submit" class="btn btn-info">-1</button>
    </a>
    <%
   // } else {
      //  if (indi == 1) {
    %>
    <a href=""
       <button type="submit" class="btn btn-info">0</button>
    </a>
    <a href=""
       <button type="submit" class="btn btn-info">-1</button>
    </a>
    <%
    //} else {
    %>
    <a href=""
       <button type="submit" class="btn btn-info">+1</button>
    </a>
    <a href=""
       <button type="submit" class="btn btn-info">0</button>
    </a>
    <%
           // }
      //  }
    %>
</div>

