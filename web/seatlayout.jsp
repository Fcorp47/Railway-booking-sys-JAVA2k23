<%-- 
    Document   : seatlayout
    Created on : 8 Oct, 2022, 12:43:36 PM
    Author     : Asus
--%>

<%@page import="java.util.Stack"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
    </head>
    <body>
        <script>
    
    
function arrChk(){ 
 
    var arrAn = [];  
  
    var m = $('.Chk'); 
    
 
    var arrLen = $('.Chk').length; 
   
      //--
      var arrHD = [];
      var x = $('.hdchk');
      var arrberth = [];
      var y = $('.hdberth');
     //--
    for ( var i= 0; i < arrLen ; i++){  
        var  w = m[i];   
        var  a = x[i];
        var berth = y[i];
        
        
         if (w.checked){  
          arrAn.push(w.value);  
          console.log(w.value );
          //---
          arrHD.push(a.value);
          console.log(a.value);
          
           arrberth.push(berth.value);
          console.log(berth.value);
          
        } 
      }   
   
   var length = arrberth.length;
  
   // var myJsonString = JSON.stringify(arrAn); 
   // console.log('result' + myJsonString);
   // if(arrAn.length > 6)
   
   // return myJsonString;  
   
   //fetched parameters from the url
   const query = window.location.search;
   const url = new URLSearchParams(query);
   const trainno = url.get('trainno');
   const seat_type = url.get('seat_type');

    //redirecting through query string
    window.location = '/RailwayTicketSys/Home.jsp/booking.jsp?trainno='+trainno+'&seat_type='+seat_type+'&seat_book='+arrAn+'&seat_berth='+arrberth+'&seat_coach='+arrHD+'&length='+length+' ';
    
    
    
   }
   
$('button').click(arrayChk);
 

       </script>
       <style>
           
           input[type=checkbox][disabled]{
  outline:2.5px solid red; 
  background-color: red;
  background: red;
  color: red;
}

       </style>
   
        <% 
            HttpSession s = request.getSession();
             if(s.getAttribute("UID") == null)
             {%>
               <script>
                   alert('login to proceed');
                        window.location = '/RailwayTicketSys/Home.jsp/Login.jsp';
               </script>
                 
                                
         <%    }
                    
                int seat = Integer.parseInt(request.getParameter("seat"));
                int trainno = Integer.parseInt(request.getParameter("trainno"));
                String seat_type= request.getParameter("seat_type");
                
                
                UserDAO objdao = new UserDAO();
                String traindetails = objdao.getseatStack(trainno, seat_type);
                
                
                int seat_count = objdao.getseatcount(trainno,seat_type);
                
                String temp = "";
                for(int i=0; i<traindetails.length(); i++ )
                {
                    char c = traindetails.charAt(i);
                    if(c == '[' || c == ']' || c == ' ')
                    {
                        continue;
                    }
                    else
                    {
                        temp=temp+c;
                    }
                    
                }
                traindetails = temp;
                
                String[] stackstringarr = traindetails.split("[,]",0);
                
                int resultarr[] = new int[stackstringarr.length];
                for(int count=0; count < stackstringarr.length; count++)
                {
                    resultarr[count] = Integer.parseInt(stackstringarr[count]);
                }
                
                Stack<Integer> stackf = new Stack<Integer>();
                for(int c=0; c<resultarr.length; c++)
                {
                    stackf.add(resultarr[c]);
                }

                
              
                
                // seat size fetch
                int wagonsize = objdao.fetchwagonsize(trainno,seat_type);
          

    if(seat_type.equals("2AC_stack")){ 
        int num=1;
       
       
       
     int ssize=48;
//=================================================================================================================================
    int totalwagon=3;
    int scount=1;
     int count=0;
     
    while(scount<=wagonsize){
       
       String compartment = "A"+num;
        

%>
 <br><br><br>
 <div class="coach_container">
 <h2><% out.print(compartment); %></h2>
         <table>
            
            <tr>
                
        <div id="checkboxList">
            
      <% 
          int row1=count;int s1=row1+1;
          while(row1 < ssize && s1<=ssize )
              {    
           
            if(stackf.get(row1) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled="" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Lower berth");%>" class="hdberth"/>
            
      <% }
                row1=row1+3; 
                s1=s1+3;  }
       %>
                      
         
        </div>
         </tr>
                
  
    
            <tr>
        <div id="checkboxList">
     <% 
          int row2=count+1;int s2=row2+1;
          while(row2 < stackf.size() && s2<=ssize )
              {    
           
            if(stackf.get(row2) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s2);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row2));%>"><%out.println(s2);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Upper berth");%>" class="hdberth"/>
      <% }
                row2=row2+3; 
                s2=s2+3;  }
       %>
                      
         
        </div>
         </tr>
