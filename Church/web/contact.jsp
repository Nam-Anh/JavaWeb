<%@page import="model.Info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/contact.css">
        <link rel="stylesheet" type="text/css" href="CSS/general.css">
        <title>Contact and location</title>
        <!--Data taken from Controller-->
        <%
            Info info = (Info) request.getAttribute("info");
        %>
    </head>
    <body>
        <div class="page-wrapper border-round">
            <!--Top poster of page-->
            <jsp:include page="header.jsp">
                <jsp:param name="currentPage" value="Contact"/>
            </jsp:include>

            <!--Content section-->
            <div id="content_wrapper">
                <!--Main Content-->
                <div id="content_left_site" class = "col-9">
                    <!--Left Site-->  
                    <!--First Post: Address of Sushi restaurant-->  
                    <div class = "padding-content">
                        <!--Title of the post-->
                        <h4>Contact and location</h4>
                        <!--Content of the post-->
                        <div>
                            <!--News 1-->
                            <h5>Local community church</h5>
                            <table class = "table font-sans-serif">
                                <tr>
                                    <td><p>Address:<p/></td>
                                    <td><p><%=info.getAddress()%></p></td>
                                </tr>
                                <tr>
                                    <td><p>City:</p></td>
                                    <td><p><%=info.getCity()%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Country:</p></td>
                                    <td><p><%=info.getCountry()%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Tel:</p></td>
                                    <td><p><%=info.getTel()%></p></td>
                                </tr>
                                <tr>
                                    <td><p>Email:</p></td>
                                    <td><p><%=info.getEmail()%></p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr class="horizontal-line"/>
                    <div  class = "padding-content">
                        <!--Insert Map image-->
                        <img src="<%=info.getPhotoPath()%>" class="map-image">
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
