<%-- 
    Document   : booking
    Created on : 20 Oct, 2022, 1:09:37 AM
    Author     : Asus
--%>

<%@page import="com.RTS.DAO.UserDAO"%>
<%@page import="com.RTS.Model.TrainModel"%>
<%@page import="java.util.Stack"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    
    </head>
    <body>
    
   
       
         <%
             
             //model and DAO objects
             TrainModel m = new TrainModel();
             UserDAO objdao = new UserDAO();
       
             //fetching parameters from url trainno and seattype
             int trainno = Integer.parseInt(request.getParameter("trainno"));
             String seat_type = request.getParameter("seat_type");
                
                
             List Listtrain = objdao.gettraininfo(trainno);   //fetch all the info of the train in a list
                
             // pushing list elements into string array.
             String[] strtrainarr = new String[Listtrain.size()];
                 for(int i=0; i< Listtrain.size(); i++)
               {
                      strtrainarr[i] = (Listtrain.get(i)).toString();
               }
                
               
               //this function will return string sear layout like 3AC_stack etc 
               String traindetails = objdao.getseatStack(trainno,seat_type);
               
               
               
               
               //m.set();
               
               // String abc = (${row.2AC_stack});
                
               
               //retrieving coach and berth from url
               String[] seat_coach = request.getParameter("seat_coach").split(",",0);
              
               String[] seat_berth = request.getParameter("seat_berth").split(",",0);
                
                
              
               
            //(url parameter that I passed from seatlayout page)converting seatbooked(string num of seats) into int array after string splitting 
            //SEAT BOOK ARRAY
            String seats_str = request.getParameter("seat_book");
           
            String[] res =  seats_str.split("[,]", 0);  //split to remove brackets and ,
             
             int arr[] = new int[res.length];   //int arr using string length
             for (int i = 0; i < res.length; i++)
             {
                    arr[i] = Integer.parseInt(res[i]);
             }
             
             
             //converting the traindetails-seatstack into temp string seat_stack that i retrieved from tbltrain 
        
            String seat_stack = traindetails;  
            String temp="";
            
            for(int i=0; i<seat_stack.length();i++)         //to remove the brackets inside the list string of train
            {
                char ch = seat_stack.charAt(i);
                if(ch=='[' || ch==']' || ch==' ')
                {
                    continue;
                }
                else
                {
                    temp=temp+ch;          
                }
            }
            

                seat_stack = temp; 
            
                String[] stackstringarr = seat_stack.split("[,]",0);
            
                //moving result string seatarrays to int stack using forloop
                int resultarr[] = new int[stackstringarr.length];
                for(int count=0; count < stackstringarr.length; count++)
                {
                    resultarr[count] = Integer.parseInt(stackstringarr[count]);
                }
                
                //creating stack of seat layouts
                Stack<Integer> stackf = new Stack<Integer>();
                for(int c=0; c<resultarr.length; c++)
                {
                    stackf.add(resultarr[c]);   //adding resultseat int array into stack
                }
                
                
                
                //now, removing the matching seats from the stack and set 0 which are selected.
                            
                            for(int x=0; x<stackf.size(); x++)
                            {
                                for(int j=0; j<arr.length;j++)
                                {
                                    if(stackf.get(x) == arr[j])
                                    {
                                       
                                        stackf.set(x,0);
                                    }
                                }
                            }
                            
                            
                          
                           
                          //  Listtrain.get(10);
                          //  int pricecoach = Integer.parseInt(strtrainarr[10]); //----------------?ERRRORRRRRRRRRRRRR 10 should not be passed
                              
                            float price = 0;
                            float totalfare=0;
                            float conv_fee=0;
                            float convgst=0;
                            //calculate price
                            //10-12
                            if(seat_type.equals("2AC_stack"))
                            {
                               price = Float.parseFloat(request.getParameter("length"))*(Integer.parseInt(strtrainarr[10]));
                               conv_fee = 30;
                               convgst = (price*5)/100 + conv_fee;
                               totalfare = (price*5)/100 + price + conv_fee;
                              
                            }
                            else if(seat_type.equals("3AC_stack"))
                            {
                               price = Float.parseFloat(request.getParameter("length"))*(Integer.parseInt(strtrainarr[11]));
                               conv_fee = 30;
                               convgst = (price*5)/100 + conv_fee;
                               totalfare = (price*5)/100 + price + conv_fee;
                            }
                            else if(seat_type.equals("SS_stack"))
                            {
                                price = Float.parseFloat(request.getParameter("length"))*(Integer.parseInt(strtrainarr[12]));
                                conv_fee = 15;
                                convgst = (price*5)/100 + conv_fee;
                                totalfare = (price*5)/100 + price + conv_fee;
                            }
                           
                           
                            
                            
                            //updating stack into the database
                            
                            
                            
                            //code to update it insi
                            
                            
                           // stackf.add(0);
            HttpSession s = request.getSession();
            s.setAttribute("stackf", stackf);
            s.setAttribute("Listtrain", Listtrain);
            s.setAttribute("seat_coach", request.getParameter("seat_coach"));
            s.setAttribute("seat_berth", request.getParameter("seat_berth"));
            s.setAttribute("seat_book", request.getParameter("seat_book"));
            s.setAttribute("price", price);
            s.setAttribute("convfee", convgst);
            s.setAttribute("totalamt", totalfare);
            s.setAttribute("seat_select", arr);

                %>
    <script>
       $(document).ready(function() {
       $("#btnFetch").click(function() {
       //function getPass()
       //{
     //  var p = document.forms["f1"]["txtpname"].value;
      // var a = document.forms["f1"]["txtage"].value;
       // if (p == "" || a == "")
       // {
       //     alert("Fields cannot be empty");
       // }
       
           var pass = [];
           var age = [];
           var gender = [];
          
         const query = window.location.search;
         const url = new URLSearchParams(query);
         const count = url.get('length');
         const seat= url.get('seat_type');
         var seat_type = "";
         
         if(seat === "3AC_stack")
         {
            seat_type = "AC 3 TIER";
         }
         else if(seat === "2AC_stack")
         {
             seat_type = "AC 2 TIER";
         }
         else if(seat === "SS_stack")
         {
             seat_type = "Second Seating(2S)";
         }
             
          // var count = $(".txtChk").length;
         
            for(var i=0; i<count; i++)
            {               
                 pass[i] = document.getElementById("txtname"+i).value;
                 age[i] = document.getElementById("age"+i).value;
                 gender[i] = document.getElementById("gender"+i).value;
            }
            
          $(this).prop("disabled", true);
          $(this).html(
        '   <i class="fa fa-circle-o-notch fa-spin"></i> Please Wait... '
      );
            setTimeout(function(){
             window.location = '/RailwayTicketSys/Home.jsp/redirecting.jsp?pass='+pass+'&age='+age+'&gender='+gender+'&seat_type='+seat_type+'';
         }, 2000);
        
           
        
        
       });
   });
      
      function hello()
      {
          alert("hello");
      }
       
   </script>
    <center>
                     <h1><%  out.print(strtrainarr[10]); out.print(request.getParameter("trainno")); %></h1> 
                     <h2><% out.print(Listtrain.get(1)); %></h2>    
    <p> <h3>&nbsp;&nbsp;&nbsp;FROM: <% out.print(Listtrain.get(2)); %> &nbsp;&nbsp;&nbsp; <center>----------------</center>
                        TO: <% out.print(Listtrain.get(3)); %></h3></p>
   </center>
    <center>
  <div class="container">
      <form name="f1" onsubmit="required()">
      
      <label for="uname"><b>Passenger Details: </b></label><br>
      <% for(int x=0; x < res.length; x++) { %>
      <input type="text" name="txtpname" placeholder="Passenger Name" required="" name="" id="<%="txtname"+x %>" class="txtChk" required>&nbsp;&nbsp;
      <input type="number" name="txtage"  id="<%="age"+x %>" class="Agechk" required="" placeholder="AGE">&nbsp;
      <select class="GenderChk"  id="<%="gender"+x %>">
          <option>MALE</option>
          <option>FEMALE</option>
          <option>TRANSGENDER</option>
      </select>&nbsp;&nbsp;
      <% out.print(seat_coach[x]+"-"+res[x]+" "+seat_berth[x]); %>
      
      <% }  %>
   
