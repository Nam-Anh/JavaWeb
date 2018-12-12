<%@page import="model.Prayer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/prayerDetails.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <title>Prayer Details</title>
        <%
            Prayer prayer = (Prayer) request.getAttribute("prayer");
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="PrayerDetails"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Introduction Post: Prayer restaurant-->
                    <div class="pad_inside">
                        <!--News-->
                        <div class = "prayer-list-content pad_inside">
                            <!--News'content-->
                            <h5><%=prayer.getPrayerTitle()%></h5>
                            <p class="font-sans-serif">
                                <img src="<%=prayer.getPrayerPhoto()%>" class="prayer-list-image border-round margin-content">
                                <%=prayer.getPrayerDes()%>
                            </p>
                        </div>
                    </div>


                </div>
                <!--*********************************************************-->
                <!--Social networks sharing column-->
                <jsp:include page="sharing.jsp"/>
            </div> 
            <!--Footer-->
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
