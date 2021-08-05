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
        ob.numero = Integer.parseInt(request.getParameter("p_numero"));
        ob.consultar_obj();

        JSONObject json = new JSONObject();

        json.put("numero", ob.numero);
        json.put("objetivo", ob.objetivo);
        json.put("resultado", ob.resultado);

        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%>