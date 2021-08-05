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
        Dual_puestos_empresa pe = new Dual_puestos_empresa();

        pe.cve_empresa = Integer.parseInt(request.getParameter("p_cve_empresa"));
        pe.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

        pe.eliminar_puesto_empresa();

        JSONObject json = new JSONObject();
        json.put("error", pe.error);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>