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

        p.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_CvePuestoAprendizaje"));
        p.nombre_puesto_aprendizaje = request.getParameter("p_NomPuestoAprendizaje");
        p.objetivo_gral = request.getParameter("p_ObjetivoGral");
        p.requerimientos_gral = request.getParameter("p_RequerimientosGral");
        p.con_teoricos = request.getParameter("p_Teoricos");
        p.con_procedimentales = request.getParameter("p_Procedimentales");
        p.con_actitudinales = request.getParameter("p_Actitudinales");
        p.actvd_desarrollo = request.getParameter("p_ActvdDesarrollo");
        p.vigente = Integer.parseInt(request.getParameter("p_Vigente"));
        p.cve_competencia = Integer.parseInt(request.getParameter("p_CveCompetencia"));

        p.actualizar_puesto_aprendizaje(p.cve_puesto_aprendizaje);

        JSONObject json = new JSONObject();
        json.put("error", p.error);
        out.print(json);
        out.flush();
    } 
    catch (Exception e)
    {
        out.print("Wacha el error: " +e);
    }
%>