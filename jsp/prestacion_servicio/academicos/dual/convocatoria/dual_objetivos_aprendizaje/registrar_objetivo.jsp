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
        Dual_objetivos_aprendizaje ob = new Dual_objetivos_aprendizaje();

        ob.objetivo = request.getParameter("p_objetivo");
        ob.resultado = request.getParameter("p_resultado");
        ob.cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));
        ob.anio = Integer.parseInt(request.getParameter("p_anio"));

        ob.registrar_objetivo_aprendizaje();

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