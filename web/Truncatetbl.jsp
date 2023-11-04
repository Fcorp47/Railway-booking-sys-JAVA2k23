<%-- 
    Document   : Truncatetbl
    Created on : 7 Nov, 2022, 9:02:36 PM
    Author     : Asus
--%>

<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        UserDAO objdao = new UserDAO();
        int i = objdao.truncateAll();
        
        %>
    </body>
</html>
