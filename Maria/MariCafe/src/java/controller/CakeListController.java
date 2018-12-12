/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author anhlhnse05444
 */
public class CakeListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

            //Initialize one Cake instance to get data from the database
            ProductDAO pd = new ProductDAO();
            //Get total number of Product in database to process paging
            int totalRows = pd.getNumberOfProduct();

            //Calculate the number of Pages
            int totalPage = (totalRows / pageSize) + (totalRows % pageSize != 0 ? 1 : 0);
            int start = pageSize * (pageIndex - 1) + 1;
            int end = start + pageSize - 1;
            
            //Initialize one Cake instance to get data from the database
            pd = new ProductDAO();
            //Get Product in database having the order from start to end
            ArrayList<Product> lProduct = pd.getList(start, end);
            /*--------------------------------------------------------------------*/

            //Fetch these data to the Cake_list.jsp to display
            request.setAttribute("lists", lProduct);
            request.setAttribute("totalPage", Integer.toString(totalPage));
            request.setAttribute("strPageIndex", strPageIndex);

            request.getRequestDispatcher("cakeList.jsp").forward(request, response);
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(CakeListController.class.getName()).log(Level.SEVERE, null, ex);
            //Forward to the error informing page for client display
            request.getRequestDispatcher("ErrorController").forward(request, response);
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
