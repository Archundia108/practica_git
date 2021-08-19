<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="" import="org.json.simple.JSONObject"%>
<%
try
{
	seguimiento_a_dual ebd=new seguimiento_a_dual();
	int action = Integer.parseInt(request.getParameter("action"));
	//int num_sem = Integer.parseInt(requestlgetParameter("num_sem"));
	//int cve_institucion = Integer.parseInt(requestlgetParameter("cve_institucion"));
	JSONObject json=new JSONObject();

	switch(action) 
	{
		case 1:
		ebd.horario=request.getParameter("p_THorario");
		ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
    	ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
    	ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));

    	ebd.FGuardarHorario();
    	json.put("error",String.valueOf(ebd.error));
		break;

		case 2:

		ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
        ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
    	ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));
		ebd.mes_1=Integer.parseInt(request.getParameter("p_mes_1"));
        ebd.mes_2=Integer.parseInt(request.getParameter("p_mes_2"));
        ebd.mes_3=Integer.parseInt(request.getParameter("p_mes_3"));
        ebd.mes_4=Integer.parseInt(request.getParameter("p_mes_4"));
        
		//json.put("error","p_cve_alumno:"+ebd.cve_alumno+" ,p_cve_periodo:"+ebd.cve_periodo+", p_cve_competencia:"+ebd.cve_competencia+", p_mes_1:"+ebd.mes_1+", p_mes_2:"+ebd.mes_2+", p_mes_3:"+ebd.mes_3+", p_mes_4:"+ebd.mes_4+"");
		ebd.FGuardarMeses();
		json.put("error",String.valueOf(ebd.error));
		break;

		case 3:

		ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
        ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
    	ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));
    	ebd.sem_=Integer.parseInt(request.getParameter("p_sem_"));
    	ebd.sem_UT=Integer.parseInt(request.getParameter("p_sem_UT"));
    	
		ebd.FGuardarSemanas();
		json.put("error",String.valueOf(ebd.error));
		break;
	}
		/*ebd.l=Integer.parseInt(request.getParameter("p_l"));;
        ebd.m=Integer.parseInt(request.getParameter("p_m"));
        ebd.i=Integer.parseInt(request.getParameter("p_i"));
        ebd.j=Integer.parseInt(request.getParameter("p_j"));
        ebd.v=Integer.parseInt(request.getParameter("p_v"));*/
    	out.print(json);
		out.flush();
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>