<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/cakeList.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            ArrayList<Product> lists = (ArrayList<Product>) request.getAttribute("lists");
            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
            int pageIndex = Integer.parseInt(request.getAttribute("strPageIndex").toString());
        %>

    </head>
    <body>
        <!--Get list fetched from the Controller-->
        <div class="page-wrapper border-round font-settings">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Details"/>
            </jsp:include>

            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site--> 
                    <!--Title of the post-->
                    <div class = "padding-content font-settings">
                        <h4>Cake Lists</h4>
                    </div>
                    <!--Generate a list of cakes taken from database-->
                    <%
                        for (Product p : lists) {
                    %>
                    <!--Post-->  
                    <div class="cake-list-news pad_inside">
                        <!--News-->
                        <div class = "cake-list-content pad_inside font-settings">
                            <!--News'content-->
                            <a href="CakeDetail?productID=<%=p.getId()%>" class = "link_properties">
                                <h5><%=p.getProductName()%></h5>
                            </a>
                            <p>
                                <img src="<%=p.getPhotoName()%>" class="cake-list-image border-round margin-content">
                                <%=p.getShortDescription()%>
                            </p>
                        </div>
                    </div>
                    <hr/>
                    <%}%>

                    <!--Paging-->
                    <div class = "pagination">
                        <!--Create pagination-->
                        <ul>
                            <%=utils.HtmlHelper.pagger(pageIndex, totalPage)%>
                        </ul>                            
                    </div>
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
