<%@page import="model.Info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/findMariCafe.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            Info inf = (Info) request.getAttribute("info");
        %>

    </head>
    <body>
        <div class="page-wrapper border-round font-settings">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Find"/>
            </jsp:include>


            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--First Post: Address of Mari's Cafe-->  
                    <div class = "padding-content">
                        <!--Title of the post-->
                        <h4>Find Mari's Cafe</h4>
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
                    <hr/>
                    <div  class = "padding-content">
                        <!--Insert Map image-->
                        <img src="<%=inf.getPhotoPath()%>" class="map-image">
                    </div>    

                    <hr/>
                    <!--Footer-->
                    <jsp:include page="footer.jsp"/>
                </div>
                <!--*********************************************************-->  
                <!--Social networks sharing column-->
                <jsp:include page="sharing.jsp"/>
            </div>
        </div>    
    </div>
</body>
</html>
