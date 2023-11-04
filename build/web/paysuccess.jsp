<%-- 
    Document   : paysuccess
    Created on : 10 Nov, 2022, 6:46:21 PM
    Author     : Asus
--%>

<%@page import="java.util.Random"%>
<%@page import="com.RTS.Model.TicketModel"%>
<%@page import="com.RTS.Model.PassModel"%>
<%@page import="com.RTS.Model.TrainModel"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            

            
           
       java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    
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
              
            
          }
          else
          {
                   //  out.print("insertion not successful");
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
            
             
              int flag_SeatStackchanged = dao.updateTrain(TID,seat_type,stackf);           
                          
              int fseatsize = dao.updateseatsize(TID,seatsleft,seat_type);

                          // response.sendRedirect("Ticket.jsp");

    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html style="-moz-osx-font-smoothing: grayscale; -webkit-font-smoothing: antialiased; background-color: #464646; margin: 0; padding: 0;">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="format-detection" content="telephone=no">
        <title>AP | RAILWAYS</title>
        
        
      
    </head>
    

    
    <body bgcolor="#d7d7d7" class="generic-template" style="-moz-osx-font-smoothing: grayscale; -webkit-font-smoothing: antialiased; background-color: #d7d7d7; margin: 0; padding: 0;">
        <!-- Header Start -->
       
        <!-- Header End -->

        <!-- Content Start -->
        <table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7" align="center" style="max-width: 600px;">
            <tr bgcolor="#d7d7d7">
                <td height="50" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
            </tr>

            <!-- This encapsulation is required to ensure correct rendering on Windows 10 Mail app. -->
            <tr bgcolor="#d7d7d7">
                <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                    <!-- Seperator Start -->
                    <table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7" align="center" style="max-width: 600px; width: 100%;">
                        <tr bgcolor="#d7d7d7">
                            <td height="30" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                    </table>
                    <!-- Seperator End -->

 <!-- Generic Pod Left Aligned with Price breakdown Start -->
                    <table align="center" cellpadding="0" cellspacing="0" cols="3" bgcolor="white" class="bordered-left-right" style="border-left: 10px solid #d7d7d7; border-right: 10px solid #d7d7d7; max-width: 600px; width: 100%;">
                        <tr height="50"><td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td></tr>
                        <tr align="center">
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td class="text-primary" style="color: #F16522; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                                <img src="http://dgtlmrktng.s3.amazonaws.com/go/emails/generic-email-template/tick.png" alt="GO" width="50" style="border: 0; font-size: 0; margin: 0; max-width: 100%; padding: 0;">
                            </td>
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                        <tr height="17"><td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td></tr>
                        <tr align="center">
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td class="text-primary" style="color: #F16522; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                                <h1 style="color: #F16522; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 30px; font-weight: 700; line-height: 34px; margin-bottom: 0; margin-top: 0;">Payment received</h1>
                            </td>
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                        <tr height="30"><td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td></tr>
                        <tr align="left">
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">
                                   
                                  <%
                                  
                                     out.print(s.getAttribute("User")+" "+s.getAttribute("Lname"));
                                    
                                  %>  
                                    
                                    
                                     
                                </p>
                            </td>
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                        <tr height="10"><td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td></tr>
                        <tr align="left">
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">Your transaction was successful!</p>
                                <br>
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0; "><strong>Payment Details:</strong><br/>

Amount: <%
                                  
                                    out.print(s.getAttribute("totalamt"));
                                    
                                  %>  <br/>
</p>
                                    <br>
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;">For Viewing Last booked Details, Visit your Account.&nbsp;&nbsp;&nbsp;&nbsp;<br/></p>
                            </td>
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                        <tr height="30">
                            <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td style="border-bottom: 1px solid #D3D1D1; color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                        <tr height="30"><td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td></tr>
                        <tr align="center">
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                            <td style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;">
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;"><strong>PNR reference: <% out.print(s.getAttribute("PNR"));%></strong></p>
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;"><a href="Ticket.jsp"> Download Ticket</a></p>
                                <p style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 22px; margin: 0;"><a href="Home.jsp">  Go to Home </a></p>
                            </td>
                            <td width="36" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>

                        <tr height="50">
                            <td colspan="3" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>

                    </table>
                    <!-- Generic Pod Left Aligned with Price breakdown End -->

                    <!-- Seperator Start -->
                    <table cellpadding="0" cellspacing="0" cols="1" bgcolor="#d7d7d7" align="center" style="max-width: 600px; width: 100%;">
                        <tr bgcolor="#d7d7d7">
                            <td height="50" style="color: #464646; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 16px; vertical-align: top;"></td>
                        </tr>
                    </table>
                    <!-- Seperator End -->

                </td>
            </tr>
        </table>
        <!-- Content End -->

        
    </body>
</html>
