<%-- 
    Document   : header
    Created on : Oct 29, 2018, 1:58:42 PM
    Author     : anhlhnse05444
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            String currentPage = (String) request.getParameter("currentPage");
        %>
    </head>
    <div id="header" class="font-settings">
        <!--Header--> 
        <h1>Maria Bagnarelli's Cafe</h1>
        <h2>Welcome to my website</h2>    
    </div>
    <!--Navigation bar-->
    <div class="nav font-settings">
        <!--Menu for home page-->
        <%if (currentPage.equalsIgnoreCase("Home")) {%>
        <ul>
            <li><span id="nav_highlight">Home</span></li>
            <li><a href = "CakeListController">About my cakes</a></li>
            <li><a href = "FindMariaCafe">Find Maria's Cafe</a></li>
        </ul>
        <%}%>
        <!--Menu for Cake list page-->
        <%if (currentPage.equalsIgnoreCase("Details")) {%>
        <ul>
            <li><a href = "HomeController">Home</a></li>
            <li><span id="nav_highlight">About my cakes</span></li>
            <li><a href = "FindMariaCafe">Find Maria's Cafe</a></li>
        </ul>
        <%}%>
        <!--Menu for Find Maria's Cafe list page-->
        <%if (currentPage.equalsIgnoreCase("Find")) {%>
        <ul>
            <li><a href = "HomeController">Home</a></li>
            <li><a href = "CakeListController">About my cakes</a></li>
            <li><span id="nav_highlight">Find Maria's Cafe</span></li>
        </ul>
        <%}%>
    </div>

</html>