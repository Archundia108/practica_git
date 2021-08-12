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
        
        String consultas = "";
        int numero_puestos_aprendizaje = 0;

        %>
            <select class="captura">
                <%
                    consultas = "SELECT cve_puesto_aprendizaje "
                              + "FROM dual_puestos_aprendizaje "
                              + "WHERE cve_competencia = "+cve_competencia+" ";
                    rs = SMBD.SQLBD(consultas);
                    while (rs.next()) 
                    {
                        numero_puestos_aprendizaje++;
                        %>
                            <option value="<%=numero_puestos_aprendizaje%>"><%=numero_puestos_aprendizaje%></option>
                        <%
                    }
                    SMBD.desconectarBD();
                %>
            </select>
        <%
    } 
    catch (Exception e) 
    {
        out.print("Wacha el error: " +e);
    }
%> 