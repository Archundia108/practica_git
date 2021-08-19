<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    import="org.json.simple.JSONObject"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../error.jsp"
%>

<%
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;

        int cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));
        
        String consultas = "", error = "", nombre_carrera = "";
        
        consultas = "SELECT c.descripcion "
                  + "FROM carreras_universidad c "
                  + "INNER JOIN dual_competencias pu ON pu.cve_carrera = c.cve_carrera "
                  + "WHERE (pu.cve_competencia = "+cve_competencia+")";
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
        out.print("Wacha el error: "+e);
    }
%> 