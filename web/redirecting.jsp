<%-- 
    Document   : redirecting
    Created on : 4 Nov, 2022, 12:51:18 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession s = request.getSession();
    s.setAttribute("pass", request.getParameter("pass"));
    s.setAttribute("age", request.getParameter("age"));
    s.setAttribute("gender", request.getParameter("gender"));
    s.setAttribute("seat_type", request.getParameter("seat_type"));
    
    response.sendRedirect("PaymentGateway.jsp");
    
%>