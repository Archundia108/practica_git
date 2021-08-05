<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="../../error.jsp" import="org.json.simple.JSONObject"%>
<%
try
{
	seguimiento_a_dual ebd=new seguimiento_a_dual();
		ebd.cve_empresa=Integer.parseInt(request.getParameter("p_SEmpresa"));
    	ebd.correo_inst_empresa=request.getParameter("p_TCorreoInst");
    	ebd.nom_plan_rotacion=request.getParameter("p_TNomRotacion");
    	ebd.nom_inst_empresa=request.getParameter("p_TNomInst");
    	ebd.ape_pat_inst_empresa=request.getParameter("p_TPatInst");
    	ebd.ape_mat_inst_empresa=request.getParameter("p_TMatInst");
    	ebd.tel_inst_empresa=request.getParameter("p_TNumeroInst");
    	ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
    	ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
    	ebd.cve_puesto_aprendizaje=Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

    	ebd.FGuardarDatos();
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

