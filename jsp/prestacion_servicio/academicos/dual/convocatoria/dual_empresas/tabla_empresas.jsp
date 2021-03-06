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

        int cve_competencia = Integer.parseInt(request.getParameter("p_cve_competencia"));

        String consultas = "", error = "", nombre_empresa = "", giro_empresa = "";
        int cve_empresa = 0;

        %>
            <table class="table-hover table-bordered" width="100%">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="4" scope="col">Listado de empresas</th>
                    </tr>
                    <tr class="bg-secondary align-middle text-center">
                        <th scope="col">Folio</th>
                        <th scope="col">Nombre de la empresa</th>
                        <th scope="col">Giro de la empresa</th>
                        <th scope="col">Quitar</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        int numero = 0;

                        consultas = "SELECT emp.nombre, emp.giro_empresa, emp.cve_empresa "
                                  + "FROM dual_empresas pe "
                                  + "INNER JOIN direc_empresas emp ON emp.cve_empresa = pe.cve_empresa "
                                  + "INNER JOIN dual_competencias pl ON pl.cve_competencia = pe.cve_competencia "
                                  + "WHERE (pl.cve_competencia = "+cve_competencia+")";
                        rs = SMBD.SQLBD(consultas);
                        while (rs.next()) 
                        {
                            numero++;
                            nombre_empresa = rs.getString(1);
                            giro_empresa = rs.getString(2);
                            cve_empresa = rs.getInt(3);
                            %>
                                <tr>
                                    <td class="align-middle text-center"><%=numero%></td>
                                    <td class="align-middle text-center"><%=nombre_empresa%></td>
                                    <td class="align-middle text-center"><%=giro_empresa%></td>
                                    <td class="align-middle text-center"><img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Quitar" onclick="FQuitar_empresa('<%=cve_empresa%>')"></td>
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