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

        String consultas = "", fecha_inicio = "", fecha_termino = "", descripcion = "", nombre_competencia = "";
        int cve_competencia = 0, cve_convocatoria = 0, v = 0;
        
        %>
            <thead class="table-dark">
                <tr class="bg-secondary">
                    <th class="aling-middle text-center" scope="col" colspan="2">Fecha de convocatoria</th>
                    <th class="aling-middle text-center" scope="col" rowspan="2">Descripción de convocatoria</th>
                    <th class="aling-middle text-center" scope="col" rowspan="2">Competencia</th>
                    <th class="aling-middle text-center" scope="col" colspan="5">Asignación de alumnos</th>
                </tr>
                <tr class="bg-secondary">
                    <th class="aling-middle text-center" scope="col">Fecha de inicio</th>
                    <th class="aling-middle text-center" scope="col">Fecha de término</th>
                    <th class="aling-middle text-center" scope="col">Agregar (alumnos inscritos)</th>
                    <th class="aling-middle text-center" scope="col" colspan="4">Información de alumnos</th>
                </tr>
            </thead>

            <tbody>
                <%
                    consultas = "SELECT CONVERT(VARCHAR(24), con.fecha_inicio, 103) AS fecha_inicio, CONVERT(VARCHAR(24), con.fecha_termino, 103) AS fecha_termino, " 
                              +        "con.descripcion, pa.nombre_competencia, con.cve_convocatoria, pa.cve_competencia "
                              + "FROM dual_convocatorias con "
                              + "INNER JOIN dual_competencias pa ON pa.cve_competencia = con.cve_competencia "
                              + "INNER JOIN carreras_universidad c ON pa.cve_carrera = c.cve_carrera "
                              + "INNER JOIN grupos g ON g.cve_carrera = c.cve_carrera "
                              + "WHERE (g.cve_maestro = "+cve_usuario+") AND (g.cve_periodo IN (SELECT cve_periodo "
                                                                                             + "FROM periodos "
                                                                                             + "WHERE activo = 1))";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next())
                    {
                        fecha_inicio = rs.getString(1);
                        fecha_termino = rs.getString(2);
                        descripcion = rs.getString(3);
                        nombre_competencia = rs.getString(4);
                        cve_convocatoria = rs.getInt(5);
                        cve_competencia = rs.getInt(6);
                        v++;
                        %>
                            <tr>
                                <td class="aling-middle text-center"><%=fecha_inicio%></td>
                                <td class="aling-middle text-center"><%=fecha_termino%></td>
                                <td class="aling-middle text-center"><%=descripcion%></td>
                                <td class="aling-middle text-center">
                                    <a onclick="FVentana_ver_competencias('<%=cve_competencia%>')" href="" class="liga"><%=nombre_competencia%></a>
                                </td>
                                <td class="aling-middle text-center">
                                    <input type="text" class="captura_obligada combo200" id="TAgregar<%=v%>" name="TAgregar<%=v%>" onkeypress="return FCaracteres(event)">
                                    <img src="../../../../../imagenes/ikonoz/agregar_persona.png" class="iconsButtons" title="Agregar" onclick="FRegistrar_alumnos('<%=v%>', '<%=cve_usuario%>', '<%=cve_convocatoria%>')">
                                </td>
                                <td class="aling-middle text-center" colspan="5">
                                    <table class="table table-hover border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblAlumnos<%=v%>">
                                        <!--Tabla-->
                                    </table>
                                </td>
                            </tr>

                            <script type="text/JavaScript" language="JavaScript">
                                function FTabla_alumnos2(v, cve_usuario, cve_convocatoria)
                                {
                                    FCargando();
                                    var par =
                                    {
                                        "p_cve_usuario"       : cve_usuario,
                                        "p_cve_convocatoria"  : cve_convocatoria,
                                        "p_v"                 : v
                                    }

                                    $.post
                                    (
                                        "dual_alumnos_propuestos/tabla_propuestos_hija.jsp", par,
                                        function(htmlExterno) 
                                        {
                                            $('#TblAlumnos'+v).html(htmlExterno);
                                            FTerminado();
                                        }
                                    );
                                }
                                FTabla_alumnos2(<%=v%>, <%=cve_usuario%>,<%=cve_convocatoria%>);
                            </script>
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