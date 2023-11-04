/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.RTS.DAO;

import com.RTS.Model.PassModel;
import com.RTS.Model.TicketModel;
import com.RTS.Model.TrainModel;
import com.RTS.Model.UserModel;
import java.sql.Connection;
//import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Asus
 */
public class UserDAO {

    public static final String URL = "jdbc:mysql://localhost:3306/rsdb?serverTimezone=UTC";
    public static final String User = "root";
    public static final String Pass = "";
    
    public Connection getConnection() throws SQLException{
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
          con  = DriverManager.getConnection(URL,User,Pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
       
    
    
    public UserModel login(String name, String pwd) throws SQLException {
     
         UserModel objm = new UserModel();
     UserDAO objdao = new UserDAO();
         Connection con = objdao.getConnection();
        
        
        PreparedStatement ps = con.prepareStatement("select * from tblUser where u_username = ? and u_password = ?");
        ps.setString(1, name);
        ps.setString(2, pwd);
 
        try{
            
        ResultSet rs = ps.executeQuery();
        while(rs.next())
            {
                objm.setUID(rs.getInt(1));
                objm.setUusername(rs.getString("u_username"));
                objm.setUpassword(rs.getString("u_password"));
                objm.setUfname(rs.getString("u_fname"));
                objm.setUlname(rs.getString("u_lname"));
                objm.setUemail(rs.getString("u_email"));
                objm.setUmobile(rs.getString("u_mobileno"));

            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }        
            
        return objm;
    }

    public int register(UserModel objm){  
        
        int i = 0;
        
      try{
     UserDAO objdao = new UserDAO();
         Connection con;
      
            con = objdao.getConnection();
     
      
         PreparedStatement ps = con.prepareStatement("insert into tblUser(u_fname,u_lname,u_username,u_password,u_occupation,u_DOB,u_gender,u_email,u_mobileno,u_address,u_pincode,u_state,u_city) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
        //ps.setString(0,);
        ps.setString(1,objm.getUfname());
        ps.setString(2,objm.getUlname());
        ps.setString(3,objm.getUusername());
        ps.setString(4,objm.getUpassword());
        ps.setString(5,objm.getUoccupation());
        ps.setString(6,objm.getuDOB());
        ps.setString(7,objm.getUgender());
        ps.setString(8,objm.getUemail());
        ps.setString(9,objm.getUmobile());
        ps.setString(10,objm.getUaddress());
        ps.setString(11,objm.getUpincode());
        ps.setString(12,objm.getUstate());
        ps.setString(13,objm.getUcity());
        
                             
       i = ps.executeUpdate();
                              
      }
      catch(SQLException ex)
      {
          Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
       
        return i;
    
    }

    public List searchTrains(TrainModel m) {
        
        UserDAO objdao = new UserDAO();
        Connection con;
        List listtrains = new ArrayList();
        try{
            
            con = objdao.getConnection();
            
            PreparedStatement ps = con.prepareStatement("select * from tbltrain where t_from = ? and t_to=? and t_date = ?");
            
            ps.setString(1,m.getTfrom());
            ps.setString(2,m.getTto());
            ps.setString(3,m.getTdate());
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
                    {
                        m = new TrainModel();
                        m.setTID(rs.getInt("TID"));
                        m.setTname(rs.getString("t_name"));
                        m.setTfrom(rs.getString("t_from"));
                        m.setTto(rs.getString("t_to"));
                        m.setTdate(rs.getString("t_date"));
                        m.setTdepart(rs.getString("depart_time"));
                        m.setTarrival(rs.getString("arrival_time"));
                        m.setT3AC(rs.getInt("3AC_seat"));
                        m.setT2AC(rs.getInt("2AC_seat"));
                        m.settSS(rs.getInt("SS_seat"));
                        m.setT2ACprice(rs.getInt("2ACprice"));
                        m.setT3ACprice(rs.getInt("3ACprice"));
                        m.settSSprice(rs.getInt("SSprice"));
                        
                       
                                               
                        listtrains.add(m);
                        
                      
                        
                    }
            
           
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         return listtrains;
        
     }
    
    
    public String getseatStack(int trainno, String seat_type)
    {
        UserDAO objdao = new UserDAO();
        TrainModel m = new TrainModel();
     Connection con;
      String s="";
      List liststack = new ArrayList();
        try {
            con = objdao.getConnection();
            
           PreparedStatement ps = con.prepareStatement("select*from tbltrain where TID=?");
           ps.setInt(1, trainno);
           ResultSet rs = ps.executeQuery();
          
           while(rs.next())
           {
              if(seat_type.equals("3AC_stack"))
              {
                   s = rs.getString("3AC_stack");
                   break;
              }
              else if(seat_type.equals("2AC_stack"))
              {
                   s = rs.getString("2AC_stack");
                   break;
              }
              else if(seat_type.equals("SS_stack"))
              {
                   s = rs.getString("SS_stack");
                   break;
              }
               
            
           }
      
        
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print("error in DAO ");
        }
     
      return s;
     
       
      
    }

   public int getseatcount(int trainno,String seat_stack)
   {
       int count=0;
       UserDAO objdao = new UserDAO();
       Connection con;
       
       try{
       con = objdao.getConnection();
       
       PreparedStatement ps = con.prepareStatement("select * from tbltrain where TID=?");
       ps.setInt(1,trainno);
      
       ResultSet rs = ps.executeQuery();
       while(rs.next())
       {
           if(seat_stack.equals("2AC_stack"))
           count = rs.getInt("2AC_seat");
           else if(seat_stack.equals("3AC_stack"))
           count = rs.getInt("3AC_seat");
            else if(seat_stack.equals("SS_stack"))
           count = rs.getInt("SS_seat");
           
       }
       
    
   }    catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       
       return count;
   }
   
   public int fetchwagonsize(int trainno,String seat_type)
   {
       int count=0;
       UserDAO objdao = new UserDAO();
       Connection con;
       
       try{
       con = objdao.getConnection();
       
       PreparedStatement ps = con.prepareStatement("select * from tbltrain where TID=?");
       ps.setInt(1,trainno);
      
       ResultSet rs = ps.executeQuery();
       while(rs.next())
       {
           if(seat_type.equals("2AC_stack"))
           count = rs.getInt("2ACwagon");
           else if(seat_type.equals("3AC_stack"))
           count = rs.getInt("3ACwagon");
            else if(seat_type.equals("SS_stack"))
           count = rs.getInt("SSwagon");
           
       }
        
    
   }    catch (SQLException ex) {
       
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       
       return count;
   }
   
    public List gettraininfo(int trainno){
    
         UserDAO objdao = new UserDAO();
         Connection con;
        List Listtrain = new ArrayList();
              
        try {
            con = objdao.getConnection();
            
            PreparedStatement ps = con.prepareStatement("select * from tbltrain where TID = ?");
            ps.setInt(1, trainno);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                Listtrain.add(rs.getString("TID"));
                Listtrain.add(rs.getString("t_name"));
                Listtrain.add(rs.getString("t_from"));
                Listtrain.add(rs.getString("t_to"));
                Listtrain.add(rs.getString("t_date"));
                Listtrain.add(rs.getString("depart_time"));
                Listtrain.add(rs.getString("arrival_time"));    
                Listtrain.add(rs.getInt("3AC_seat"));
                Listtrain.add(rs.getInt("2AC_seat"));
                Listtrain.add(rs.getInt("SS_seat"));
                Listtrain.add(rs.getInt("2ACprice"));
                Listtrain.add(rs.getInt("3ACprice"));
                Listtrain.add(rs.getInt("SSprice"));
             
                
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
             
        
        
        return Listtrain;
    }
    
    public int BookTicket(TicketModel m)
    {
        int i=0;
         UserDAO objdao = new UserDAO();
        try {
            
           
            
            Connection con;
            
            con = objdao.getConnection();
            //ID	PNR	TID	UID	BookedOn	Dateofboard	Class	Boardingstation	Deststation	Status	TotalAmount	
	

            PreparedStatement ps = con.prepareStatement("insert into tblticket(PNR,TID,UID,BookedOn,Dateofboard,CoachClass,Boardingstation,Deststation,Status,TotalAmount) values(?,?,?,?,?,?,?,?,?,?) ");
            ps.setInt(1, m.getPNR());
            ps.setInt(2, m.getTID());
            ps.setInt(3,m.getUID());
            ps.setString(4,m.getBookDate());
            ps.setString(5,m.getDateofboard());
            ps.setString(6,m.getCoachClass());
            ps.setString(7,m.getBoardingstation());
            ps.setString(8,m.getDeststation());
            ps.setString(9,m.getStatus());
            ps.setFloat(10,m.getTotalAmount());
                  
            
            
            i = ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return i;
    }
    
    public int AddPassengers(PassModel objm){
        
        int i = 0;

        UserDAO objdao = new UserDAO();
        Connection con;
        //PID	PNR	UID	PassName	PassAge	PassGender	CoachClass	CoachNo	SeatNo	Berth	

        try {
            con = objdao.getConnection();
            
            PreparedStatement ps = con.prepareStatement("Insert into tblpnr(PNR,UID,PassName,PassAge,PassGender,CoachClass,CoachNo,SeatNo,Berth) values(?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,objm.getPNR());
            ps.setInt(2,objm.getUID());
            ps.setString(3,objm.getPassname());
            ps.setString(4,objm.getPassage());
            ps.setString(5,objm.getPassgender());
            ps.setString(6,objm.getCoachclass());
            ps.setString(7,objm.getCoachno());
            ps.setString(8,objm.getSeatno());
            ps.setString(9,objm.getBerth());
            
            i = ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
        
        return i;
        
        
    }
    
    public int updateTrain(int TID,String seat_type,String Stackf)
    {
        int i = 0;
        UserDAO objdao = new UserDAO();
        
        Connection con;
        
        try {
            con = objdao.getConnection();
            PreparedStatement ps;
            if(seat_type.equals("AC 2 TIER")){            
                ps = con.prepareStatement("update tbltrain set 2AC_stack=? where TID=?");
                ps.setString(1,Stackf);
          
                ps.setInt(2,TID);
                ps.executeUpdate();
                
                
            }
            else if(seat_type.equals("AC 3 TIER"))
            {
                ps = con.prepareStatement("update tbltrain set 3AC_stack=? where TID=?");
                ps.setString(1,Stackf);
                
                ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
            else if(seat_type.equals("Second Seating(2S)"))
            {
                ps = con.prepareStatement("update tbltrain set SS_stack=? where TID=?");
                ps.setString(1,Stackf);
                
                ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
         
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return i;
    }
    public int getseats(String seat_type,int TrainID){
        
          int i = 0;
          ResultSet rs=null;
         UserDAO objdao = new UserDAO();
        
        Connection con;
       
        try {
            con = objdao.getConnection();
            PreparedStatement ps;
            if(seat_type.equals("AC 2 TIER")){            
                ps = con.prepareStatement("select 2AC_seat from tbltrain where TID=?");               
                ps.setInt(1,TrainID);
                rs = ps.executeQuery();
                while(rs.next()){
                i = rs.getInt("2AC_seat");
                }
            }
            else if(seat_type.equals("AC 3 TIER"))
            {
                ps = con.prepareStatement("select 3AC_seat from tbltrain where TID=?");
                ps.setInt(1,TrainID);                          
                 rs = ps.executeQuery();
                  while(rs.next()){
                     i = rs.getInt("3AC_seat");
                }
            }
            else if(seat_type.equals("Second Seating(2S)"))
            {
                ps = con.prepareStatement("select SS_seat from tbltrain where TID=?");
                ps.setInt(1,TrainID);          
                 rs = ps.executeQuery();
                  while(rs.next()){
                     i = rs.getInt("SS_seat");
                }
            }
         
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return i;
    }
    
    public int updateseatsize(int TID,int seatsleft,String seat_type){
         int i = 0;
        UserDAO objdao = new UserDAO();
        
        Connection con;
        
        try {
            con = objdao.getConnection();
            PreparedStatement ps;
            if(seat_type.equals("AC 2 TIER")){            
                ps = con.prepareStatement("update tbltrain set 2AC_seat=? where TID=?");
                ps.setInt(1,seatsleft);          
                ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
            else if(seat_type.equals("AC 3 TIER"))
            {
                ps = con.prepareStatement("update tbltrain set 3AC_seat=? where TID=?");
                 ps.setInt(1,seatsleft);          
                ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
            else if(seat_type.equals("Second Seating(2S)"))
            {
                ps = con.prepareStatement("update tbltrain set SS_seat=? where TID=?");
                ps.setInt(1,seatsleft);          
                ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
         
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return i;
        
    }
    public List getERSdetails(String UID, String PNR){
        
        int i=0;
        UserDAO objdao =  new UserDAO();
        Connection con;
        List ERS = new ArrayList();
        try {
            con = objdao.getConnection();
           
            PreparedStatement ps = con.prepareStatement("select *,tbltrain.t_name from tblticket inner join tbltrain on tbltrain.TID = tblticket.TID where UID=? and PNR=?");
            ps.setInt(1, Integer.parseInt(UID));
            ps.setInt(2, Integer.parseInt(PNR));
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ERS.add(rs.getString("TID"));
                ERS.add(rs.getString("t_name"));
                ERS.add(rs.getString("BookedON"));
                ERS.add(rs.getString("DateofBoard"));
                ERS.add(rs.getString("CoachClass"));
                ERS.add(rs.getString("Boardingstation"));
                ERS.add(rs.getString("Deststation"));
                ERS.add(rs.getString("Status"));
                ERS.add(rs.getString("TotalAmount"));
                ERS.add(rs.getString("depart_time"));
                ERS.add(rs.getString("arrival_time"));
                
                
                   
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return ERS;
    }
    
     public List getERSpass(String UID, String PNR){
        
        int i=0;
        UserDAO objdao =  new UserDAO();
        PassModel m;
        Connection con;
        List ERS = new ArrayList();
        
        try {
            con = objdao.getConnection();
           
            PreparedStatement ps = con.prepareStatement("select * from tblpnr where UID=? and PNR=?");
            ps.setInt(1, Integer.parseInt(UID));
            ps.setInt(2, Integer.parseInt(PNR));
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                  m = new PassModel();
                m.setPassname(rs.getString("PassName"));
                m.setPassage(rs.getString("PassAge"));
                m.setPassgender(rs.getString("PassGender"));
                m.setCoachno(rs.getString("CoachNo"));
                m.setSeatno(rs.getString("SeatNo"));
                m.setBerth(rs.getString("Berth"));  
                
                ERS.add(m);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return ERS;
    }
     
     public int truncateAll(){
         
         int i=0;
         UserDAO objdao = new UserDAO();
         Connection con;
         
         
        try {
            con = objdao.getConnection();            
            PreparedStatement ps = con.prepareStatement("truncate table tblticket");
            PreparedStatement ps1 = con.prepareStatement("truncate table tblpnr");
            ps.executeUpdate();
            i = ps1.executeUpdate();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         return i;
     }
     
     public List<TicketModel> AllTransactions(int UID)
     {
         UserDAO objdao = new UserDAO();
         Connection con;
         List ERS = new ArrayList(); 
         TicketModel m;
         
         
        try {
            
            con = objdao.getConnection();        
            PreparedStatement ps = con.prepareStatement("select *,tbltrain.t_name,tbltrain.depart_time,tbltrain.arrival_time from tblticket inner join tbltrain on tbltrain.TID=tblticket.TID where UID=? and Status = 'Confirmed'");
            ps.setInt(1, UID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                m = new TicketModel();
               
                m.setTID(rs.getInt("TID"));
               m.setTname(rs.getString("t_name"));
               m.setPNR(rs.getInt("PNR"));
                m.setBookDate(rs.getString("BookedON"));
                m.setDateofboard(rs.getString("DateofBoard"));
                m.setCoachClass(rs.getString("CoachClass"));
                m.setBoardingstation(rs.getString("Boardingstation"));
                m.setDeststation(rs.getString("Deststation"));
                m.setStatus(rs.getString("Status"));
                m.setTotalAmount(rs.getFloat("TotalAmount"));
               m.setDeparttime(rs.getString("depart_time"));
               m.setArrivaltime(rs.getString("arrival_time"));          
                ERS.add(m);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
         
         return ERS;
     }

     public List<TicketModel> AllCancelTransactions(int UID)
     {
         UserDAO objdao = new UserDAO();
         Connection con;
         List ERS = new ArrayList(); 
         TicketModel m;
         
         
        try {
            
            con = objdao.getConnection();        
            PreparedStatement ps = con.prepareStatement("select *,tbltrain.t_name,tbltrain.depart_time,tbltrain.arrival_time from tblticket inner join tbltrain on tbltrain.TID=tblticket.TID where UID=? and Status = 'Cancelled'");
            ps.setInt(1, UID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                m = new TicketModel();
               
                m.setTID(rs.getInt("TID"));
               m.setTname(rs.getString("t_name"));
               m.setPNR(rs.getInt("PNR"));
                m.setBookDate(rs.getString("BookedON"));
                m.setDateofboard(rs.getString("DateofBoard"));
                m.setCoachClass(rs.getString("CoachClass"));
                m.setBoardingstation(rs.getString("Boardingstation"));
                m.setDeststation(rs.getString("Deststation"));
                m.setStatus(rs.getString("Status"));
                m.setTotalAmount(rs.getFloat("TotalAmount"));
               m.setDeparttime(rs.getString("depart_time"));
               m.setArrivaltime(rs.getString("arrival_time"));          
                ERS.add(m);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
         
         return ERS;
     }

     
     
    public int updateTrainDetails(int trainno, String seat_type, String Stackf, int nostack,int ncoach) {
        
        
        int i = 0;
        UserDAO objdao = new UserDAO();        
        Connection con;
        
        try {
            con = objdao.getConnection();
            PreparedStatement ps;
            if(seat_type.equals("AC 2 TIER")){            
                ps = con.prepareStatement("update tbltrain set 2AC_stack=?,2AC_seat=?,2ACwagon=? where TID=?");
                ps.setString(1,Stackf);
                ps.setInt(2,nostack);             
                ps.setInt(3,ncoach);
                ps.setInt(4,trainno);
                i= ps.executeUpdate();
                
                
            }
            else if(seat_type.equals("AC 3 TIER"))
            {
              ps = con.prepareStatement("update tbltrain set 3AC_stack=?,3AC_seat=?,3ACwagon=? where TID=?");
                ps.setString(1,Stackf);
                ps.setInt(2,nostack);
                ps.setInt(3,ncoach);
                ps.setInt(4,trainno);
                i= ps.executeUpdate();
            }
            else if(seat_type.equals("Second Seating(2S)"))
            {
              ps = con.prepareStatement("update tbltrain set SS_stack=?,SS_seat=?,SSwagon=? where TID=?");
                ps.setString(1,Stackf);
                ps.setInt(2,nostack);
                ps.setInt(3,trainno);
                ps.setInt(3,ncoach);
                ps.setInt(4,trainno);
                i= ps.executeUpdate();
            }
         
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return i;
          
        
       }
    
    public ResultSet searchajax(String name)
    {
        UserDAO objdao = new UserDAO();
        ResultSet rs=null;
        Connection con;
        
        try {  
            con = objdao.getConnection();
            PreparedStatement ps=con.prepareStatement("select scode from tblstation where sname like '"+name+"%'");            
            rs = ps.executeQuery();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return rs;
    }
     
    
    public List getPlist(int UID, int PNR)
    {
     
        UserDAO objdao = new UserDAO();
        Connection con;
        List L = new ArrayList();
        PassModel p;
        try {
            con = objdao.getConnection();
            
            PreparedStatement ps = con.prepareStatement("select SeatNo from tblpnr where PNR=? and UID=?");
            ps.setInt(1, PNR);
            ps.setInt(2, UID);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                
             // p = new PassModel();
              
              L.add(rs.getString("SeatNo"));
              
              //L.add(p);
                    
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return L;
    }
    
    public String getCoachSeat(String seat_type, int TID)
    {
       
        UserDAO objdao = new UserDAO();
        TrainModel m = new TrainModel();
     Connection con;
      String s="";
     
        try {
            con = objdao.getConnection();
            
           PreparedStatement ps = con.prepareStatement("select*from tbltrain where TID=?");
           ps.setInt(1, TID);
           ResultSet rs = ps.executeQuery();
          
           while(rs.next())
           {
              if(seat_type.equals("AC 3 TIER"))
              {
                   s = rs.getString("3AC_stack");
                   break;
              }
              else if(seat_type.equals("AC 2 TIER"))
              {
                   s = rs.getString("2AC_stack");
                   break;
              }
              else if(seat_type.equals("Second Seating(2S)"))
              {
                   s = rs.getString("SS_stack");
                   break;
              }
               
            
           }
      
        
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print("error in DAO ");
        }
     
      return s;
     
       
      
    
        
        
    }
    
    
    public String getBookedDate(int PNR)
    {
        UserDAO objdao = new UserDAO();
        String bookeddate="";
       Connection con;
        try {
            con = objdao.getConnection();
            
            PreparedStatement ps = con.prepareStatement("select BookedOn from tblticket where PNR=?");
            ps.setInt(1, PNR);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                bookeddate = rs.getString("BookedOn");
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookeddate;
    }
    
    
    public int setStatus(String status, int PNR)
    {
        
        UserDAO objdao = new UserDAO();
        int i=0;
       Connection con;
        
        try {
            con = objdao.getConnection();
            
             PreparedStatement ps = con.prepareStatement("update tblticket set Status=? where PNR=?");
            ps.setString(1, status);
            ps.setInt(2, PNR);            
            i = ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return i;
    }
    
    
   



 public int getTotalSeats(String seat_type, int TID)
    {
               
        
        UserDAO objdao = new UserDAO();
        TrainModel m = new TrainModel();
        Connection con;
        int s=0;
     
        try {
            con = objdao.getConnection();
            
           PreparedStatement ps = con.prepareStatement("select*from tbltrain where TID=?");
           ps.setInt(1, TID);
           ResultSet rs = ps.executeQuery();
          
           while(rs.next())
           {
              if(seat_type.equals("AC 3 TIER"))
              {
                   s = rs.getInt("3AC_seat");
                   break;
              }
              else if(seat_type.equals("AC 2 TIER"))
              {
                   s = rs.getInt("2AC_seat");
                   break;
              }
              else if(seat_type.equals("Second Seating(2S)"))
              {
                   s = rs.getInt("SS_seat");
                   break;
              }
               
            
           }
      
        
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print("error in DAO ");
        }
        
      return s;      
      
    }
    
    public int updateSeats(int TID,int totalseats,String seat_type)
    {
               
        int i = 0;
        UserDAO objdao = new UserDAO();        
        Connection con;
        
        try {
            con = objdao.getConnection();
            PreparedStatement ps;
            if(seat_type.equals("AC 2 TIER")){            
                ps = con.prepareStatement("update tbltrain set 2AC_seat=? where TID=?");
                ps.setInt(1,totalseats);
                ps.setInt(2,TID);  
                i= ps.executeUpdate();
                               
            }
            else if(seat_type.equals("AC 3 TIER"))
            {
              ps = con.prepareStatement("update tbltrain set 3AC_seat=? where TID=?");
                 ps.setInt(1,totalseats);
                 ps.setInt(2,TID);
                i= ps.executeUpdate();
            }
            else if(seat_type.equals("Second Seating(2S)"))
            {
              ps = con.prepareStatement("update tbltrain set SS_seat=? where TID=?");
                ps.setInt(1,totalseats);
                ps.setInt(2,TID);
               
                i= ps.executeUpdate();
            }
         
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return i;
          
        
        
    }    


}
