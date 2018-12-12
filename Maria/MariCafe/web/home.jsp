<%@page import="model.Info"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/home.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            ArrayList<Product> lists = (ArrayList<Product>) request.getAttribute("twoLatest");
            Product p = (Product) request.getAttribute("introProduct");
            Info info = (Info) request.getAttribute("info");
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Home"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Introduction Post: Maria cafe-->
                    <div class="single_news pad_inside">
                        <!--News-->
                        <div class = "intro-content pad_inside">
                            <!--News'content-->
                            <a href="CakeDetail?productID=<%=p.getId()%>" class = "link_properties">
                                <h5><%=p.getProductName()%></h5>
                            </a>
                            <p>
                                <!--News'image--> 
                                <img src="<%=p.getPhotoName()%>" class = "intro-img border-round">
                                <%=p.getDescription()%>
                            </p>
                        </div>        

                    </div>
                    <hr/>
                    <!--Second Post-->  
                    <div class="single_news">
                        <!--Generate a list of 2 latest cakes taken from database-->
                        <%
                            for (Product product : lists) {
                        %>
                        <div class="vertical-news">
                            <!--News 1-->
                            <div class="ver-image">
                                <!--News'image-->   
                                <img src = "<%=product.getPhotoName()%>" class="border-round">
                            </div>
                            <div class = "ver-content">
                                <!--News'content-->
                                <a href="CakeDetail?productID=<%=product.getId()%>" class = "link_properties">
                                    <h5><%=product.getProductName()%></h5>
                                </a>
                                <p class="font-sans-serif">
                                    <%=product.getDescription()%>
                                </p>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <hr/>
                    <!--Visit Page--> 
                    <div id="visit_info" class="content font-settings">
                        <h5>Visit my cafe</h5>
                        <p><%=info.getAddress()%></p>
                        <p><%=info.getTel()%></p>
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
    </body>
</html>
