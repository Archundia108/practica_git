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
        Dual_alumnos al = new Dual_alumnos();

        al.cve_alumno = Integer.parseInt(request.getParameter("p_cve_alumno"));

        al.notificar_alumno_propuesto();

        JSONObject json = new JSONObject();
        json.put("error", al.error);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>