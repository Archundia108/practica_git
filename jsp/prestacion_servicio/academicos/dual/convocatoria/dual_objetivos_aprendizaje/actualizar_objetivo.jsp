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
        Dual_objetivos_aprendizaje ob = new Dual_objetivos_aprendizaje();

        ob.numero = Integer.parseInt(request.getParameter("p_numero"));
        ob.objetivo = request.getParameter("p_objetivo");
        ob.resultado = request.getParameter("p_resultado");
        ob.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));
        ob.anio = Integer.parseInt(request.getParameter("p_anio"));

        ob.actualizar_objetivo_aprendizaje(ob.numero);

        JSONObject json = new JSONObject();
        json.put("error", ob.error);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>