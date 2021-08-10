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
        
        String consultas = "", nombre_competencia = "", descripcion = "", fecha_inicio = "", fecha_termino = "", fecha_notificacion = "";
        int cve_convocatoria = 0, vigente = 0, cve_competencia = 0;

        %>
            <thead class="table-dark ">
                <tr class="bg-info">
                    <th class="aling-middle text-center" colspan="8" scope="col">Listado de convocatorias</th>
                </tr>
                <tr class="bg-secondary">
                    <th class="aling-middle text-center" scope="col">Folio</th>
                    <th class="aling-middle text-center" scope="col">Competencia</th>
                    <th class="aling-middle text-center" scope="col">Puestos de aprendizaje</th>
                    <th class="aling-middle text-center" scope="col">Descripción</th>
                    <th class="aling-middle text-center" scope="col">Fecha de inicio</th>
                    <th class="aling-middle text-center" scope="col">Fecha de término</th>
                    <th class="aling-middle text-center" scope="col">Vigente</th>
                    <th class="aling-middle text-center" scope="col">Fecha de notificación</th>
                </tr>
            </thead>
            <tbody>
                <%
                    consultas = "SELECT co.cve_convocatoria, pa.cve_competencia, pa.nombre_competencia, co.descripcion, "
                              + "CONVERT(VARCHAR(24), co.fecha_inicio, 103) AS fecha_inicio, CONVERT(VARCHAR(24), co.fecha_termino, 103) AS fecha_termino, "
                              + "co.vigente, ISNULL(CONVERT(VARCHAR(24), fecha_notificacion, 103),'No se ha notificado') AS fecha_notificacion "
                              + "FROM dual_convocatorias co "
                              + "INNER JOIN dual_competencias pa ON pa.cve_competencia = co.cve_competencia "
                              + "INNER JOIN carreras_universidad ca ON ca.cve_carrera = pa.cve_carrera "
                              + "WHERE ca.cve_director = "+cve_usuario+" "
                              + "ORDER BY co.cve_convocatoria DESC";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next()) 
                    {
                        cve_convocatoria = rs.getInt(1);
                        cve_competencia = rs.getInt(2);
                        nombre_competencia = rs.getString(3);
                        descripcion = rs.getString(4);
                        fecha_inicio = rs.getString(5);
                        fecha_termino = rs.getString(6);
                        vigente = rs.getInt(7);
                        fecha_notificacion = rs.getString(8);
                        %>
                            <tr>
                                <th class="aling-middle text-center" scope="col"><a href="javascript:FBuscar(<%=cve_convocatoria%>)"><%=cve_convocatoria%></a></th>
                                <td class="aling-middle text-center"><%=nombre_competencia%></td>
                                <td class="aling-middle text-center"><a href="" onclick="FVentana_ver_competencias('<%=cve_competencia%>')">Ver</a></td>
                                <td class="aling-middle text-center"><%=descripcion%></td>
                                <td class="aling-middle text-center"><%=fecha_inicio%></td>
                                <td class="aling-middle text-center"><%=fecha_termino%></td>
                                <td class="aling-middle text-center"><%if(vigente == 1){out.print("Si");}else{out.print("No");}%></td>
                                <td class="aling-middle text-center"><%=fecha_notificacion%></td>   
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