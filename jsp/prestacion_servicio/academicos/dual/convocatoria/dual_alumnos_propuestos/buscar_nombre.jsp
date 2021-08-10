<%@ 
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    import="org.json.simple.JSONObject"
    contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../../error.jsp"
%> 

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;

        String expediente = request.getParameter("p_expediente");
        
        String consultas = "", nombre = "";
        
        consultas = "SELECT CONCAT(p.nombre, ' ', p.apellido_pat, ' ', p.apellido_mat) as nombre "
                  + "FROM personas p "
                  + "INNER JOIN alumnos al ON al.cve_alumno = p.cve_persona "
                  + "WHERE al.expediente = '"+expediente+"' ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next()) 
        {
            nombre = rs.getString(1);
        }
        SMBD.desconectarBD();

        JSONObject json = new JSONObject();
        json.put("nombre", nombre);
        out.print(json);
        out.flush();
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%> 