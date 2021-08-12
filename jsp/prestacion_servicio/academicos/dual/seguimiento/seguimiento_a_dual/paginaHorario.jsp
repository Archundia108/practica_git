<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage="/../../error.jsp"%>
<%
if (session.getAttribute("usuario") != null)
{
		String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));

        BD SMBD = new BD();
        ResultSet rs, rs2;
        String consultas="";
%>

<%
}
else(Exception e)
{

}
%>
