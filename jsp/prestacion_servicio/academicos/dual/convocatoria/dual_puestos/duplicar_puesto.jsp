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

        p.duplicar_puesto(p.cve_dual_puesto);

        JSONObject json = new JSONObject();
        json.put("error", p.error);
        json.put("cve_dual_puesto", p.cve_dual_puesto);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>