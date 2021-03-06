/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.SushiDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Sushi;

/**
 *
 * @author anhlhnse05444
 */
public class homeController extends HttpServlet {

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
            //Initialize one Sushi instance to get data from the database
            SushiDAO sd = new SushiDAO();
            //Get the intro sushi from database
            Sushi introSushi = sd.getByID(0);

            /*---------------------------PAGINATION-------------------------------*/
            
            //Get page attributes parameters from the web configuration web.xml
            String strPageSize = this.getServletConfig().getInitParameter("pageSize");
            int pageSize = Integer.parseInt(strPageSize);
            //Get PageIndex from the request web page
            //If this is first time accessing this page, the default is 1
            String strPageIndex = request.getParameter("page");
            if (strPageIndex == null) {
                strPageIndex = "1";
            }
            int pageIndex = Integer.parseInt(strPageIndex);

            //Initialize one Sushi instance to get data from the database
            sd = new SushiDAO();
            //Get total number of Sushi in database to process paging
            int totalRows = sd.getNumberOfSushi();

            //Calculate the number of Pages
            int totalPage = (totalRows / pageSize) + (totalRows % pageSize != 0 ? 1 : 0);
            int start = pageSize * (pageIndex - 1) + 1;
            int end = start + pageSize - 1;

            //Initialize one SushiDao instance to get data from the database
            sd = new SushiDAO();
            //Get Sushi in database having the order from start to end
            ArrayList<Sushi> lSushi = sd.getList(start, end);
            //Log error
            Logger.getLogger(homeController.class.getName()).log(Level.SEVERE, null, "");

            /*--------------------------------------------------------------------*/
            //Fetch these data to the home.jsp to display
            request.setAttribute("introSushi", introSushi);
            request.setAttribute("lists", lSushi);
            request.setAttribute("totalPage", Integer.toString(totalPage));
            request.setAttribute("strPageIndex", strPageIndex);

            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(homeController.class.getName()).log(Level.SEVERE, null, ex);
            //Redirect to errorPage
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
