<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;
        int cve_dual_puesto = 0, vigente = 0; 
        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));
        String consultas = "", error = "", nombre_dual_puesto = "", nombre_puesto_aprendizaje = "", objetivo_gral = "", requerimientos_gral = "", fecha = "";
        %>
            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPuestos">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="aling-middle text-center" colspan="7" scope="col">Puestos registrados</th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="aling-middle text-center" scope="col">Folio</th>
                        <th class="aling-middle text-center" scope="col">Nombre de puesto</th>
                        <th class="aling-middle text-center" scope="col">Puesto de aprendizaje</th>
                        <th class="aling-middle text-center" scope="col">Objetivo general</th>
                        <th class="aling-middle text-center" scope="col">Requerimientos generales</th>
                        <th class="aling-middle text-center" scope="col">Fecha de registro</th>
                        <th class="aling-middle text-center" scope="col">Vigente</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        consultas = "SELECT TOP(50) pu.cve_dual_puesto, pu.nombre_dual_puesto, pl.nombre_puesto_aprendizaje, pu.objetivo_gral, pu.requerimientos_gral, "
                                  + "CONVERT(VARCHAR(24), pu.fecha, 103) AS fecha, pu.vigente "
                                  + "FROM dual_puestos pu "
                                  + "INNER JOIN dual_puestos_aprendizaje pl ON pu.cve_puesto_aprendizaje = pl.cve_puesto_aprendizaje INNER JOIN carreras_universidad c ON pl.cve_carrera = c.cve_carrera "
                                  + "WHERE c.cve_director = "+cve_usuario+" "
                                  + "ORDER BY pu.cve_dual_puesto DESC";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next())
                        {
                            cve_dual_puesto = rs.getInt(1);
                            nombre_dual_puesto = rs.getString(2);
                            nombre_puesto_aprendizaje = rs.getString(3);
                            objetivo_gral = rs.getString(4);
                            requerimientos_gral = rs.getString(5);
                            fecha = rs.getString(6);
                            vigente = rs.getInt(7);
                            %>
                                <tr>
                                    <th class="aling-middle text-center" scope="col"><a href="javascript:FBusca(<%=cve_dual_puesto%>)"><%=cve_dual_puesto%></a></th>
                                    <td class="aling-middle text-center"><%=nombre_dual_puesto%></td>
                                    <td class="aling-middle text-center"><%=nombre_puesto_aprendizaje%></td>
                                    <td class="aling-middle text-center"><%=objetivo_gral%></td>
                                    <td class="aling-middle text-center"><%=requerimientos_gral%></td>
                                    <td class="aling-middle text-center"><%=fecha%></td>
                                    <td class="aling-middle text-center"><%if(vigente == 1){out.print("Si");}else{out.print("No");}%></td>
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