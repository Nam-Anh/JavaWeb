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
        <link rel="stylesheet" type="text/css" href="CSS/home.css" href="CSS/general.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            Info info = (Info) request.getAttribute("info");
        %>
    </head>
    <body>
        <div class="page-wrapper border-round font-settings">
            <!--Top poster of page-->
            <jsp:include page="../header.jsp"/>

            <!--Navigation bar-->
            <div class="nav">
                <ul>
                    <li><a href = "HomeController">Home</a></li>
                    <li><a href = "CakeListController">About my cakes</a></li>
                    <li><a href = "FindMariaCafe">Find Maria's Cafe</a></li>
                    <li><span id="nav_highlight">Error</span></li>
                </ul>
            </div>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--First Post-->  
                    <div class="single_news pad_inside">
                        <!--News-->
                        <div class = "content pad_inside">
                            <!--News'content-->
                            <p>
                                Server is in maintenance. Sorry for this inconvenience
                            </p>
                        </div>
                    </div>
                    <hr/>
                    
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
