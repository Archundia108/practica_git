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

        co.cve_convocatoria= Integer.parseInt(request.getParameter("p_cve_convocatoria"));

        co.consultar_convocatoria();

        JSONObject json = new JSONObject();
        json.put("cve_convocatoria", co.cve_convocatoria);
        json.put("fecha_inicio", co.fecha_inicio);
        json.put("fecha_termino", co.fecha_termino);
        json.put("descripcion", co.descripcion);
        json.put("vigente", co.vigente);
        json.put("cve_competencia", co.cve_competencia);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>