<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../error.jsp"
%>

<%
    try
    {
        BD SMBD = new BD();
        ResultSet rs;

        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));

        int cve_puesto_aprendizaje = 0; 
        String consultas = "", error = "", nombre_puesto_aprendizaje = "";

        %>
            <a href="javascript:FVentanaPuestosAprendizaje()">Puestos de aprendizaje</a>
            <br>
            <select name="SCvePuestoAprendizaje" id="SCvePuestoAprendizaje" class="captura combo200">
                <option value="-1">...selecciona...</option>
                <%
                    consultas = "SELECT p.nombre_puesto_aprendizaje, p.cve_puesto_aprendizaje "
                              + "FROM dual_puestos_aprendizaje p "
                              + "INNER JOIN carreras_universidad c ON c.cve_carrera = p.cve_carrera "
                              + "WHERE c.cve_director = "+cve_usuario+"";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next())
                    {
                        nombre_puesto_aprendizaje = rs.getString(1);
                        cve_puesto_aprendizaje = rs.getInt(2);
                        %>
                            <option value="<%=cve_puesto_aprendizaje%>"><%=nombre_puesto_aprendizaje%></option>
                        <%
                    }
                    SMBD.desconectarBD();
                %>
            </select>
        <%
    }
    catch (Exception e)
    {
        out.print("Wacha el error: " +e);
    }
%>