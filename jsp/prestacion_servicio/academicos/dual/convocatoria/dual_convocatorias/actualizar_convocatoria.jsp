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
        Dual_convocatorias co = new Dual_convocatorias();

        int cve_convocatoria = Integer.parseInt(request.getParameter("p_cve_convocatoria"));
        co.fecha_inicio = request.getParameter("p_fecha_inicio");
        co.fecha_termino = request.getParameter("p_fecha_termino");
        co.descripcion = request.getParameter("p_descripcion");
        co.vigente = Integer.parseInt(request.getParameter("p_vigente"));
        co.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

        co.actualizar_convocatoria(cve_convocatoria);

        JSONObject json = new JSONObject();
        json.put("error", co.error);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>