</table>
  <br><br>
  <table>
       
   
            <tr>
        <div id="checkboxList">
       <% 
          int row3=count+2;int s3=row3+1;
          while(row3 < stackf.size() && s3<=ssize )
              {    
           
            if(stackf.get(row3) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s3);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row3));%>"><%out.println(s3);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Side Lower berth");%>" class="hdberth"/>
      <% }
                row3=row3+3; 
                s3=s3+3;  }
       %>
          
        </div>
         </tr>
</table>
 </div>
      
   
       <%  
      scount=scount+1; 
      count=ssize; 
      ssize=ssize+48;
      num=num+1;
              } }







//================================================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>





       
      else if(seat_type.equals("3AC_stack"))
      { 
        int num=1;
       
       
       
     int ssize=64;
   int totalwagon=3;
    int scount=1;
     int count=0;
     
    while(scount<=wagonsize){
       
       String compartment = "3A-"+num;
                      
       %>
       
       <br><br><br>
 <div class="coach_container">
 <h2><% out.print(compartment); %></h2>
         <table>
            
            <tr>
                
        <div id="checkboxList">
            
      <% 
          int row1=count;int s1=row1+1;
          while(row1 < ssize && s1<=ssize )
              {    
           
            if(stackf.get(row1) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled="" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Lower berth");%>" class="hdberth"/>
            
      <% }
                row1=row1+4; 
                s1=s1+4;  }
       %>
                      
         
        </div>
         </tr>
                
  
    
            <tr>
        <div id="checkboxList">
     <% 
          int row2=count+1;int s2=row2+1;
          while(row2 < stackf.size() && s2<=ssize )
              {    
           
            if(stackf.get(row2) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s2);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row2));%>"><%out.println(s2);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Middle berth");%>" class="hdberth"/>
      <% }
                row2=row2+4; 
                s2=s2+4;  }
       %>
                      
         
        </div>
         </tr>

       
   
            <tr>
        <div id="checkboxList">
       <% 
          int row3=count+2;int s3=row3+1;
          while(row3 < stackf.size() && s3<=ssize )
              {    
           
            if(stackf.get(row3) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s3);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row3));%>"><%out.println(s3);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Upper berth");%>" class="hdberth"/>
      <% }
                row3=row3+4; 
                s3=s3+4;  }
       %>
          
        </div>
         </tr>
      
</table>   <br><br>
       <table>
           
           <tr>
        <div id="checkboxList">
       <% 
          int row4=count+3;int s4=row4+1;
          while(row4 < stackf.size() && s4<=ssize )
              {    
           
            if(stackf.get(row4) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s4);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row4));%>"><%out.println(s4);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Side Window berth");%>" class="hdberth"/>
      <% }
                row4=row4+4; 
                s4=s4+4;  }
       %>
          
        </div>
         </tr>
       </table>
       
       
 </div>
      
   
       <%  
      scount=scount+1; 
      count=ssize; 
      ssize=ssize+64;
      num=num+1;
              } }




//======================================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>============================


