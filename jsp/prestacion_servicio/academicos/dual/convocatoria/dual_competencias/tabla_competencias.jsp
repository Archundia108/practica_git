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

        String consultas = "", error = "", nombre_competencia = "", fecha = "", nombre_carrera = "";
        int cve_competencia = 0;

        %>
            <thead class="table-dark SoloTexto2">
                <tr class="bg-info">
                    <th class="aling-middle text-center" colspan="4" scope="col">Listado de competencias</th>
                </tr>
                <tr class="bg-secondary">
                    <th class="aling-middle text-center" scope="col">Folio</th>
                    <th class="aling-middle text-center" scope="col">Competencia</th>
                    <th class="aling-middle text-center" scope="col">Carrera</th>
                    <th class="aling-middle text-center" scope="col">Fecha</th>
                </tr>
            </thead>

            <tbody>
                <%
                    consultas = "SELECT p.cve_competencia, p.nombre_competencia, c.descripcion, "
                              + "CONVERT(VARCHAR(24), p.fecha, 103) AS fecha "
                              + "FROM dual_competencias p "
                              + "INNER JOIN carreras_universidad c ON p.cve_carrera = c.cve_carrera "
                              + "WHERE c.cve_director = "+cve_usuario+" "
                              + "ORDER BY p.cve_competencia DESC";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next())
                    {
                        cve_competencia = rs.getInt(1);
                        nombre_competencia = rs.getString(2);
                        nombre_carrera = rs.getString(3);
                        fecha = rs.getString(4);
                        %>
                            <tr>
                                <th class="aling-middle text-center" scope="col"><a href="javascript:FBuscar_competencias(<%=cve_competencia%>)"><%=cve_competencia%></a></th>
                                <td class="aling-middle text-center"><%=nombre_competencia%></td>
                                <td class="aling-middle text-center"><%=nombre_carrera%></td>
                                <td class="aling-middle text-center"><%=fecha%></td>
                            </tr>
                        <%
                    }
                    SMBD.desconectarBD();
                %>
            </tbody>
        <%
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%> 