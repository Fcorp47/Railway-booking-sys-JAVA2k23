<%-- 
    Document   : menu
    Created on : 2 Oct, 2022, 10:36:56 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
</style>
    </head>
    <body>
        
<ul>
  <li><a class="active" href="Home.jsp">I - RAILS</a></li>
  
  <%
      HttpSession s = request.getSession();
      if(session.getAttribute("User") == null){%>
  <li><a href="Login.jsp">Login</a></li>
  <% }else{ %>
  <li><a href="lastbookticket.jsp">Welcome <% out.print(s.getAttribute("User")+" "+s.getAttribute("Lname")); %></a></li>
   <li><a href="logout.jsp">Logout</a></li>
   
  <% } %>
   
  
  <li><a href="Register.jsp">Register</a></li>
  <li><a href="404.html">Meals</a></li>
  <li><a href="404.html">Contact Us</a></li>
 
</ul>
        
    </body>
</html>
