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
        Dual_competencias p = new Dual_competencias();

        p.cve_competencia = Integer.parseInt(request.getParameter("p_TCveCompetencia"));

        p.consultar_competencia();

        JSONObject json = new JSONObject();
        json.put("cve_competencia", p.cve_competencia);
        json.put("nombre_competencia", p.nombre_competencia);
        json.put("cve_carrera", p.cve_carrera);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>