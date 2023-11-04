<%-- 
    Document   : Trainlist
    Created on : 7 Oct, 2022, 9:45:15 AM
    Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page import="com.RTS.Model.TrainModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>train-list</title>
        <link type="text/css" rel="stylesheet" href="menucss/seaets.css" />
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script>
       
    </script>
    
    </head>
     
  
   <%  
        TrainModel m = new TrainModel();
        UserDAO objdao = new UserDAO();
        
                   m.setTfrom(request.getParameter("txtfrom"));
                   m.setTto(request.getParameter("txtto"));
                   m.setTdate(request.getParameter("txtdate"));
                   
        List<TrainModel> listtrains = objdao.searchTrains(m);
    request.setAttribute("list", listtrains);
    
//String stringToExplode = "apple,pear,banana,,durian";
//String separator = ",";
//String[] arrExploded =  explodeStringUsingStringUtils(stringToExplode,separator);

   %>
   
   
   
    <body>
         
        <form method="post">
            <br>
            <center>
            
            FROM: <input type="text" value="<% out.print(request.getParameter("txtfrom")); %>" name="txtfrom">
            TO: <input type="text" value="<% out.print(request.getParameter("txtto")); %>" name="txtto">
            DATE: <input type="date" value="<% out.print(request.getParameter("txtdate")); %>" name="txtdate">
            CLASS: <select class="form-control">
                    <option>AC First Class</option>
                    <option>AC 2 Tier</option>
                    <option>AC 3 Tier</option>
                    <option>AC 3 Tier Economy</option>
                    <option>Sleeper</option>
                    <option>Second Sitting</option>
                    </select>
            
            <input type="submit" value="search" name="btnsearch">
            <br><br><br><br>
            
      </center>
            

<c:forEach var="train" items="${list}">       
    <center> 
        
  <table id="customers">
     
  <tr>
   <th>TRAIN</th>
   <th>TRAIN NO</th>
   <th>FROM</TH>
   <TH>TO</th>
   <TH>DEP</th>
   <TH>ARR</th>
  </tr>
  
  <tr>
      
    <td>${train.getTname()}</td>
    <td>${train.getTID()}</td>
    <td>${train.getTfrom()}</td>
    <td>${train.getTto()}</td>
    <td>${train.getTdepart()}</td>
    <td>${train.getTarrival()}</td>
    
  </tr>
        
 </table>
    </center><br>
    <div>
    &nbsp;
    <a class="button button2" href="seatlayout.jsp?seat=${train.getT3AC()}&trainno=${train.getTID()}&seat_type=3AC_stack">3AC<br>Available-${train.getT3AC()} <br>₹ ${train.getT3ACprice()}</a>
    
<a class="button button2" href="seatlayout.jsp?seat=${train.getT2AC()}&trainno=${train.getTID()}&seat_type=2AC_stack">2AC<br>Available-${train.getT2AC()} <br>₹ ${train.getT2ACprice()}</a>
<a class="button button2" href="seatlayout.jsp?seat=${train.gettSS()}&trainno=${train.getTID()}&seat_type=SS_stack">Second Sitting(2S)<br>Available-${train.gettSS()} <br>₹ ${train.gettSSprice()}</a>
    </div>
 <br><br>
 
 
 </c:forEach>  
            
                 
                 
                 
                 
                 
                 
                 
            
          
        </form>
        
        
        
        
<style>
 
    div{
         margin-left: 100px;
    }    
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  border-radius: 15px;
  width:90%;
}

#customers td, #customers th {
  border: 0px solid #ddd;
  padding: 8px;

}

#customers td {
      height: 70px;
}
#customers tr{
    background-color: #ddd; 
}
#customers tr:hover {background-color: #999;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  
  background-color: black;
  color: white;
}

table { box-shadow:8px 8px 8px #999; 

        width: 100%;                    
}


.button {
  background-color: #4CAF50; /* Green */
 border-radius: 10px;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}

.button1 {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>
     </body>
    
    
</html>
