<%-- 
    Document   : test
    Created on : 4 Nov, 2022, 4:43:55 PM
    Author     : Asus
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
    Date dateBefore = sdf.parse("2022-11-14");
    Date dateAfter = sdf.parse("2022-11-16");

// Calculate the number of days between dates
    long timeDiff = Math.abs(dateAfter.getTime() - dateBefore.getTime());
    long daysDiff = TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS);
   out.println("The number of days between dates: " + daysDiff);            

        %>
        
        
        
    </body>
</html>
