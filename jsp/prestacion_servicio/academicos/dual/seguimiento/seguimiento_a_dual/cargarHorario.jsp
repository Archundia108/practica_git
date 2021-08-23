<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, prestacion_servicio.academicos.dual.*" errorPage="" import="org.json.*"%>
<%
try
{
	seguimiento_a_dual ebd=new seguimiento_a_dual();
	
	ebd.cve_alumno=Integer.parseInt(request.getParameter("p_cve_alumno"));
    ebd.cve_periodo=Integer.parseInt(request.getParameter("p_cve_periodo"));
    ebd.cve_competencia=Integer.parseInt(request.getParameter("p_cve_competencia"));
	JSONArray arreglo=new JSONArray();
	JSONObject json=new JSONObject();
	JSONObject json2=new JSONObject();


ebd.FBuscarSemanas1();
json.put("s1",ebd.semana_1);
json.put("s2",ebd.semana_2);
json.put("s3",ebd.semana_3);
json.put("s4",ebd.semana_4);
json.put("s5",ebd.semana_5);
json.put("s6",ebd.semana_6);
json.put("s7",ebd.semana_7);
json.put("s8",ebd.semana_8);
json.put("s9",ebd.semana_9);
json.put("s10",ebd.semana_10);
json.put("s11",ebd.semana_11);
json.put("s12",ebd.semana_12);
json.put("s13",ebd.semana_13);
json.put("s14",ebd.semana_14);
json.put("s15",ebd.semana_15);
json.put("s16",ebd.semana_16);
arreglo.put(json);


ebd.FBuscarSemanas2();
json2.put("s1",ebd.semana_1);
json2.put("s2",ebd.semana_2);
json2.put("s3",ebd.semana_3);
json2.put("s4",ebd.semana_4);
json2.put("s5",ebd.semana_5);
json2.put("s6",ebd.semana_6);
json2.put("s7",ebd.semana_7);
json2.put("s8",ebd.semana_8);
json2.put("s9",ebd.semana_9);
json2.put("s10",ebd.semana_10);
json2.put("s11",ebd.semana_11);
json2.put("s12",ebd.semana_12);
json2.put("s13",ebd.semana_13);
json2.put("s14",ebd.semana_14);
json2.put("s15",ebd.semana_15);
json2.put("s16",ebd.semana_16);
arreglo.put(json2);
   

   out.print(arreglo);
   out.flush(); 
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>