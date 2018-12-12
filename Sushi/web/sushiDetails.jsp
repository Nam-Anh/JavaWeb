<%-- 
    Document   : sushiDetails.jsp
    Created on : Oct 31, 2018, 5:16:07 PM
    Author     : anhlhnse05444
--%>

<%@page import="model.Sushi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/sushiDetails.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <title>Sushi Details</title>
        <%
            Sushi sushi = (Sushi) (request.getAttribute("sushi"));
            if(sushi == null){
        %>
            <jsp:forward page="ErrorController"></jsp:forward>
        <%
            }
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Sushi Details"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Introduction Post: Sushi restaurant-->
                    <div class="pad_inside">
                        <!--News-->
                        <div class = "sushi-list-content pad_inside">
                            <!--News'content-->
                            <h5><%=sushi.getName()%></h5>
                            <p class="font-sans-serif">
                                <img src="<%=sushi.getPhotoName()%>" class="sushi-list-image border-round margin-content">
                                <%=sushi.getDes()%>
                            </p>
                        </div>
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
