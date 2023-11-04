<%-- 
    Document   : AdminController
    Created on : 6 Nov, 2022, 10:41:24 PM
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.RTS.Model.TrainModel"%>
<%@page import="com.RTS.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

int trainno = Integer.parseInt(request.getParameter("trainno"));
            int ncoach = Integer.parseInt(request.getParameter("txtstack"));
            String seat_type = request.getParameter("stacktype");
            int nostack=0;
            UserDAO objdao = new UserDAO();
            TrainModel m = new TrainModel();
            m.setTID(trainno);
            
            if(seat_type.equals("AC 2 TIER"))
                nostack=48*ncoach;
            else if(seat_type.equals("AC 3 TIER"))
                nostack=64*ncoach;
            else if(seat_type.equals("Second Seating(2S)"))
                nostack=78*ncoach;
            
            
            List tlist = new ArrayList();
            for(int i=1; i<=nostack; i++)
            {
                tlist.add(i);
            }
            
            String Stackf = tlist.toString();
           int i = objdao.updateTrainDetails(trainno,seat_type,Stackf,nostack,ncoach);
            //int i=0;
            if(i==1)
            {
                out.print("updated success");
            }
            else
            {
                out.print("update failed");
            }

            


%>