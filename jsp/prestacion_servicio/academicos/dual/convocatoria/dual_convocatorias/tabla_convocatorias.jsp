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
            <table class="table-hover table-bordered" width="100%">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="8" scope="col">Listado de convocatorias</th>
                    </tr>
                    <tr class="bg-secondary align-middle text-center">
                        <th scope="col">Folio</th>
                        <th scope="col">Competencia</th>
                        <th scope="col">Puestos de aprendizaje</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Fecha de inicio</th>
                        <th scope="col">Fecha de término</th>
                        <th scope="col">Vigente</th>
                        <th scope="col">Fecha de notificación</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        consultas = "SELECT co.cve_convocatoria, pa.cve_competencia, pa.nombre_competencia, co.descripcion, "
                                  +        "CONVERT(VARCHAR(24), co.fecha_inicio, 103) AS fecha_inicio, CONVERT(VARCHAR(24), co.fecha_termino, 103) AS fecha_termino, "
                                  +        "co.vigente, ISNULL(CONVERT(VARCHAR(24), fecha_notificacion, 103),'No se ha notificado') AS fecha_notificacion "
                                  + "FROM dual_convocatorias co "
                                  + "INNER JOIN dual_competencias pa ON pa.cve_competencia = co.cve_competencia "
                                  + "INNER JOIN carreras_universidad ca ON ca.cve_carrera = pa.cve_carrera "
                                  + "WHERE (ca.cve_director = "+cve_usuario+") "
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
                                    <th class="align-middle text-center" scope="col"><a href="javascript:FBuscar(<%=cve_convocatoria%>)"><%=cve_convocatoria%></a></th>
                                    <td class="align-middle text-center"><%=nombre_competencia%></td>
                                    <td class="align-middle text-center"><a href="" onclick="FVentana_ver_competencias('<%=cve_competencia%>')">Ver</a></td>
                                    <td class="align-middle text-center"><%=descripcion%></td>
                                    <td class="align-middle text-center"><%=fecha_inicio%></td>
                                    <td class="align-middle text-center"><%=fecha_termino%></td>
                                    <td class="align-middle text-center"><%if(vigente == 1){out.print("Si");}else{out.print("No");}%></td>
                                    <td class="align-middle text-center"><%=fecha_notificacion%></td>   
                                </tr>
                                <script type="text/JavaScript" language="JavaScript">
                                    FVerificar_fecha('<%=fecha_termino%>', <%=cve_convocatoria%>);
                                </script>
                            <%
                        }
                        SMBD.desconectarBD();
                    %>
                </tbody>
            </table>
        <%
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%> 