<%-- 
    Document   : findSushi
    Created on : Oct 29, 2018, 3:21:23 PM
    Author     : anhlhnse05444
--%>

<%@page import="model.SushiInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/findSushi.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <title>Find us</title>
        <!--Data taken from Controller-->
        <%
            SushiInfo inf = (SushiInfo) request.getAttribute("info");
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Find us"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--First Post: Address of Sushi restaurant-->  
                    <div class = "padding-content font-sans-serif">
                        <!--Title of the post-->
                        <h4>Find us</h4>
                        <!--Content of the post-->
                        <div class="f-single_news">
                            <div class="f-vertical-news">
                                <!--News 1-->
                                <div class = "f-ver-content address">
                                    <!--News'content-->
                                    <h5>Address and Contact</h5>
                                    <p><%=inf.getAddress()%></p>
                                    <p>Tel: <%=inf.getTel()%></p>
                                    <p><%=inf.getEmail()%></p>
                                </div>
                            </div>
                            <div class="f-vertical-news">
                                <!--News 2-->
                                <div class = "f-ver-content address">
                                    <!--News'content-->
                                    <h5>Opening hours</h5>
                                    <p><%=inf.getSchedule()%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="horizontal-line"/>
                    <div  class = "padding-content">
                        <!--Insert Map image-->
                        <img src="<%=inf.getPhotoPath()%>" class="map-image">
                    </div>
                    <hr class="horizontal-line"/>
                    <!--Footer-->
                    <jsp:include page="footer.jsp"/>
                </div>
                <!--*********************************************************-->
                <!--Social networks sharing column-->
                <jsp:include page="sharing.jsp"/>
            </div>    
        </div>
    </body>
</html>
