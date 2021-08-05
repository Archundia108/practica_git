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
        Dual_obj_result ob = new Dual_obj_result();

        ob.objetivo = request.getParameter("p_objetivo");
        ob.resultado = request.getParameter("p_resultado");
        ob.cve_dual_puesto = Integer.parseInt(request.getParameter("p_cve_dual_puesto"));
        ob.anio = Integer.parseInt(request.getParameter("p_anio"));

        ob.registrar_obj();

        JSONObject json = new JSONObject();
        json.put("error", ob.error);
        json.put("numero", ob.numero);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>