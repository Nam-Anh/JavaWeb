/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.MenuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SushiMenu;

/**
 *
 * @author anhlhnse05444
 */
public class menuController extends HttpServlet {

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

            //Initialize one MenuDAO instance to get data from the database
            MenuDAO md = new MenuDAO();
            //Get total number of Menu in database to process paging
            int totalRows = md.getNumberOfMenu();

            //Calculate the number of Pages
            int totalPage = (totalRows / pageSize) + (totalRows % pageSize != 0 ? 1 : 0);
            int start = pageSize * (pageIndex - 1) + 1;
            int end = start + pageSize - 1;
            
            //Initialize one MenuDAO instance to get data from the database
            md = new MenuDAO();
            //Get Menu in database having the order from start to end
            ArrayList<SushiMenu> lMenu = md.getList(start, end);
            /*--------------------------------------------------------------------*/

            //Fetch these data to the menuList.jsp to display
            request.setAttribute("lists", lMenu);
            request.setAttribute("totalPage", Integer.toString(totalPage));
            request.setAttribute("strPageIndex", strPageIndex);

            request.getRequestDispatcher("menuList.jsp").forward(request, response);
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(menuController.class.getName()).log(Level.SEVERE, null, ex);
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
