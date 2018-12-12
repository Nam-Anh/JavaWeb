/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.PrayerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prayer;

/**
 *
 * @author anhlhnse05444
 */
public class prayerDetailsController extends HttpServlet {

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
        try {
            //Create instance PrayerDAO to connect to database
            PrayerDAO pd = new PrayerDAO();
            //Get the Id of the prayer users want to view
            String strID = (String) request.getParameter("prayerID");
            if(strID == null){
                strID = "1";
            }
            int id = Integer.parseInt(strID);
            //Get by Id
            Prayer prayer = pd.getByID(id);

            //If prayer is null, forward to error page
            if (prayer != null) {
                //Pass prayer to the PrayerDetail Page
                request.setAttribute("prayer", prayer);
                request.getRequestDispatcher("prayerDetails.jsp").forward(request, response);

            } else {
                Exception e = new Exception("Can not get data out of database");
                //Log error
                Logger.getLogger(prayerDetailsController.class.getName()).log(Level.SEVERE, null, e);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(prayerDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            //Forward to the error informing page for client display
            response.sendRedirect("errorController");
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
