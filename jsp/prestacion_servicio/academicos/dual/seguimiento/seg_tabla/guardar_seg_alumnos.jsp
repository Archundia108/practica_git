<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="../../error.jsp" import="org.json.simple.JSONObject"%>
<%
try
{
	seg_tabla ebd=new seg_tabla();
	ebd.calif_exa_conoc=Integer.parseInt(request.getParameter("p_SCalifConoc"));
	ebd.obser_exa_conoc=request.getParameter("p_TObservaciones");
	ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
	ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
	ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));

	ebd.FAsignarCalifConoc();
	JSONObject json=new JSONObject();
	json.put("error",String.valueOf(ebd.error));
    out.print(json);
	out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>