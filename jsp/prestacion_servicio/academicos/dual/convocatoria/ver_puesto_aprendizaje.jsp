<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
    if (session.getAttribute("usuario") != null)
    {
        BD SMBD = new BD();
        ResultSet rs;
        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("cve_puesto_aprendizaje"));

        String consultas = "", error = "", nombre_dual_puesto = "", objetivo_gral = "", requerimientos_gral = "", 
               nombre_puesto_aprendizaje = "", con_teoricos = "", con_procedimentales = "", con_actitudinales = "", actvd_desarrollo = "";

        consultas = "SELECT nombre_puesto_aprendizaje "
                  + "FROM dual_puestos_aprendizaje "
                  + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next()) 
        {
            nombre_puesto_aprendizaje = rs.getString(1);
        }
        %>
            <!DOCTYPE html>
            <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Puesto de aprendizaje</title>
                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                    <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
                </head>
                <body>
                    <div class="row">
                        <div class="col-md-12">
                            <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                                <tr align="center">
                                    <td class="titulo">Puesto de aprendizaje: <%=nombre_puesto_aprendizaje%></td>
                                </tr>
                                <tr align="center">
                                    <td class="usuario"><%=usuario%></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0">
                                <thead class="table-dark SoloTexto2">
                                    <tr class="bg-info">
                                        <th class="aling-middle text-center" colspan="7" scope="col">Puestos de <%=nombre_puesto_aprendizaje%></th>
                                    </tr>
                                    <tr class="bg-secondary">
                                        <th class="aling-middle text-center" scope="col">Puestos</th>
                                        <th class="aling-middle text-center" scope="col">Objetivos generales</th>
                                        <th class="aling-middle text-center" scope="col">Requerimientos</th>
                                        <th class="aling-middle text-center" scope="col">Conocimientos teóricos</th>
                                        <th class="aling-middle text-center" scope="col">Conocimientos procedimentales</th>
                                        <th class="aling-middle text-center" scope="col">Conocimientos actitudinales</th>
                                        <th class="aling-middle text-center" scope="col">Actividades a desarrollar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        consultas = "SELECT pu.nombre_dual_puesto, pu.objetivo_gral, pu.requerimientos_gral, pu.con_teoricos, pu.con_procedimentales, pu.con_actitudinales, pu.actvd_desarrollo "
                                                + "FROM dual_puestos pu "
                                                + "INNER JOIN dual_puestos_aprendizaje pa ON pa.cve_puesto_aprendizaje = pu.cve_puesto_aprendizaje "
                                                + "WHERE pa.cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" "
                                                + "ORDER BY pu.cve_dual_puesto DESC";
                                        rs = SMBD.SQLBD(consultas);
                                        while (rs.next()) 
                                        {
                                            nombre_dual_puesto = rs.getString(1);
                                            objetivo_gral = rs.getString(2);
                                            requerimientos_gral = rs.getString(3);
                                            con_teoricos = rs.getString(4);
                                            con_procedimentales = rs.getString(5);
                                            con_actitudinales = rs.getString(6);
                                            actvd_desarrollo = rs.getString(7);
                                            %>
                                                <tr>
                                                    <td class="aling-middle text-center"><%=nombre_dual_puesto%></td>
                                                    <td class="aling-middle text-center"><%=objetivo_gral%></td>
                                                    <td class="aling-middle text-center"><%=requerimientos_gral%></td>
                                                    <td class="aling-middle text-center"><%=con_teoricos%></td>
                                                    <td class="aling-middle text-center"><%=con_procedimentales%></td>
                                                    <td class="aling-middle text-center"><%=con_actitudinales%></td>
                                                    <td class="aling-middle text-center"><%=actvd_desarrollo%></td>
                                                </tr>
                                            <%
                                        }
                                        SMBD.desconectarBD();
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-5">&nbsp;</div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Cerrar" onclick="window.close()">    
                            <br>
                            Cerrar
                        </div>
                        <div class="col-md-5">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">    
                        <div class="col-md-12">
                            Universidad Tecnológica de San Juan del Río <br>
                            Departamento de Tecnologías de la Información <br>
                            <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Edgar Gabriel Arteaga Archundia">
                                Desarrollo-Estadias
                            </a>
                        </div>
                    </div>
                </body>
                <script type="text/JavaScript" language="JavaScript">
                </script>
            </html>
        <%
    }
    else
    {
        out.print("Inicia sesi&oacute;n");
    }
%>