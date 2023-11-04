<%-- 
    Document   : tojsp
    Created on : 11 Nov, 2022, 3:21:36 PM
    Author     : Asus
--%>

<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import="java.sql.*" %>  
<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
  
}else{  
try{  
    UserDAO objdao = new UserDAO();
    
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rsdb","root","");  
PreparedStatement ps=con.prepareStatement("select scode from tblstation where sname like '"+name+"%'");  
ResultSet rs= ps.executeQuery();  


if(!rs.isBeforeFirst()) {      
 out.println("<p>No Record Found!</p>");   
}else{  

  %>
<ul>
<%
    while(rs.next()){  
        %>
        <li onClick="selectstations('<%out.print(rs.getString("scode"));%>');"><% out.print(rs.getString("scode"));%>
        </li><br>
        
        <%
}  %>
</ul><%
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>
<style>
    li{
        color: white;
    }
    </style>
