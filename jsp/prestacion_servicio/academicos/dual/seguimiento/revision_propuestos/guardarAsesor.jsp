<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="" import="org.json.simple.JSONObject"%>
<%
try
{
	revision_propuestos EBD=new revision_propuestos();
	EBD.cve_asesor_dual_utsjr=Integer.parseInt(request.getParameter("p_SAsesor"));
	EBD.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
	EBD.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
	EBD.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));
	
	EBD.FAsignar_asesor_dual();
	//EBD.FBuscar_asesor_dual_utsjr();
	
	
	JSONObject json=new JSONObject();
	json.put("error",EBD.error);
	//json.put("cve_asesor_dual_utsjr",String.valueOf(EBD.cve_asesor_dual_utsjr));

	out.print(json);
	out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>