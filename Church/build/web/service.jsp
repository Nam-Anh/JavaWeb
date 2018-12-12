
<%@page import="model.Service"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <link rel="stylesheet" type="text/css" href="CSS/service.css">
        <title>Services</title>
        <!--Data taken from Controller-->
        <%
            ArrayList<Service> lists = (ArrayList<Service>) request.getAttribute("lists");
            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
            int pageIndex = Integer.parseInt(request.getAttribute("strPageIndex").toString());
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Service"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Title of page-->
                    <div class = "padding-content font-settings">
                        <h4>Services</h4>
                    </div>
                    <!--List of services-->
                    <%for (int i = 0; i < lists.size(); i++) {
                            Service service = lists.get(i);
                    %>
                    <div class="serviceDiv padding-content">
                        <div>
                            <table class="table">
                                <tr>
                                    <td class="service-shedule">
                                        <p class="font-sans-serif"><%=service.getSchedule()%></p>
                                    </td>
                                    <td align="left">
                                        <h5><%=service.getName()%></h5>
                                        <p class="font-sans-serif"><%=service.getDescription()%></p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%}%>
                    <!--The line to seperate service list and footer part-->
                    <!--Paging-->
                    <div class = "pagination">
                        <!--Create pagination-->
                        <ul>
                            <%=utils.HtmlHelper.pagger(pageIndex, totalPage, "service")%>
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
