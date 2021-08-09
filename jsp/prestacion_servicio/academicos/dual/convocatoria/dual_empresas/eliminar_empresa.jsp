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
        Dual_empresas pe = new Dual_empresas();

        pe.cve_empresa = Integer.parseInt(request.getParameter("p_cve_empresa"));
        pe.cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));

        pe.eliminar_empresa();

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