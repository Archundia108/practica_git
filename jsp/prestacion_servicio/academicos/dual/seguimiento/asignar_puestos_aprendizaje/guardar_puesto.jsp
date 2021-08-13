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
        Asignar_puestos_aprendizaje apa = new Asignar_puestos_aprendizaje();

        apa.cve_alummo = Integer.parseInt(request.getParameter("p_cve_alummo"));
        apa.cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));
        apa.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));
        apa.orden = Integer.parseInt(request.getParameter("p_orden"));

        apa.guardar_puesto();

        JSONObject json = new JSONObject();
        json.put("error", apa.error);
        out.print(json);
        out.flush();
    }
    catch (Exception e)
    {
        out.print("Wacha el error: " +e);
    }
%>