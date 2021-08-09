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

        co.fecha_inicio = request.getParameter("p_fecha_inicio");
        co.fecha_termino = request.getParameter("p_fecha_termino");
        co.descripcion = request.getParameter("p_descripcion");
        co.vigente = Integer.parseInt(request.getParameter("p_vigente"));
        co.cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));

        co.registra_convocatoria();

        JSONObject json = new JSONObject();
        json.put("error", co.error);
        json.put("cve_convocatoria", co.cve_convocatoria);
        out.print(json);
        out.flush();
    } 
    catch (Exception e)
    {
        out.print("Wacha el error: " +e);
    }
%>