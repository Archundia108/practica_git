<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp"%>

<% 
    try 
    {
        BD SMBD = new BD();
        ResultSet rs;

        int cve_usuario = Integer.parseInt(request.getParameter("p_cve_usuario"));
        int cve_convocatoria = Integer.parseInt(request.getParameter("p_cve_convocatoria"));
        int v = Integer.parseInt(request.getParameter("p_v"));

        String consultas = "", nombre_alumno = "";
        int cve_alumno = 0;
        
        %>
            <thead class="table-dark">
                <tr class="bg-secondary">
                    <th class="aling-middle text-center" scope="col">Expediente</th>
                    <th class="aling-middle text-center" scope="col">Nombre</th>
                    <th class="aling-middle text-center" scope="col">Notificar</th>
                    <th class="aling-middle text-center" scope="col">Quitar</th>
                </tr>
            </thead>

            <tbody>
                <%
                    consultas = "SELECT dal.cve_alumno, CONCAT(p.nombre, ' ', p.apellido_pat, ' ', p.apellido_mat) as nombre "
                              + "FROM personas p "
                              + "INNER JOIN dual_alumnos dal ON dal.cve_alumno = p.cve_persona "
                              + "INNER JOIN dual_convocatorias con ON con.cve_convocatoria = dal.cve_convocatoria "
                              + "WHERE con.cve_convocatoria = "+cve_convocatoria+" ";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next())
                    {
                        cve_alumno = rs.getInt(1);
                        nombre_alumno = rs.getString(2);
                        %>
                            <tr>
                                <td class="aling-middle text-center"><%=cve_alumno%></td>
                                <td class="aling-middle text-center"><%=nombre_alumno%></td>
                                <td class="aling-middle text-center">
                                    <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar" onclick="FNotificar_alumno('<%=cve_alumno%>')">   
                                </td>
                                <td class="aling-middle text-center">
                                    <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Quitar" onclick="FQuitar_alumno('<%=v%>', '<%=cve_usuario%>', '<%=cve_convocatoria%>', '<%=cve_alumno%>')">
                                </td>
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