<%-- 
    Document   : logout
    Created on : 5 Oct, 2022, 11:11:11 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <script>  
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
</script>
<%  
   
    response.setHeader("Cache-Control","no cache, no-store, must-revalidate");
            session.invalidate();  
            
            out.print("You are successfully logged out!");  
            response.sendRedirect("Home.jsp");
           
%>
