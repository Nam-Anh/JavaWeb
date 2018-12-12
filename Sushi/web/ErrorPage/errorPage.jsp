<%-- 
    Document   : errorPage
    Created on : Oct 29, 2018, 3:22:14 PM
    Author     : anhlhnse05444
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/general.css">

    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="../header.jsp">
                <jsp:param name="currentPage" value="Error"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Inform error-->
                    <div class="padding-content font-sans-serif">
                        <p>Server is in maintenance. Sorry for this inconvenience</p>
                    </div>
                    <hr class="horizontal-line"/>
                    <!--Footer-->
                    <jsp:include page="../footer.jsp"/>
                </div>
                <!--*********************************************************-->
                <!--Social networks sharing column-->
                <jsp:include page="../sharing.jsp"/>
            </div>    
        </div>
    </body>
</html>
