<%-- 
    Document   : updatetrain
    Created on : 7 Nov, 2022, 8:12:41 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateStack" method="POST">
     enter trainno:   <input type="number" name="trainno" >
     enter noofcoaches   <input type="number" name="txtstack">
        <select name="stacktype">
            
            <option value="AC 2 TIER">2AC</option>
            <option value="AC 3 TIER">3AC</option>
            <option value="Second Seating(2S)">SS</option>
            
        </select>
        <input type="submit" name="btnupdate">
        
    </form>
        
    </body>
</html>
