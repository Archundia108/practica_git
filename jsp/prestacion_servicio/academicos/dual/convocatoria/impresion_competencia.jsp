<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../error.jsp"
%>

<%
    if (session.getAttribute("usuario") != null)
    {
        BD SMBD = new BD();
        ResultSet rs;

        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("cve_puesto_aprendizaje"));
        int anio = Integer.parseInt(request.getParameter("anio"));

        String consultas = "", error = "", nombre_puesto_aprendizaje = "", objetivo_gral = "", requerimientos_gral = "", 
               nombre_competencia = "", con_teoricos = "", con_procedimentales = "", con_actitudinales = "", actvd_desarrollo = "",
               nombre_empresa = "", objetivo = "", resultado = "";

        consultas = "SELECT dcom.nombre_competencia "
                  + "FROM dual_competencias dcom "
                  + "INNER JOIN dual_puestos_aprendizaje dap ON dcom.cve_competencia = dap.cve_competencia "
                  + "WHERE dap.cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next()) 
        {
            nombre_competencia = rs.getString(1);
        }
        %>            
            <html>
                <head>
                    <title>Puesto de aprendizaje</title>
                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                    <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
                </head>

                <body>
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="titulo">Definición de competencia <%=nombre_competencia%></td>
                        </tr>
                    </table>

                    <br>
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table" cellpading = "0" cellspacing = "0" border="1">
                                <tbody>
                                    <tr>
                                        <td class="SoloTexto">Nombre de las empresas disponibles</td>
                                        <%
                                            consultas = "SELECT emp.nombre "
                                                      + "FROM direc_empresas emp "
                                                      + "INNER JOIN dual_empresas demp ON emp.cve_empresa = demp.cve_empresa "
                                                      + "INNER JOIN dual_puestos_aprendizaje dpa ON dpa.cve_competencia = demp.cve_competencia "
                                                      + "WHERE dpa.cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
                                            rs = SMBD.SQLBD(consultas);
                                            while (rs.next()) 
                                            {
                                                nombre_empresa = rs.getString(1);
                                                %>
                                                    <tr class="SoloTexto2">
                                                        <td><%=nombre_empresa%></td>
                                                    </tr>
                                                <%
                                            }
                                        %>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table" cellpading = "0" cellspacing = "0" border="1">
                                <thead>
                                    <tr class="SoloTexto">
                                        <th colspan="2">Puesto de aprendizaje</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        consultas = "SELECT nombre_puesto_aprendizaje, objetivo_gral, requerimientos_gral, con_teoricos, con_procedimentales, con_actitudinales, actvd_desarrollo "
                                                  + "FROM dual_puestos_aprendizaje "
                                                  + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
                                        rs = SMBD.SQLBD(consultas);
                                        while (rs.next()) 
                                        {
                                            nombre_puesto_aprendizaje = rs.getString(1);
                                            objetivo_gral= rs.getString(2);
                                            requerimientos_gral = rs.getString(3);
                                            con_teoricos = rs.getString(4);
                                            con_procedimentales = rs.getString(5);
                                            con_actitudinales = rs.getString(6);
                                            actvd_desarrollo = rs.getString(7);
                                        }
                                    %>
                                    <tr>
                                        <td class="SoloTexto">Nombre</td>
                                        <td class="SoloTexto2"><%=nombre_puesto_aprendizaje%></td>
                                    </tr>
                                    <tr>
                                        <td class="SoloTexto">Objetivo de aprendizaje general</td>
                                        <td class="SoloTexto2"><%=objetivo_gral%></td>
                                    </tr>
                                    <tr>
                                        <td class="SoloTexto">Requerimientos generales</td>
                                        <td class="SoloTexto2"><%=requerimientos_gral%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>
                    
                    <br>
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table" cellpading = "0" cellspacing = "0" border="1">
                                <thead>
                                    <tr class="SoloTexto">
                                        <th colspan="3">Conocimientos previos necesarios para el puesto de aprendizaje</th>
                                    </tr>
                                    <tr class="SoloTexto">
                                        <th>Teóricos</th>
                                        <th>Procedimentales</th>
                                        <th>Actitudinales</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="SoloTexto2">
                                        <td><%=con_teoricos%></td>
                                        <td><%=con_procedimentales%></td>
                                        <td><%=con_actitudinales%></td>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-5">
                            <table class="table" cellpading = "0" cellspacing = "0" border="1">
                                <thead>
                                    <tr class="SoloTexto">
                                        <th>Actividades a desarrollar durante la formación en el puesto de aprendizaje</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr class="SoloTexto2">
                                        <td><%=actvd_desarrollo%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5">
                            <table class="table" cellpading = "0" cellspacing = "0" border="1">
                                <thead>
                                    <tr class="SoloTexto">
                                        <th>Objetivos de aprendizaje</th>
                                        <th>Resultados de aprendizaje</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        consultas = "SELECT objetivo, resultado "
                                                  + "FROM dual_objetivos_aprendizaje "
                                                  + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
                                        rs = SMBD.SQLBD(consultas);
                                        while (rs.next()) 
                                        {
                                            objetivo = rs.getString(1);
                                            resultado = rs.getString(2);
                                            %>
                                                <tr class="SoloTexto2">
                                                    <td><%=objetivo%></td>
                                                    <td><%=resultado%></td>
                                                </tr>
                                            <%
                                        }
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
            </html>
        <%
    }
    else
    {
        out.print("Inicia sesión");
    }
%>