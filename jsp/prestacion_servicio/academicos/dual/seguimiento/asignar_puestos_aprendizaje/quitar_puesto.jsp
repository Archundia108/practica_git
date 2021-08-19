<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*"
    import="org.json.simple.JSONObject"
    contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage=""
%>

<%
    try
    {
        Asignar_puestos_aprendizaje apa = new Asignar_puestos_aprendizaje();

        apa.cve_alummo = Integer.parseInt(request.getParameter("p_cve_alumno"));
        apa.cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));
        apa.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

        apa.quitar_puesto();

        JSONObject json = new JSONObject();
        json.put("error", apa.error);
        out.print(json);
        out.flush();
    }
    catch (Exception e)
    {
        out.print("error: " +e);
    }
%>