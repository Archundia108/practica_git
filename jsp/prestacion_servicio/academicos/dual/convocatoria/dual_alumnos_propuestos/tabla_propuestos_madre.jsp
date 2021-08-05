<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;

        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));

        String consultas = "", fecha_inicio = "", fecha_termino = "", descripcion = "", nombre_puesto_aprendizaje = "";
        int cve_puesto_aprendizaje = 0, cve_convocatoria = 0, v = 0;
        
        %>
            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPropuestos">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-secondary">
                        <th class="aling-middle text-center" scope="col" colspan="2">Fecha de convocatoria</th>
                        <th class="aling-middle text-center" scope="col" rowspan="2">Descripción de convocatoria</th>
                        <th class="aling-middle text-center" scope="col" rowspan="2">Puesto de aprendizaje</th>
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
                        consultas = "SELECT CONVERT(VARCHAR(24), con.fecha_inicio, 103) AS fecha_inicio, CONVERT(VARCHAR(24), con.fecha_termino, 103) AS fecha_termino, con.descripcion, pa.nombre_puesto_aprendizaje, con.cve_convocatoria, pa.cve_puesto_aprendizaje "
                                  + "FROM dual_convocatorias con "
                                  + "INNER JOIN dual_puestos_aprendizaje pa ON pa.cve_puesto_aprendizaje = con.cve_puesto_aprendizaje "
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
                            nombre_puesto_aprendizaje = rs.getString(4);
                            cve_convocatoria = rs.getInt(5);
                            cve_puesto_aprendizaje = rs.getInt(6);
                            v++;
                            %>
                                <tr>
                                    <td class="aling-middle text-center"><%=fecha_inicio%></td>
                                    <td class="aling-middle text-center"><%=fecha_termino%></td>
                                    <td class="aling-middle text-center"><%=descripcion%></td>
                                    <td class="aling-middle text-center">
                                        <a onclick="FVentana('<%=cve_puesto_aprendizaje%>')" href="" class="liga"><%=nombre_puesto_aprendizaje%></a>
                                    </td>
                                    <td class="aling-middle text-center">
                                        <input type="text" class="captura_obligada combo200" id="TAgregar<%=v%>" name="TAgregar<%=v%>" onkeypress="return FCaracteres(event)">
                                        <img src="../../../../../imagenes/ikonoz/agregar_persona.png" class="iconsButtons" title="Agregar" onclick="FRegistra_alumnos('<%=v%>', '<%=cve_usuario%>', '<%=cve_convocatoria%>')">
                                    </td>
                                    <td class="aling-middle text-center" colspan="4">
                                        <table class="table table-hover table-sm SoloTexto2" cellpading="0" cellspacing="0" id="TblAlumnos<%=v%>">
                                            <tr>
                                                <td class="aling-middle text-center">--</td>
                                                <td class="aling-middle text-center">--</td>
                                                <td class="aling-middle text-center">
                                                    <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar">    
                                                </td>
                                                <td class="aling-middle text-center">
                                                    <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Eliminar">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <script type="text/JavaScript" language="JavaScript">
                                    function FTabla(v, cve_usuario, cve_convocatoria)
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
                                        )
                                    }
                                    FTabla(<%=v%>, <%=cve_usuario%>,<%=cve_convocatoria%>);
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