else if(seat_type.equals("SS_stack"))
      { 
        int num=1;
       
       
       
     int ssize=78;
   int totalwagon=3;
    int scount=1;
     int count=0;
     
    while(scount<=wagonsize){
       
       String compartment = "2S-"+num;
                      
       %>
       
       <br><br><br>
 <div class="coach_container">
 <h2><% out.print(compartment); %></h2>
         <table>
            
            <tr>
                
        <div id="checkboxList">
            
      <% 
          int row1=count;int s1=row1+1;
          while(row1 < ssize && s1<=ssize )
              {    
           
            if(stackf.get(row1) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled="" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row1));%>"><%out.println(s1);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Window seat");%>" class="hdberth"/>
            
      <% }
                row1=row1+6; 
                s1=s1+6;  }
       %>
                      
         
        </div>
         </tr>
                
  
    
            <tr>
        <div id="checkboxList">
     <% 
          int row2=count+1;int s2=row2+1;
          while(row2 < stackf.size() && s2<=ssize )
              {    
           
            if(stackf.get(row2) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s2);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row2));%>"><%out.println(s2);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
      <input type="hidden" value="<% out.println("Middle seat");%>" class="hdberth"/>
      <% }
                row2=row2+6; 
                s2=s2+6;  }
       %>
                      
         
        </div>
         </tr>

       
   
            <tr>
        <div id="checkboxList">
       <% 
          int row3=count+2;int s3=row3+1;
          while(row3 < stackf.size() && s3<=ssize )
              {    
           
            if(stackf.get(row3) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s3);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row3));%>"><%out.println(s3);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Aisle seat");%>" class="hdberth"/>
      <% }
                row3=row3+6; 
                s3=s3+6;  }
       %>
          
        </div>
         </tr>
      
</table>   <br><br>
       <table>
           
           <tr>
        <div id="checkboxList">
       <% 
          int row4=count+3;int s4=row4+1;
          while(row4 < stackf.size() && s4<=ssize )
              {    
           
            if(stackf.get(row4) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s4);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row4));%>"><%out.println(s4);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Aisle seat");%>" class="hdberth"/>
      <% }
                row4=row4+6; 
                s4=s4+6;  }
       %>
          
        </div>
         </tr>
         
          <tr>
        <div id="checkboxList">
       <% 
          int row5=count+4;int s5=row5+1;
          while(row5 < stackf.size() && s5<=ssize )
              {    
           
            if(stackf.get(row5) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s5);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row5));%>"><%out.println(s5);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Middle Seat");%>" class="hdberth"/>
      <% }
                row5=row5+6; 
                s5=s5+6;  }
       %>
          
        </div>
         </tr>
         
         <tr>
        <div id="checkboxList">
       <% 
          int row6=count+5;int s6=row6+1;
          while(row6 < stackf.size() && s6<=ssize )
              {    
           
            if(stackf.get(row6) == 0){
      %>
                        
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" disabled=""  class="Chk" ><%out.println(s6);%> </div> </td>

      <% } else{ %>
      <td>  <div><img src="pseat.png" height="20%" width="20%"><input type="checkbox" class="Chk" value="<%out.println(stackf.get(row6));%>"><%out.println(s6);%> </div> </td>
      <input type="hidden" value="<%  out.println(compartment);%>" class="hdchk" name="hdcomp" />
    <input type="hidden" value="<% out.println("Window Seat");%>" class="hdberth"/>
      <% }
                row6=row6+6; 
                s6=s6+6;  }
       %>
          
        </div>
         </tr>
       </table>
       
       
 </div>
      
   
       <%  
      scount=scount+1; 
      count=ssize; 
      ssize=ssize+78;
      num=num+1;
              } }
%>

       








       
       <br><br>
       <button class="button button2" onclick="arrChk()"> book </button>

     


        <style>
.button {
  background-color: #4CAF50; /* Green */
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
.coach_container{
  width: 95%;
  padding: 10px;
  border: 3px solid black;
  margin: 0;
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
