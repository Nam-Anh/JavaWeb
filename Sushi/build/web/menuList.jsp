<%-- 
    Document   : menuList
    Created on : Oct 29, 2018, 3:21:03 PM
    Author     : anhlhnse05444
--%>

<%@page import="model.SushiMenu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <link rel="stylesheet" type="text/css" href="CSS/menuList.css">
        <title>Menu and Price list</title>
        <!--Data taken from Controller-->
        <%
            ArrayList<SushiMenu> lists = (ArrayList<SushiMenu>) request.getAttribute("lists");
            int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
            int pageIndex = Integer.parseInt(request.getAttribute("strPageIndex").toString());
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Menu and Price list"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--Title of page-->
                    <div class = "padding-content font-settings">
                        <h4>Menu and Price list</h4>
                    </div>
                    <!--List of menus-->
                    <%for (int i = 0; i < lists.size(); i++) {
                            SushiMenu menu = lists.get(i);
                    %>
                    <div class="menuDiv padding-content">
                        <div>
                            <table class="table">
                                <tr>
                                    <td><%=menu.getName()%></td>
                                    <td align="right">Price</td>
                                </tr>
                                <tr>
                                    <td><%=menu.getShortDescription()%></td>
                                    <td align="right"><%=menu.getPrice()%></td>
                                </tr>
                            </table>
                            <p class="menuDes">
                                <%=menu.getDescription()%>
                            </p>
                        </div>
                        <%if (i < lists.size() - 1) {%>
                        <hr/>
                        <%}%>
                    </div>
                    <%}%>
                    <!--The line to seperate menu list and footer part-->
                    <div class="menuDiv padding-content">
                        <hr/>
                    </div>
                    <!--Paging-->
                    <div class = "pagination">
                        <!--Create pagination-->
                        <ul>
                            <%=utils.HtmlHelper.pagger(pageIndex, totalPage, "menuController")%>
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
