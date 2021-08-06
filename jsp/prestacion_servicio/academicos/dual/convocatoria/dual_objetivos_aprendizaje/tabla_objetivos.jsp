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
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("p_cve_puesto_aprendizaje"));

        String consultas = "", error = "", objetivo = "", resultado = "";
        int numero = 0;
        %>
            <thead class="table-dark">
                <tr class="bg-secondary">
                    <th class="align-middle text-center" scope="col">Folio</th>
                    <th class="align-middle text-center" scope="col">Objetivo</th>
                    <th class="align-middle text-center" scope="col">Resutado</th>
                </tr>
            </thead>

            <tbody>
                <%
                    consultas = "SELECT ob.numero, ob.objetivo, ob.resultado "
                              + "FROM dual_objetivos_aprendizaje ob "
                              + "INNER JOIN dual_puestos_aprendizaje p ON p.cve_puesto_aprendizaje = ob.cve_puesto_aprendizaje "
                              + "INNER JOIN dual_competencias pa ON pa.cve_competencia = p.cve_competencia "
                              + "INNER JOIN carreras_universidad c ON c.cve_carrera = pa.cve_carrera "
                              + "WHERE c.cve_director = "+cve_usuario+" AND p.cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+"";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next()) 
                    {
                        numero = rs.getInt(1);
                        objetivo = rs.getString(2);
                        resultado = rs.getString(3);
                        %>
                            <tr>
                                <td class="align-middle text-center"><a href="javascript:FBuscar_objetivo(<%=numero%>)"><%=numero%></a></td>
                                <td class="align-middle text-center"><%=objetivo%></td>
                                <td class="align-middle text-center"><%=resultado%></td>
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