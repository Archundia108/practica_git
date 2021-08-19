<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="" import="org.json.simple.JSONObject"%>
<%
try
{
	revision_propuestos EBD=new revision_propuestos();
	
	EBD.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
	EBD.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
	EBD.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));
	
	EBD.FFechaNotificacion();
	
	
	JSONObject json=new JSONObject();
	json.put("error",EBD.error);
	

	out.print(json);
	out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>