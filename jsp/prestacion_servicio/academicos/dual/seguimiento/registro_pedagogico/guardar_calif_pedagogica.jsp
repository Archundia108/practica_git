<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="../../error.jsp" import="org.json.simple.JSONObject"%>
<%
try
{

	registro_pedagogico ebd=new registro_pedagogico();
	ebd.calif_exa_psico=Integer.parseInt(request.getParameter("p_SCalificacion"));
	ebd.obser_exa_psico=request.getParameter("p_TObservaciones");
	//ebd.fecha_exa_psico=request.getParameter("p_Fecha");
	ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
	ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
	ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));

	ebd.FAsignarCalif();
	JSONObject json=new JSONObject();
	json.put("error",String.valueOf(ebd.error));
	//json.put("error","EBD.error");
	out.print(json);
	out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>