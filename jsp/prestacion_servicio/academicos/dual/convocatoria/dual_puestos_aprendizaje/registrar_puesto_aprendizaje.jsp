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
        Dual_puestos_aprendizaje p = new Dual_puestos_aprendizaje();

        p.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_TCveAprendizaje"));
        p.nombre_puesto_aprendizaje = request.getParameter("p_TNombreAprendizaje");
        p.cve_carrera = Integer.parseInt(request.getParameter("p_SCarrera"));

        p.registrar_puesto_aprendizaje();

        JSONObject json = new JSONObject();
        json.put("error", p.error);
        json.put("cve_puesto_aprendizaje", p.cve_puesto_aprendizaje);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>