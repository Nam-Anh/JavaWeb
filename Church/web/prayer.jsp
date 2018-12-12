<%-- 
    Document   : prayers
    Created on : Nov 5, 2018, 10:23:41 AM
    Author     : anhlhnse05444
--%>

<%@page import="model.HomeInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Prayer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prayers</title>
        <link rel="stylesheet" type="text/css" href="CSS/prayer.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <!--Data taken from Controller-->
        <%
            ArrayList<Prayer> lists = (ArrayList<Prayer>) request.getAttribute("lists");
            HomeInfo intro = (HomeInfo) request.getAttribute("introInfo");
            int totalPage = Integer.parseInt((String) request.getAttribute("totalPage"));
            int pageIndex = Integer.parseInt((String) request.getAttribute("strPageIndex"));
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="PrayerList"/>
            </jsp:include>

            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site--> 
                    <!--Title of the post-->
                    <div class = "padding-content font-settings">
                        <h5><%=intro.getIntroTitle()%></h4>
                            <p class="font-sans-serif">
                                <%=intro.getIntroDes()%>
                            </p>
                    </div>
                    <hr class="horizontal-line"/>
                    <!--Generate a list of prayers taken from database-->
                    <%
                        int i = 0;
                        for (Prayer prayer : lists) {
                            i++;
                    %>
                    <!--Post-->  
                    <div class="prayer-list-news pad_inside">
                        <!--News-->
                        <div class = "prayer-list-content pad_inside font-settings">
                            <!--News'content-->
                            <a href="prayerDetails?prayerID=<%=prayer.getId()%>" class = "link_properties">
                                <h5><%=prayer.getPrayerTitle()%></h5>
                            </a>
                            <p class="font-sans-serif">
                                <img src="<%=prayer.getPrayerPhoto()%>" class="prayer-list-image border-round margin-content">
                                <%=prayer.getPrayerDes()%>
                            </p>
                        </div>
                    </div>
                    <!--Don't display hr with the last element--> 
                    <%if (i < (lists.size() - 1)) {%>
                    <hr class="horizontal-line"/>
                    <%}%>
                    <%}%>

                    <!--Paging-->
                    <div class = "pagination">
                        <!--Create pagination-->
                        <ul>
                            <%=utils.HtmlHelper.pagger(pageIndex, totalPage, "prayer")%>
                        </ul>                            
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
