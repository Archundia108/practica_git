<%@ page language="java" 
    contentType="application/json; charset=UTF-8" 
    pageEncoding="UTF-8"
    import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" 
    errorPage="../../../../../../error.jsp"
    import="org.json.simple.JSONObject"
%> 

<%
    try 
    {
        Dual_alumnos al = new Dual_alumnos();

        al.cve_alumno = Integer.parseInt(request.getParameter("p_cve_alumno"));
        
        al.eliminar_alumno_propuesto();

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