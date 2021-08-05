<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;
        int cve_puesto_aprendizaje = 0; 
        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));
        String consultas = "", error = "", nombre_puesto_aprendizaje = "", fecha = "", nombre_carrera = "";
        %>
            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPlanesRotacion">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="aling-middle text-center" colspan="4" scope="col">Listado de puestos de aprendizaje</th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="aling-middle text-center" scope="col">Folio</th>
                        <th class="aling-middle text-center" scope="col">Nombre del plan</th>
                        <th class="aling-middle text-center" scope="col">Carrera</th>
                        <th class="aling-middle text-center" scope="col">Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        consultas = "SELECT p.cve_puesto_aprendizaje, p.nombre_puesto_aprendizaje, c.descripcion, "
                                  + "CONVERT(VARCHAR(24), p.fecha, 103) AS fecha "
                                  + "FROM dual_puestos_aprendizaje p "
                                  + "INNER JOIN carreras_universidad c ON p.cve_carrera = c.cve_carrera "
                                  + "WHERE c.cve_director = "+cve_usuario+" "
                                  + "ORDER BY p.cve_puesto_aprendizaje DESC";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next())
                        {
                            cve_puesto_aprendizaje = rs.getInt(1);
                            nombre_puesto_aprendizaje = rs.getString(2);
                            nombre_carrera = rs.getString(3);
                            fecha = rs.getString(4);
                            %>
                                <tr>
                                    <th class="aling-middle text-center" scope="col"><a href="javascript:FBusca(<%=cve_puesto_aprendizaje%>)"><%=cve_puesto_aprendizaje%></a></th>
                                    <td class="aling-middle text-center"><%=nombre_puesto_aprendizaje%></td>
                                    <td class="aling-middle text-center"><%=nombre_carrera%></td>
                                    <td class="aling-middle text-center"><%=fecha%></td>
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