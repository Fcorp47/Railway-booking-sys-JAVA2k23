/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.RTS.Controller;

import com.RTS.DAO.UserDAO;
import com.RTS.Model.TrainModel;
import com.RTS.Model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Asus
 */
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
         String btn = request.getParameter("btn");
           
         try{
                if(btn.equals("Login"))
                {
                            String name = request.getParameter("txtusername");
                            String pwd = request.getParameter("txtpassword");

                        UserDAO objdao = new UserDAO();
                        UserModel objm = null;

                       objm = objdao.login(name,pwd);    
                       String u = objm.getUusername();
                       String p = objm.getUpassword();




                       if(name.equals(objm.getUusername()) && pwd.equals(objm.getUpassword()))              
                       {
                           HttpSession session = request.getSession();
                            session.setAttribute("UID", objm.getUID());
                            session.setAttribute("User", objm.getUfname());
                            session.setAttribute("Lname", objm.getUlname());
                            session.setAttribute("email", objm.getUemail());
                            session.setAttribute("phone", objm.getUmobile());
                            
                            session.setAttribute("log_flag", "true");
                            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                            rd.forward(request, response);
                       }
                       else
                       {
                           out.print("<script>alert('Username or Password Invalid')</script>");
                          RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                           rd.include(request, response);          
                       }


                }
         }
         catch(SQLException e)
         {
             out.print("<h1>SQL exception error- Connect XAMPP !!</j=h1>");
         }
                
     
               if(btn.equals("Register"))
                {
                    
                      out.print(request.getParameter("btn"));
                      String fname = request.getParameter("txtfname");
                      String lname = request.getParameter("txtlname");
                      String username = request.getParameter("txtusername");
                      String password = request.getParameter("txtpassword");
                      String occupation = request.getParameter("txtoccupation");
                      String dob = request.getParameter("txtdob");
                      String gender = request.getParameter("txtgender");
                      String email = request.getParameter("txtemail");
                      String mobile = request.getParameter("txtmobile");
                      String address = request.getParameter("txtaddress");
                      String pincode = request.getParameter("txtpincode");
                      String state = request.getParameter("txtstate");
                      String city = request.getParameter("txtcity");
                      
                      out.print(fname+" "+lname+" "+username+" "+password+" "+occupation+" "+dob+" "+gender+" "+email+" "+mobile+" "+address+" "+pincode+" "+state+" "+city);
                     
                      UserModel objm = new UserModel();
                      UserDAO objdao = new UserDAO();
                      
                     objm.setUfname(fname);
                     objm.setUaddress(address);
                     objm.setUcity(city);
                     objm.setUemail(email);               
                     objm.setUgender(gender);
                     objm.setUlname(lname);
                     objm.setUmobile(mobile);
                     objm.setUoccupation(occupation);
                     objm.setUpassword(password);
                     objm.setUpincode(pincode);
                     objm.setUstate(state);
                     objm.setUusername(username);
                     objm.setuDOB(dob);
                      
                     int regis_flag = objdao.register(objm);
                    
                     if(regis_flag == 1)
                     {
                         HttpSession s = request.getSession();
                         s.setAttribute("regsucc_flag", "true");
                         out.print("<script>alert('Registed Successfully')</script>");
                         RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                         rd.forward(request, response);
                     }
                     else
                     {
                         out.print("Registration Failed !! Retry again");
                          RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
                          rd.include(request, response);
                     }
                      
                      
                }
               
                out.print(btn);
         
     
           if(btn.equals("searchtrain"))
           {
               out.print(btn);
              out.print(request.getParameter("txtfrom"));
               out.print(request.getParameter("txtto"));out.print(request.getParameter("txtdate"));
               
               
               
               
              
                   
                  TrainModel m = new TrainModel();
                   UserDAO objdao = new UserDAO();
//                   //String tclass = request.getParameter("txtclass");
//                   m.setTfrom(request.getParameter("txtfrom"));
//                   m.setTto(request.getParameter("txtto"));
//                   m.setTdate(request.getParameter("txtdate"));
//                
//                   
// 
//                   
//                 List<TrainModel> ListTrains = objdao.searchTrains(m);
//                 for (int i = 0; i < ListTrains.size(); i++) {
//                 out.println(ListTrains.get(i));
//    }
                 
                 
//                 request.setAttribute("listTrains",ListTrains);
//                 
//                 RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
 //                rd.forward(request, response);
                 
               
               
               String from = request.getParameter("txtfrom");
              
                String to =    request.getParameter("txtto");
                   String date = request.getParameter("txtdate");
                   
                   
                   request.setAttribute("from", from);
                   request.setAttribute("to", to);
                   request.setAttribute("date", date);
                        RequestDispatcher rd = request.getRequestDispatcher("Trainlist.jsp");
                     rd.forward(request, response);
             
               
           }
     
                
                
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
