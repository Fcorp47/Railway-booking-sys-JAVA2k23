<%-- 
    Document   : updatetrain
    Created on : 4 Nov, 2022, 1:08:33 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../../Source Packages/UpdateStack" method="POST">
        <input type="number" name="trainno" >
        <input type="number" name="txtstack">
        <select name="stacktype">
            
            <option value="AC 2 TIER">2AC</option>
            <option value="AC 3 TIER">3AC</option>
            <option value="Second Seating(2S)">SS</option>
            
        </select>
        <input type="submit" name="btnupdate">
        
    </form>
        
                
    </body>
</html>
