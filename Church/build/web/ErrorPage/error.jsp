<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/error.css">
        <link rel="stylesheet" type="text/css" href="../CSS/general.css">

        <title>Error</title>
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
                    <!--Informing about error-->
                    <!--Inform error-->
                    <div class="padding-content font-sans-serif">
                        <p>Server is in maintenance. Sorry for this inconvenience</p>
                    </div>
                </div>
                <!--*********************************************************-->
                <!--Social networks sharing column-->
                <jsp:include page="../sharing.jsp"/>
            </div> 
            <!--Footer-->
            <jsp:include page="../footer.jsp"/>
        </div>
    </body>
</html>
