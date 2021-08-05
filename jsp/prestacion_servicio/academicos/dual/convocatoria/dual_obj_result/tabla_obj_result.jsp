<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;
        int numero = 0;
        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));
        int cve_dual_puesto = Integer.parseInt(request.getParameter("p_cve_dual_puesto"));
        String consultas = "", error = "", objetivo = "", resultado = "";
        %>
            <table style="margin: auto;" align="" class="table table-hover table-sm border border-info SoloTexto2" cellpadding="0" cellspacing="0" id="TblObjetivos">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-secondary">
                        <th class="align-middle text-center" scope="col">Folio</th>
                        <th class="align-middle text-center" scope="col">Objetivo</th>
                        <th class="align-middle text-center" scope="col">Resutado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        consultas = "SELECT ob.numero, ob.objetivo, ob.resultado "
                                  + "FROM dual_obj_result ob "
                                  + "INNER JOIN dual_puestos p ON p.cve_dual_puesto = ob.cve_dual_puesto "
                                  + "INNER JOIN dual_puestos_aprendizaje pa ON pa.cve_puesto_aprendizaje = p.cve_puesto_aprendizaje "
                                  + "INNER JOIN carreras_universidad c ON c.cve_carrera = pa.cve_carrera "
                                  + "WHERE c.cve_director = "+cve_usuario+" AND p.cve_dual_puesto = "+cve_dual_puesto+"";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next()) 
                        {
                            numero = rs.getInt(1);
                            objetivo = rs.getString(2);
                            resultado = rs.getString(3);
                            %>
                                <tr>
                                    <td class="align-middle text-center"><a href="javascript:FBuscar(<%=numero%>)"><%=numero%></a></td>
                                    <td class="align-middle text-center"><%=objetivo%></td>
                                    <td class="align-middle text-center"><%=resultado%></td>
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