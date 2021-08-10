<%@ 
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*"
    import="org.json.simple.JSONObject"
    contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../../error.jsp"
%> 

<%
    try 
    {
        Dual_convocatorias co = new Dual_convocatorias();

        int cve_convocatoria = Integer.parseInt(request.getParameter("p_cve_convocatoria"));

        co.actualizar_vigencia(cve_convocatoria);

        JSONObject json = new JSONObject();
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>