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
        Dual_empresas pe = new Dual_empresas();

        pe.cve_empresa = Integer.parseInt(request.getParameter("p_SEmpresa"));
        pe.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

        pe.registrar_empresa();

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