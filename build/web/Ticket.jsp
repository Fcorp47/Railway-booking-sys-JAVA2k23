<%-- 
    Document   : Ticket
    Created on : 2 Nov, 2022, 11:49:39 AM
    Author     : Asus
--%>

<%@page import="com.RTS.Model.PassModel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

           <%
           
            UserDAO objdao = new UserDAO();
            HttpSession s = request.getSession();
            String UID="";
            String PNR="";
           if(s.getAttribute("UID")!=null){
               if(request.getParameter("UID")!=null){
                UID = request.getParameter("UID");
                PNR = request.getParameter("PNR");
               }
               else
               {
         
                UID = s.getAttribute("UID").toString();
                PNR = s.getAttribute("PNR").toString();
              }
           }
            

          
            List ERS = objdao.getERSdetails(UID,PNR);
            List<PassModel> ERSpass = objdao.getERSpass(UID,PNR);
            
            request.setAttribute("erlist",ERSpass);
         
            float totalamt = Float.parseFloat(ERS.get(8).toString());
            float conv_fee =0;
            String coachtype = ERS.get(4).toString();
            if(coachtype.equals("AC 2 TIER") || coachtype.equals("AC 3 TIER"))
            {
                conv_fee = 30;
            }
            else
            {
                conv_fee = 15;
            }
            
    
            float price = 0;
            float convgst=0; 
              
              price = ( 100*(totalamt - conv_fee) )/ 105;
            
               convgst = (price*5)/100 + conv_fee;
           %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
           <button onclick="window.print()">download</button>

    </head>
    <body>
   
    <div class="container">
        <div class="brand-section">
            <div class="row">
                <div class="col-6">
                    <h1 class="text-white">I-Rail</h1>
                </div>
                <div class="col-6"> 
                    <div class="company-details">
                        <p class="text-white"></p>
                        <p class="text-white">irailways@gmail.com</p>
                        <p class="text-white">+91 888555XXXX</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="body-section">
            <center><h2>Electronic Reservation Slip</h2></center>
            <h2 class="heading">PNR: <% out.print(PNR); %> </h2>
                  
       
            <div class="row">

                <div class="col-6">
                   <h3><p class="sub-heading"> Train No/Name: </p></h3>
                   <p class="sub-heading"><% out.print(ERS.get(1)); %> </p>
                    
                     <h3><p class="sub-heading">Ticket Printing Date: </p></h3>
                    <p class="sub-heading"><% out.print(ERS.get(2)); %>   </p>
                    
                </div>
             
                <div class="col-6">
                 <h3><p class="sub-heading"> Class: </p></h3>
                    <p class="sub-heading"> <% out.print(ERS.get(4)); %>  </p>
                    
                     <h3><p class="sub-heading">Phone no: </p></h3>
                    <p class="sub-heading">xxxxx   </p>
                  	
                    
                   
                </div>
            </div>
    <div class="body-section">
         <div class="row">

                <div class="col-6">
                   <h3><p class="sub-heading"> Boarding From: <% out.print(ERS.get(5)); %>  </p></h3>
                    <p class="sub-heading">  </p>
                    <p class="sub-heading"><% out.print(ERS.get(9)); %> </p>
                </div>
                <div class="col-6">
                	
                    
                     <h3><p class="sub-heading"> TO:  <% out.print(ERS.get(6)); %></p></h3>
                    <p class="sub-heading">   </p>
              <p class="sub-heading"><% out.print(ERS.get(10)); %>   </p>
                    
                </div>
            </div>
          </div>
                  

        </div>

        <div class="body-section">
            <h3 class="heading"><u>Passenger Details</u></h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Current Status</th>
                       
                    </tr>
                </thead>
                <c:forEach var="x" items="${erlist}">
                <tbody>
    

                   
                      <tr>
                        
                     
                          <td width="30%">${x.getPassname()}</td>
                          <td>${x.getPassage()}</td>
                          <td>${x.getPassgender()}</td>

                          <td>CNF ${x.getCoachno()} / ${x.getSeatno()} / ${x.getBerth()}
                       
                    </tr>
 	                 
                 
                    
                </tbody>
                </c:forEach>
            </table>
            <br>
        
            <h3 class="heading"><u>Payment Details: </u></h3>
            <h4>Ticket Fare: <% out.print(price); %></h4>
            <h4>Convenience Fee(inc. gst): <% out.print(convgst); %> </h4>
            <hr >
            <h3>Total Amount: <% out.print(ERS.get(8).toString()); %> </h3>
           
        </div>

        <div class="body-section">
            <p>&copy; Copyright 2022 - AP-railways. All rights reserved. 
                
            </p>
        </div>      
    </div>      
       <style>
        body{
            background-color: #F6F6F6; 
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 70%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
           background-color: #0d1033;
           padding: 10px 40px;
        }
        .logo{
            width: 50%;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;
        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
    </body>
</html>
