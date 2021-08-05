<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" import="org.json.simple.JSONObject"%>

<%
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;
        String consultas = "", error = "", nombre_carrera = "";
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));
        
        consultas = "SELECT c.descripcion "
                  + "FROM carreras_universidad c "
                  + "INNER JOIN dual_puestos_aprendizaje pu ON pu.cve_carrera = c.cve_carrera "
                  + "WHERE pu.cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+"";
        rs = SMBD.SQLBD(consultas);
        while (rs.next()) 
        {
            nombre_carrera = rs.getString(1);
        }
        SMBD.desconectarBD();
        
        JSONObject json = new JSONObject();
        json.put("nombre_carrera", nombre_carrera);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("No jalo pibe, wacha el error: "+e);
    }
%> 