/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.InfoDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Info;
import model.Product;

/**
 *
 * @author anhlhnse05444
 */
//@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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
            //Initialize one ProductDAO instance to get data from the database
            ProductDAO pd = new ProductDAO();
            //Get the introduction cake
            Product introProduct = pd.getByID(0);
            //Initialize one ProductDAO instance to get data from the database
            pd = new ProductDAO();
            //Get two latest products
            ArrayList<Product> productArray = pd.getTwoMostUpdated();
            
            //Initialize one InfoDAO instance to get data from the database
            InfoDAO ifDao = new InfoDAO();
            //Get the info of home page
            Info info = ifDao.getByID(1);
            
            //Fetch these data to the home.jsp to display
            request.setAttribute("introProduct", introProduct);
            request.setAttribute("twoLatest", productArray);
            request.setAttribute("info", info);
            
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
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
