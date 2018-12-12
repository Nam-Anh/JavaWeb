<%@page import="java.util.ArrayList"%>
<%@page import="model.Sushi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <link rel="stylesheet" type="text/css" href="CSS/home.css">
        <title>Home</title>

        <!--Data taken from Controller-->
        <%
            ArrayList<Sushi> lists = (ArrayList<Sushi>) request.getAttribute("lists");
            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
            int pageIndex = Integer.parseInt(request.getAttribute("strPageIndex").toString());
            
            Sushi introSushi = (Sushi) request.getAttribute("introSushi");    
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
                    <!--Introduction Post: Big Sushi-->
                    <div class="single_news padding-content">
                        <!--News-->
                        <div class="padding-inside">
                            <!--News'content-->
                            <a href="sushiDetails?sushiID=<%=introSushi.getId()%>" class = "link_properties">
                                <img src="<%=introSushi.getPhotoName()%>" class = "intro-img border-round">
                            </a>
                        </div>        
                    </div>
                    <hr class="horizontal-line"/>
                    <!--List of sushi rolls-->
                    <%for(Sushi su : lists){%>
                    <div class="single_news padding-content">
                        <!--News-->
                        <div class = "sushi-content">
                            <!--News'content-->
                            <a href="sushiDetails?sushiID=<%=su.getId()%>" class = "link_properties font-sans-serif">
                                <h5><%=su.getName()%></h5>
                            </a>
                            <p>
                                <!--News'image--> 
                                <img src="<%=su.getPhotoName()%>" class = "sushi-img border-round">
                                <%=su.getShortDescription()%>
                            </p>
                        </div>        
                    </div>
                    <hr class="horizontal-line"/>
                    <%}%>
                    <!--Paging-->
                    <div class = "pagination">
                        <!--Create pagination-->
                        <ul>
                            <%=utils.HtmlHelper.pagger(pageIndex, totalPage, "homeController")%>
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
