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
        <title>Header Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from -->
        <%
            String currentPage = (String) request.getParameter("currentPage");
        %>
    </head>
    <div id="header" class="font-settings">
        <div class="banner-icon">
            <!--Display the icon image-->
        </div>
        <div class="banner-title">
            <!--Header--> 
            <h1>Local Community Church</h1>
            <h2>Welcome to our website</h2>    
        </div>
    </div>
    <!--Navigation bar-->
    <div class="nav font-settings">
        <!--Menu for home page-->
        <%if (currentPage.equalsIgnoreCase("Home")) {%>
        <ul>
            <li><span class="nav_highlight">Home</span></li>
            <li><a href = "prayer">Prayers</a></li>
            <li><a href = "service">Services</a></li>
            <li><a href = "contact">Contact and location</a></li>
        </ul>
        <%}%>
        <!--Menu for prayer list page-->
        <%if (currentPage.equalsIgnoreCase("PrayerList")) {%>
        <ul>
            <li><a href = "home">Home</a></li>
            <li><span class="nav_highlight">Prayers</span></li>
            <li><a href = "service">Services</a></li>
            <li><a href = "contact">Contact and location</a></li>
        </ul>
        <%}%>
        <!--Menu for service page-->
        <%if (currentPage.equalsIgnoreCase("Service")) {%>
        <ul>
            <li><a href = "home">Home</a></li>
            <li><a href = "prayer">Prayers</a></li>
            <li><span class="nav_highlight">Services</span></li>
            <li><a href = "contact">Contact and location</a></li>
        </ul>
        <%}%>
        <!--Menu for prayer details page-->
        <%if (currentPage.equalsIgnoreCase("PrayerDetails")) {%>
        <ul>
            <li><a href = "home">Home</a></li>
            <li><a href = "prayer">Prayers</a></li>
            <li><span class="nav_highlight">Prayers Details</span></li>
            <li><a href = "service">Services</a></li>
            <li><a href = "contact">Contact and location</a></li>
        </ul>
        <%}%>
        <!--Menu for contact page-->
        <%if (currentPage.equalsIgnoreCase("Contact")) {%>
        <ul>
            <li><a href = "home">Home</a></li>
            <li><a href = "prayer">Prayers</a></li>
            <li><a href = "service">Services</a></li>
            <li><span class="nav_highlight">Contact and location</span></li>
        </ul>
        <%}%>
        <!--Menu for Error page-->
        <%if (currentPage.equalsIgnoreCase("Error")) {%>
        <ul>
            <li><a href = "home">Home</a></li>
            <li><a href = "prayer">Prayers</a></li>
            <li><a href = "service">Services</a></li>
            <li><a href = "contact">Contact and location</a></li>
            <li><span class="nav_highlight">Error</span></li>
        </ul>
        <%}%>
    </div>

</html>