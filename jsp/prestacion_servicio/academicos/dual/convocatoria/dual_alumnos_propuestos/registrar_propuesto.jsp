<%@ page language="java" 
    contentType="application/json; charset=UTF-8" 
    pageEncoding="UTF-8"
    import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*, comun.*" 
    errorPage="../../../../../../error.jsp"
    import="org.json.simple.JSONObject"
%> 

<%
    try 
    {
        Dual_alumnos al = new Dual_alumnos();

        al.exp_alumno = request.getParameter("p_exp_alumno");
        al.cve_tutor = Integer.parseInt(request.getParameter("p_cve_usuario"));
        al.cve_convocatoria = Integer.parseInt(request.getParameter("p_cve_convocatoria"));
        
        al.registrar_alumno_propuesto();

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