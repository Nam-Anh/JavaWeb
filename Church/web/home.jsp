<%-- 
    Document   : home
    Created on : Nov 5, 2018, 10:23:05 AM
    Author     : anhlhnse05444
--%>

<%@page import="model.HomeInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/home.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">

        <title>Home</title>
        <!--Data taken from Controller-->
        <%
            HomeInfo introInfo = (HomeInfo) request.getAttribute("homeInfo");
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
                    <!--Introduction Post: Big Author-->
                    <div class="single_news padding-content">
                        <!--News-->
                        <div class="padding-inside">
                            <!--News'image-->
                            <img src="<%=introInfo.getIntroImage()%>" class = "intro-img border-round">
                        </div>        
                    </div>
                    <hr class="horizontal-line"/>

                    <!--Introduction Description-->
                    <div class="single_news padding-content">
                        <!--News-->
                        <div class="padding-inside intro">
                            <!--News title-->
                            <h5><%=introInfo.getIntroTitle()%></h5>
                            <!--News'content-->
                            <p class="font-sans-serif"><%=introInfo.getIntroDes()%></p>
                        </div>        
                    </div>
                    <hr class="horizontal-line"/>

                    <!--About church news-->
                    <div class="single_news padding-content">
                        <!--News-->
                        <div class = "church-content">
                            <!--News'content-->
                            <h5><%=introInfo.getAboutTitle()%></h5>
                            <p>
                                <!--News'image--> 
                                <img src="<%=introInfo.getAboutImage()%>" class = "church-img border-round">
                                <%=introInfo.getAboutDes()%>
                            </p>
                        </div>        
                    </div>
                    <hr class="horizontal-line"/>

                    <!--Author image-->
                    <div class="author">
                        <table>
                            <tr>
                                <td>
                                    <!--Author image-->
                                    <div>
                                        <img src="<%=introInfo.getAuthorImage()%>" class = "author-img border-round">
                                    </div>
                                </td>
                                <td align="align-bottom">
                                    <!--Author signature-->
                                    <div id="author-signature" class="font-sans-serif">
                                        <p id="kind-font">Kind Regards</p>
                                        <p id="sign"><%=introInfo.getAuthorName()%></p>
                                    </div>
                                </td>
                            </tr>
                        </table>
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
