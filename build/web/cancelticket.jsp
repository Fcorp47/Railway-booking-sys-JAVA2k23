<%-- 
    Document   : cancelticket
    Created on : 14 Nov, 2022, 12:16:50 AM
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.RTS.Model.PassModel"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    UserDAO objdao = new UserDAO();
    
   HttpSession s = request.getSession();
   
   int UID = Integer.parseInt(s.getAttribute("UID").toString());
   int PNR = Integer.parseInt(request.getParameter("PNR"));
   int TID = Integer.parseInt(request.getParameter("TID"));
   String BDATE = request.getParameter("BDATE");
   String Coach = request.getParameter("Coach");
   
   
   List x = objdao.getPlist(UID,PNR);
   String bookeddate = objdao.getBookedDate(PNR);
   
   String coachseat = objdao.getCoachSeat(Coach,TID);
   
   
    String temp="";
    for(int i=0; i<coachseat.length();i++)         //to remove the brackets inside the list string
            {
                char ch = coachseat.charAt(i);
                if(ch=='[' || ch==']' || ch==' ')
                {
                    continue;
                }
                else
                {
                    temp=temp+ch;
                }
            }
            
                coachseat = temp; 
            
                String[] seatarray = coachseat.split("[,]",0);
                
                
                List stack_seats = new ArrayList();
                for(int i=0; i < seatarray.length; i++)
                {
                    stack_seats.add(seatarray[i]);
                }
                        
                for(int i=0; i<stack_seats.size(); i++)
                {
                    for(int j=0; j < x.size(); j++)
                    {
                        
                        if( i == Integer.parseInt(x.get(j).toString()) - 1 ) 
                        {
                            
                            stack_seats.set(i, x.get(j));
                            
                        }
                           
                        
                    }
                }
                
                
              for(int i=0; i<stack_seats.size(); i++){
                out.println(stack_seats.get(i));
                }
  
   
      java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
    
      String todaydate = date.toString();
     
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
    Date dateBefore = sdf.parse(bookeddate);
    Date dateAfter = sdf.parse(todaydate);
    long timeDiff = Math.abs(dateAfter.getTime() - dateBefore.getTime());
    long daysDiff = TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS);
             
   String status="Cancelled";

  
   int passno = x.size();
   int totalseats = objdao.getTotalSeats(Coach,TID);
   
   int totalupdate = totalseats + passno;
   
   if(daysDiff <= 1)
    {
        int i = objdao.updateTrain(TID,Coach,stack_seats.toString());        
        
          objdao.setStatus(status,PNR);
          objdao.updateSeats(TID,totalupdate,Coach);            
          response.sendRedirect("lastbookticket.jsp");
                 
         //   out.print("<script>alert('CANNOT CANCEL')</script>");
                       
    }
    else
    {
         out.print("<script>alert('CANNOT CANCEL')</script>");
    }


%>
