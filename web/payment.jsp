<%-- 
    Document   : payment
    Created on : 1 Nov, 2022, 11:06:47 AM
    Author     : Asus
--%>

<%@page import="com.RTS.Model.TrainModel"%>
<%@page import="com.RTS.Model.PassModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.RTS.Model.TicketModel"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Stack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  
         
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    </head>
    
    <body>
       
    <%
        
        UserDAO objdao = new UserDAO();
        
    
    HttpSession s = request.getSession();
        
            Random rand = new Random();
            String seatst = s.getAttribute("stackf").toString();
            String UID = s.getAttribute("UID").toString();
            String[] seat_coach = (s.getAttribute("seat_coach").toString()).split(",",0);
            String[] seat_berth = (s.getAttribute("seat_berth").toString()).split(",",0);
            String[] seat_book =  (s.getAttribute("seat_book").toString()).split(",",0);
            String[] seat_pass =  (s.getAttribute("pass").toString()).split(",",0);
            String[] seat_age =   (s.getAttribute("age").toString()).split(",",0);
            String[] seat_gender = (s.getAttribute("gender").toString()).split(",",0);
             int PNR = (int) (Math.random()*Math.pow(9,10));
             out.println(PNR);
             
            s.setAttribute("PNR",PNR);
             
             
            String seat_type = s.getAttribute("seat_type").toString();
            
            String Ltrain = s.getAttribute("Listtrain").toString();
            String temp="";
            for(int i=0; i<Ltrain.length();i++)         //to remove the brackets inside the list string
            {
                char ch = Ltrain.charAt(i);
                if(ch=='[' || ch==']')
                {
                    continue;
                }
                else
                {
                    temp=temp+ch;
                }
            }
              Ltrain = temp; 
            
           String[] Listtrain = Ltrain.split(",",0);
            
           
            
            for(int i=0; i < seat_book.length; i++)
            out.println(seat_book[i]);
            
            for(int i=0; i < seat_coach.length; i++)
            out.println(seat_coach[i]);
            
            for(int i=0; i < seat_berth.length; i++)
            out.println(seat_berth[i]);
            
            for(int i=0; i < seat_pass.length; i++)
            out.println(seat_pass[i]);
            

      
            
          
       
            
           
       java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
      out.println("Current Date: "+date);

      
      out.print(seat_type);
//ID	PNR	TID	UID	BookedOn	Dateofboard	Class	Boardingstation	Deststation	Status	TotalAmount	

 
            
           TicketModel m = new TicketModel();
           m.setPNR(PNR);
           m.setTID(Integer.parseInt(Listtrain[0]));
           m.setUID(Integer.parseInt(UID));
           m.setBookDate(date.toString());
           m.setDateofboard(Listtrain[4]);
           m.setCoachClass(seat_type);
           m.setBoardingstation(Listtrain[2]);
           m.setDeststation(Listtrain[3]);
           m.setStatus("Confirmed");
           m.setTotalAmount(Float.parseFloat(s.getAttribute("totalamt").toString()));
           
           
           int flag_bookmain = objdao.BookTicket(m);
           //PID	PNR	UID	PassName	PassAge	PassGender	Class	CoachNo	SeatNo	Berth	

          if(flag_bookmain == 1) 
          {
               out.print("  MAIN inserted success");
              int flag_bookpass=0;
               PassModel objm =new PassModel();
              for(int i=0; i < seat_pass.length; i++)
              {
                  flag_bookpass=0;
                  objm.setPNR(PNR);
                  objm.setUID(Integer.parseInt(UID));
                  objm.setPassname(seat_pass[i]);
                  objm.setPassage(seat_age[i]);
                  objm.setPassgender(seat_gender[i]);
                  objm.setCoachclass(seat_type);
                  objm.setCoachno(seat_coach[i]);
                  objm.setSeatno(seat_book[i]);
                  objm.setBerth(seat_berth[i]);
                  
                    
                  flag_bookpass = objdao.AddPassengers(objm);
              }
              if(flag_bookpass == 1){
                  out.print("tblpnr record inserted");
              }
              else
              {
                  out.print("tblpnr not insert");
              }
            
          }
          else
          {
                     out.print("insertion not successful");
          }
            

           
//-------------------------- im gonna update train's seat


                UserDAO o = new UserDAO();
                
               int TrainID = Integer.parseInt(Listtrain[0]);
                                                                                            
               int s_size=seat_pass.length;   
               int trainseats;    
               int seatsleft;
               
             
                    trainseats = o.getseats(seat_type,TrainID); 
                    
               
               
                  seatsleft = trainseats - s_size;    
            
       
                 
                
//----------------------------//


             TrainModel tmodel = new TrainModel();
             int TID = Integer.parseInt(Listtrain[0]);  
             
             
            
           
              UserDAO dao = new UserDAO();
             
             String stackf = s.getAttribute("stackf").toString();
             out.print(stackf);
             
             
              int flag_SeatStackchanged = dao.updateTrain(TID,seat_type,stackf);           
                           if(flag_SeatStackchanged == 1)
                           { 
                               out.println("STACK UPDATED TRAIN");
                           }
                           else
                           {
                               out.println("STACK NOT UPDATED FAILED");
                           }
                      
              int fseatsize = dao.updateseatsize(TID,seatsleft,seat_type);

                           response.sendRedirect("Ticket.jsp");

    %>
      
    </body>
</html>
