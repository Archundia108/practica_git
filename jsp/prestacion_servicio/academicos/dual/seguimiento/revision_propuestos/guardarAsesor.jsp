<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="../../error.jsp" import="org.json.simple.JSONObject"%>
<%
try
{
	revision_propuestos EBD=new revision_propuestos();
	EBD.cve_asesor_dual_utsjr=Integer.parseInt(request.getParameter("p_SAsesor"));
	EBD.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
	EBD.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
	EBD.cve_puesto_aprendizaje=Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));
	
	EBD.FAsignar_asesor_dual();
	//EBD.FBuscar_asesor_dual_utsjr();
	
	
	JSONObject json=new JSONObject();
	json.put("error",String.valueOf(EBD.error));
	//json.put("cve_asesor_dual_utsjr",String.valueOf(EBD.cve_asesor_dual_utsjr));

	out.print(json);
	out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>