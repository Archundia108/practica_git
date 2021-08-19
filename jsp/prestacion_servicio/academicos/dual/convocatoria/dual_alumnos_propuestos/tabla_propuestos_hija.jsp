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
        int cve_convocatoria = Integer.parseInt(request.getParameter("p_cve_convocatoria"));
        int v = Integer.parseInt(request.getParameter("p_v"));

        String consultas = "", nombre_alumno = "", fecha_notificacion = "", expediente = "";
        int cve_alumno = 0;
        
        %>
            <table class="table-hover table-bordered" width="100%">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-secondary align-middle text-center">
                        <th scope="col">Expediente</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Fecha de notificación</th>
                        <th scope="col">Notificar</th>
                        <th scope="col">Quitar</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        consultas = "SELECT dal.cve_alumno, al.expediente, CONCAT(p.nombre, ' ', p.apellido_pat, ' ', p.apellido_mat) as nombre, "
                                  + "ISNULL(CONVERT(VARCHAR(24), dal.fecha_tutor_notif, 103),'No se ha notificado') AS fecha_notificacion "
                                  + "FROM personas p "
                                  + "INNER JOIN dual_alumnos dal ON dal.cve_alumno = p.cve_persona "
                                  + "INNER JOIN alumnos al ON al.cve_alumno = dal.cve_alumno "
                                  + "INNER JOIN dual_convocatorias con ON con.cve_convocatoria = dal.cve_convocatoria "
                                  + "WHERE (con.cve_convocatoria = "+cve_convocatoria+")";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next())
                        {
                            cve_alumno = rs.getInt(1);
                            expediente = rs.getString(2);
                            nombre_alumno = rs.getString(3);
                            fecha_notificacion = rs.getString(4);
                            %>
                                <tr>
                                    <td class="align-middle text-center"><%=expediente%></td>
                                    <td class="align-middle text-center"><%=nombre_alumno%></td>
                                    <td class="align-middle text-center"><%=fecha_notificacion%></td>
                                    <td class="align-middle text-center">
                                        <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar" onclick="FNotificar_alumno('<%=v%>', '<%=cve_usuario%>', '<%=cve_convocatoria%>', '<%=cve_alumno%>')">   
                                    </td>
                                    <td class="align-middle text-center">
                                        <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Quitar" onclick="FQuitar_alumno('<%=v%>', '<%=cve_usuario%>', '<%=cve_convocatoria%>', '<%=cve_alumno%>')">
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