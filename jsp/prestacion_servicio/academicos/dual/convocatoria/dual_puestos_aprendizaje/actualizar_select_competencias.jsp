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

        int cve_competencia = 0; 
        String consultas = "", error = "", nombre_competencia = "";

        %>
            <a href="javascript:FVentana_competencias()">Competencias</a>
            <br>
            <select name="SCveCompetencia" id="SCveCompetencia" class="captura combo200">
                <option value="-1">...selecciona...</option>
                <%
                    consultas = "SELECT p.nombre_competencia, p.cve_competencia "
                                + "FROM dual_competencias p "
                                + "INNER JOIN carreras_universidad c ON c.cve_carrera = p.cve_carrera "
                                + "WHERE c.cve_director = "+cve_usuario+"";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next()) 
                    {
                        nombre_competencia = rs.getString(1);
                        cve_competencia = rs.getInt(2);
                        %>
                            <option value="<%=cve_competencia%>"><%=nombre_competencia%></option>
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