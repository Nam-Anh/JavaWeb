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
        <h1>The Sushi Restaurant</h1>
        <h2>Welcome to this website</h2>    
    </div>
    <!--Navigation bar-->
    <div class="nav font-settings">
        <!--Menu for home page-->
        <%if (currentPage.equalsIgnoreCase("Home")) {%>
        <ul>
            <li><span id="nav_highlight">Home</span></li>
            <li><a href = "menuController">Menu and Price list</a></li>
            <li><a href = "findSushiController">Find us</a></li>
        </ul>
        <%}%>
        <!--Menu for Menu and Price list page-->
        <%if (currentPage.equalsIgnoreCase("Menu and Price list")) {%>
        <ul>
            <li><a href = "homeController">Home</a></li>
            <li><span id="nav_highlight">Menu and Price list</span></li>
            <li><a href = "findSushiController">Find us</a></li>
        </ul>
        <%}%>
        <!--Menu for Sushi detail page-->
        <%if (currentPage.equalsIgnoreCase("Sushi Details")) {%>
        <ul>
            <li><a href = "homeController">Home</a></li>
            <li><a href = "menuController">Menu and Price list</a></li>
            <li><span id="nav_highlight">Sushi Details</span></li>
            <li><a href = "findSushiController">Find us</a></li>
        </ul>
        <%}%>
        <!--Menu for Find us page-->
        <%if (currentPage.equalsIgnoreCase("Find us")) {%>
        <ul>
            <li><a href = "homeController">Home</a></li>
            <li><a href = "menuController">Menu and Price list</a></li>
            <li><span id="nav_highlight">Find us</span></li>
        </ul>
        <%}%>
        <!--Menu for Error page-->
        <%if (currentPage.equalsIgnoreCase("Error")) {%>
        <ul>
            <li><a href = "homeController">Home</a></li>
            <li><a href = "menuController">Menu and Price list</a></li>
            <li><a href = "findSushiController">Find us</a></li>
            <li><span id="nav_highlight">Error</span></li>
        </ul>
        <%}%>
    </div>

</html>