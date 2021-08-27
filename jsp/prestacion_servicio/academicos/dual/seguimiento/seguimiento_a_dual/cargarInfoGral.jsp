<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="" import="org.json.*"%>
<%
try
{
    seguimiento_a_dual ebd=new seguimiento_a_dual();
    ebd.cve_alumno= Integer.parseInt(request.getParameter("p_cve_alumno"));
    JSONObject json = new JSONObject();
    json.put("dia_l", ebd.l);
    json.put("dia_m", ebd.m);
    json.put("dia_i", ebd.i);
    json.put("dia_j", ebd.j);
    json.put("dia_v", ebd.v);
    json.put("horario",ebd.horario);
    json.put("tel_inst_empresa",ebd.tel_inst_empresa);
    json.put("nom_inst_empresa",ebd.nom_inst_empresa);
    json.put("ape_pat_inst_empresa",ebd.ape_pat_inst_empresa);
    json.put("ape_mat_inst_empresa",ebd.ape_mat_inst_empresa);
    json.put("correo_inst_empresa",ebd.correo_inst_empresa);
    json.put("nom_plan_rotacion",ebd.nom_plan_rotacion);
    json.put("nombre_puesto",ebd.nombre_puesto);
    json.put("obvj_gral",ebd.obvj_gral);
    json.put("mes_1", ebd.mes_1);
    json.put("mes_2", ebd.mes_2);
    json.put("mes_3", ebd.mes_3);
    json.put("mes_4", ebd.mes_4);
    
    ebd.FBuscarInfoCompleta();
    out.print(json);
    out.flush();
}
catch(Exception e)
{
    out.print("error: " +e);
}
%>