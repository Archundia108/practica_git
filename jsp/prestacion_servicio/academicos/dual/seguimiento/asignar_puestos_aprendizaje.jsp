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
        int cve_competencia = Integer.parseInt(request.getParameter("cve_competencia"));

        String consultas = "", error = "", nombre_puesto_aprendizaje = "", objetivo_gral = "", requerimientos_gral = "", 
               nombre_competencia = "", con_teoricos = "", con_procedimentales = "", con_actitudinales = "", actvd_desarrollo = "";
        int numero_check = 0;

        consultas = "SELECT nombre_competencia "
                  + "FROM dual_competencias "
                  + "WHERE cve_competencia = "+cve_competencia+" ";
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
                            <td class="titulo">Competencia: <%=nombre_competencia%></td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                    </table>

                    <br>
                    <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0">
                        <thead class="table-dark">
                            <tr class="bg-info">
                                <th class="aling-middle text-center" colspan="11" scope="col">Puestos de <%=nombre_competencia%></th>
                            </tr>
                            <tr class="bg-secondary">
                                <th class="aling-middle text-center" scope="col">Puesto de aprendizaje</th>
                                <th class="aling-middle text-center" scope="col">Objetivos generales</th>
                                <th class="aling-middle text-center" scope="col">Requerimientos</th>
                                <th class="aling-middle text-center" scope="col">Conocimientos teóricos</th>
                                <th class="aling-middle text-center" scope="col">Conocimientos procedimentales</th>
                                <th class="aling-middle text-center" scope="col">Conocimientos actitudinales</th>
                                <th class="aling-middle text-center" scope="col">Actividades a desarrollar</th>
                                <th class="aling-middle text-center" scope="col">Seleccionar</th>
                                <th class="aling-middle text-center" scope="col">Orden</th>
                                <th class="aling-middle text-center" scope="col">Guardar</th>
                                <th class="aling-middle text-center" scope="col">Quitar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                consultas = "SELECT pu.nombre_puesto_aprendizaje, pu.objetivo_gral, pu.requerimientos_gral, pu.con_teoricos, pu.con_procedimentales, pu.con_actitudinales, pu.actvd_desarrollo "
                                          + "FROM dual_puestos_aprendizaje pu "
                                          + "INNER JOIN dual_competencias pa ON pa.cve_competencia = pu.cve_competencia "
                                          + "WHERE pa.cve_competencia = "+cve_competencia+" "
                                          + "ORDER BY pu.cve_puesto_aprendizaje ASC";
                                rs = SMBD.SQLBD(consultas);
                                while (rs.next()) 
                                {
                                    nombre_puesto_aprendizaje = rs.getString(1);
                                    objetivo_gral = rs.getString(2);
                                    requerimientos_gral = rs.getString(3);
                                    con_teoricos = rs.getString(4);
                                    con_procedimentales = rs.getString(5);
                                    con_actitudinales = rs.getString(6);
                                    actvd_desarrollo = rs.getString(7);
                                    numero_check++;
                                    %>
                                        <tr>
                                            <td class="aling-middle text-center"><%=nombre_puesto_aprendizaje%></td>
                                            <td class="aling-middle text-center"><%=objetivo_gral%></td>
                                            <td class="aling-middle text-center"><%=requerimientos_gral%></td>
                                            <td class="aling-middle text-center"><%=con_teoricos%></td>
                                            <td class="aling-middle text-center"><%=con_procedimentales%></td>
                                            <td class="aling-middle text-center"><%=con_actitudinales%></td>
                                            <td class="aling-middle text-center"><%=actvd_desarrollo%></td>
                                            <td class="aling-middle text-center"><input type="checkbox"id="CSeleccionar<%=numero_check%>" onclick="FVerificar_orden<%=numero_check%>()"></td>
                                            <td class="aling-middle text-center" id="SOrden<%=numero_check%>">
                                                <select disabled class="captura">
                                                    <option value="0">0</option>
                                                </select>
                                            </td>
                                            <td class="aling-middle text-center">
                                                <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar">
                                            </td>
                                            <td class="aling-middle text-center">
                                                <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Quitar">
                                            </td>

                                            <script type="text/JavaScript" language="JavaScript">
                                            function FVerificar_orden<%=numero_check%>() 
                                            {
                                                if ($('#CSeleccionar<%=numero_check%>').is(':checked')) 
                                                {
                                                    FCargando();
                                                    var par = 
                                                    {
                                                        "p_cve_competencia" : <%=cve_competencia%>
                                                    }

                                                    $.post
                                                    (
                                                        "asignar_puestos_aprendizaje/ver_orden.jsp", par,
                                                        function(htmlExterno) 
                                                        {
                                                            $('#SOrden<%=numero_check%>').html(htmlExterno);
                                                            FTerminado();
                                                        }
                                                    );
                                                }
                                                else
                                                {
                                                    $.post
                                                    (
                                                        "asignar_puestos_aprendizaje/deshabilitar_select.jsp", par,
                                                        function(htmlExterno) 
                                                        {
                                                            $('#SOrden<%=numero_check%>').html(htmlExterno);
                                                            FTerminado();
                                                        }
                                                    );
                                                }
                                            }
                                            </script>
                                        </tr>
                                    <%
                                }
                                SMBD.desconectarBD();
                            %>
                        </tbody>
                    </table>

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
                    function FCargando() 
                    {
                        $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');
                    }

                    function FTerminado() 
                    {
                        $('#gif_espera').html('&nbsp;');
                    }
                </script>
            </html>
        <%
    }
    else
    {
        out.print("Inicia sesión");
    }
%>