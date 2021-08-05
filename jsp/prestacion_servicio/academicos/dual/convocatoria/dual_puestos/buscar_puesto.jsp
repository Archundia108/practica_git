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
        p.cve_dual_puesto= Integer.parseInt(request.getParameter("p_TCvePuesto"));
        p.consultar_puesto();

        JSONObject json = new JSONObject();

        json.put("cve_dual_puesto", p.cve_dual_puesto);
        json.put("anio", p.anio);
        json.put("cve_puesto_aprendizaje", p.cve_puesto_aprendizaje);
        json.put("nombre_dual_puesto", p.nombre_dual_puesto);
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