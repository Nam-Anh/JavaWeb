<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/aboutMyCakeDetail.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <%
            Product p = (Product) (request.getAttribute("product"));
            if(p == null){
        %>
            <jsp:forward page="ErrorController"></jsp:forward>
        <%
            }
        %>
    </head>
    <body>
        <div class="page-wrapper border-round font-settings">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Details"/>
            </jsp:include>

            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--First Post-->  
                    <div class="cake-list-news pad_inside">
                        <!--News-->
                        <div class = "cake-list-content pad_inside">
                            <!--News'content-->
                            <h5><%=p.getProductName()%></h5>
                            <p>
                                <img src="<%=p.getPhotoName()%>" class="cake-list-image border-round margin-content">
                                <%=p.getDescription()%>
                            </p>
                        </div>
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
