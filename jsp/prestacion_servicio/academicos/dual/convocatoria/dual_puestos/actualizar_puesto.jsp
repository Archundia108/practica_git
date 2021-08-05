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
        Dual_puestos p = new Dual_puestos();

        p.cve_dual_puesto = Integer.parseInt(request.getParameter("p_cve_dual_puesto"));
        p.nombre_dual_puesto = request.getParameter("p_NomPuesto");
        p.objetivo_gral = request.getParameter("p_ObjetivoGral");
        p.requerimientos_gral = request.getParameter("p_RequerimientosGral");
        p.con_teoricos = request.getParameter("p_Teoricos");
        p.con_procedimentales = request.getParameter("p_Procedimentales");
        p.con_actitudinales = request.getParameter("p_Actitudinales");
        p.actvd_desarrollo = request.getParameter("p_ActvdDesarrollo");
        p.vigente = Integer.parseInt(request.getParameter("p_Vigente"));
        p.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_CvePuestoAprendizaje"));

        p.actualizar_puesto(p.cve_dual_puesto);

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