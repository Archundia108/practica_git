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

        int cve_puesto_aprendizaje = 0, vigente = 0;
        String consultas = "", error = "", nombre_competencia = "", nombre_puesto_aprendizaje = "", objetivo_gral = "", requerimientos_gral = "", fecha = "";

        %>
            <table class="table-hover table-bordered" width="100%">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="7" scope="col">Puestos de aprendizaje registrados</th>
                    </tr>
                    <tr class="bg-secondary align-middle text-center">
                        <th scope="col">Folio</th>
                        <th scope="col">Puesto de aprendizaje</th>
                        <th scope="col">Competencia</th>
                        <th scope="col">Objetivo general</th>
                        <th scope="col">Requerimientos generales</th>
                        <th scope="col">Fecha de registro</th>
                        <th scope="col">Vigente</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        consultas = "SELECT TOP(50) pu.cve_puesto_aprendizaje, pu.nombre_puesto_aprendizaje, pl.nombre_competencia, pu.objetivo_gral, pu.requerimientos_gral, "
                                  + "CONVERT(VARCHAR(24), pu.fecha, 103) AS fecha, pu.vigente "
                                  + "FROM dual_puestos_aprendizaje pu "
                                  + "INNER JOIN dual_competencias pl ON pu.cve_competencia = pl.cve_competencia "
                                  + "INNER JOIN carreras_universidad c ON pl.cve_carrera = c.cve_carrera "
                                  + "WHERE (c.cve_director = "+cve_usuario+") "
                                  + "ORDER BY pu.cve_puesto_aprendizaje DESC";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next())
                        {
                            cve_puesto_aprendizaje = rs.getInt(1);
                            nombre_puesto_aprendizaje = rs.getString(2);
                            nombre_competencia = rs.getString(3);
                            objetivo_gral = rs.getString(4);
                            requerimientos_gral = rs.getString(5);
                            fecha = rs.getString(6);
                            vigente = rs.getInt(7);
                            %>
                                <tr>
                                    <th class="align-middle text-center" scope="col"><a href="javascript:FBuscar_puesto_aprendizaje(<%=cve_puesto_aprendizaje%>)"><%=cve_puesto_aprendizaje%></a></th>
                                    <td class="align-middle text-center"><%=nombre_puesto_aprendizaje%></td>
                                    <td class="align-middle text-center"><%=nombre_competencia%></td>
                                    <td class="align-middle text-center"><%=objetivo_gral%></td>
                                    <td class="align-middle text-center"><%=requerimientos_gral%></td>
                                    <td class="align-middle text-center"><%=fecha%></td>
                                    <td class="align-middle text-center">
                                        <%
                                            if (vigente == 1)
                                            {
                                                out.print("Si");
                                            }
                                            else
                                            {
                                                out.print("No");
                                            }
                                        %>
                                    </td>
                                </tr>
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