<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;

        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));
        
        String consultas = "", nombre_puesto_aprendizaje = "", descripcion = "", fecha_inicio = "", fecha_termino = "";
        int cve_convocatoria = 0, vigente = 0, cve_puesto_aprendizaje = 0;
        %>
            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblConvocatorias">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="aling-middle text-center" colspan="8" scope="col">Listado de convocatorias</th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="aling-middle text-center" scope="col">Folio</th>
                        <th class="aling-middle text-center" scope="col">Puesto de aprendizaje</th>
                        <th class="aling-middle text-center" scope="col">Puestos</th>
                        <th class="aling-middle text-center" scope="col">Descripción</th>
                        <th class="aling-middle text-center" scope="col">Fecha de inicio</th>
                        <th class="aling-middle text-center" scope="col">Fecha de término</th>
                        <th class="aling-middle text-center" scope="col">Vigente</th>
                        <th class="aling-middle text-center" scope="col">Notificar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        consultas = "SELECT co.cve_convocatoria, pa.cve_puesto_aprendizaje, pa.nombre_puesto_aprendizaje, co.descripcion, "
                                  + "CONVERT(VARCHAR(24), co.fecha_inicio, 103) AS fecha_inicio, CONVERT(VARCHAR(24), co.fecha_termino, 103) AS fecha_termino, co.vigente "
                                  + "FROM dual_convocatorias co "
                                  + "INNER JOIN dual_puestos_aprendizaje pa ON pa.cve_puesto_aprendizaje = co.cve_puesto_aprendizaje "
                                  + "INNER JOIN carreras_universidad ca ON ca.cve_carrera = pa.cve_carrera "
                                  + "WHERE ca.cve_director = "+cve_usuario+" "
                                  + "ORDER BY co.cve_convocatoria DESC";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next()) 
                        {
                            cve_convocatoria = rs.getInt(1);
                            cve_puesto_aprendizaje = rs.getInt(2);
                            nombre_puesto_aprendizaje = rs.getString(3);
                            descripcion = rs.getString(4);
                            fecha_inicio = rs.getString(5);
                            fecha_termino = rs.getString(6);
                            vigente = rs.getInt(7);
                            %>
                                <tr>
                                    <th class="aling-middle text-center" scope="col"><a href="javascript:FBuscar(<%=cve_convocatoria%>)"><%=cve_convocatoria%></a></th>
                                    <td class="aling-middle text-center"><%=nombre_puesto_aprendizaje%></td>
                                    <td class="aling-middle text-center"><a href="" onclick="FVentanaPuestos('<%=cve_puesto_aprendizaje%>')">Ver</a></td>
                                    <td class="aling-middle text-center"><%=descripcion%></td>
                                    <td class="aling-middle text-center"><%=fecha_inicio%></td>
                                    <td class="aling-middle text-center"><%=fecha_termino%></td>
                                    <td class="aling-middle text-center"><%if(vigente == 1){out.print("Si");}else{out.print("No");}%></td>
                                    <td class="aling-middle text-center">
                                        <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar">
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