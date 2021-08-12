<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../error.jsp"
%>

<% 
    try 
    {
        %>
            <select disabled class="captura">
                <option value="0">0</option>
            </select>
        <%
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%> 