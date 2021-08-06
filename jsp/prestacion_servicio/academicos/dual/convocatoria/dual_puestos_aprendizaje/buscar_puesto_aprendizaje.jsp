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
        Dual_puestos_aprendizaje p = new Dual_puestos_aprendizaje();

        p.cve_puesto_aprendizaje= Integer.parseInt(request.getParameter("p_TCvePuestoAprendizaje"));

        p.consultar_puesto_aprendizaje();

        JSONObject json = new JSONObject();
        json.put("cve_puesto_aprendizaje", p.cve_puesto_aprendizaje);
        json.put("anio", p.anio);
        json.put("cve_competencia", p.cve_competencia);
        json.put("nombre_puesto_aprendizaje", p.nombre_puesto_aprendizaje);
        json.put("objetivo_gral", p.objetivo_gral);
        json.put("requerimientos_gral", p.requerimientos_gral);
        json.put("con_teoricos", p.con_teoricos);
        json.put("con_procedimentales", p.con_procedimentales);
        json.put("con_actitudinales", p.con_actitudinales);
        json.put("actvd_desarrollo", p.actvd_desarrollo);
        json.put("vigente", p.vigente);
        out.print(json);
        out.flush();
    }
    catch (Exception e)
    {
        out.print("Wacha el error: " +e);
    }
%>