</form>
  </div>
      
      
    </center>
      <br>
      <CENTER>
      <div class="fare">
<font size="5">
      <h2> FARE SUMMARY </h2>      
      
      Ticket Fare:      <% out.print(price); %>     <BR><BR>
      Convenience Fee (Incl. of GST)           <% out.print(convgst); %> <BR><BR>---------------------------------------------<BR>
      Total Amount:      <% out.print(totalfare); %><BR>
      <p>

   
          <button class="button" id="btnFetch" > BOOK </button>
   
   
   </font>
      </div>
         </center>    
        
        
        
        
        
        
        
        
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

.container{
  width: 95%;
  padding: 10px;
  border: 3px solid black;
  margin: 0;
  border-radius: 10px;
}

.fare { box-shadow:6px 7px 7px #999; 

        width: 100%;                    
}

.fare {
  width: 50%;
  padding: 10px;
  border: 5px solid gray;
  margin: 0;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  border-radius: 25px;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}
input[type=text], input[type=password], input[type=email] {
  width: 60%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
input[type=number]{
    width: 10%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
.GenderChk{
    width: 10%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 12px 0 12px 0;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
    
  padding: 16px;
}

.container { box-shadow:6px 7px 7px #999; 

        width: 95%;                    
}
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
        
        
   
    </body>
</html>
