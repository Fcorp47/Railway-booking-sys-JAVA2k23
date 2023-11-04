/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.RTS.DAO.UserDAO;
import com.RTS.Model.TrainModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class UpdateStack extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
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
                response.sendRedirect("./admin/addtrain.jsp?upid=1");
            }
            else
            {
                out.print("update failed");
                response.sendRedirect("./admin/addtrain.jsp?upid=0");
            }
            
            
          //  response.sendRedirect("./admin/addtrain.jsp");
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStack</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStack at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
