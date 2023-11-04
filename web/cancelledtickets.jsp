<%-- 
    Document   : lastbookticket
    Created on : 8 Nov, 2022, 1:34:15 PM
    Author     : Asus
--%>
<%@page import="com.RTS.Model.TicketModel"%>
<%@page import="java.util.List"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<jsp:include page="menu.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
      <style>
          
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width:70%;
}

#customers td, #customers th {
  border: 0px solid #ddd;
  padding: 8px;

}

#customers td {
      height: 70px;
}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: black;
  color: white;
}

table { box-shadow:4px 5px 5px #999; 

        width: 100%;                    
}

</style>

    <center>
<h1> Last Transaction Details </h1>
<h2><a href="lastbookticket.jsp">Go back</a></h2>
</center>
<%
    
    HttpSession s = request.getSession();
    UserDAO objdao = new UserDAO();
    int UID = Integer.parseInt(s.getAttribute("UID").toString());   
    List<TicketModel> list_transn = objdao.AllCancelTransactions(UID);                         
    request.setAttribute("ERS", list_transn);
    
    
%>


    <center>
               

<c:forEach var="x" items="${ERS}">       
  
        <table id="customers">

          <tr>
            <th> (${x.getTID()}) | (${x.getTname()}) </th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th><a href="Ticket.jsp?UID=<%out.print(UID);%>&PNR=${x.getPNR()}"><font color="white"> PNR: ${x.getPNR()}</font></a></th>
          </tr>
          <tr>
            <td width="30%">${x.getDeparttime()} |${x.getBoardingstation()} </td>   
            <td>${x.getArrivaltime()} |${x.getDeststation()}</td>
            <td>Booked:${x.getBookDate()}</td>
            <td>${x.getDateofboard()}</td>
            <td>${x.getCoachClass()}</td>
            <td>${x.getTotalAmount()}</td>
            <td>${x.getStatus()}</td>
            <td><a href="cancelticket.jsp?PNR=${x.getPNR()}&BDATE=${x.getBookDate()}&Coach=${x.getCoachClass()}&TID=${x.getTID()}&status=${x.getStatus()}">CANCEL</a></td>
          </tr>

        </table>

          <br><br>
 </c:forEach>  
            

    </center>
    </body>
</html>
