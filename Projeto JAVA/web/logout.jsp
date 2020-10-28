<%-- 
    Document   : logout
    Created on : 22/09/2020, 11:19:48
    Author     : Claudia
--%>


        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
            %>
 