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
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));
        int cve_competencia = Integer.parseInt(request.getParameter("cve_competencia"));

        String consultas = "", error = "", nombre_empresa = "", giro_empresa = "", nombre_competencia = "";
        int cve_empresa = 0;

        consultas = "SELECT nombre_competencia "
                  + "FROM dual_competencias  "
                  + "WHERE cve_competencia = "+cve_competencia+" ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            nombre_competencia = rs.getString(1);
        }
        SMBD.desconectarBD();

        %>
            <html>
                <head>
                    <title>Selección de empresas</title>
                    
                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/normalize.css">
                    <link rel="stylesheet" href="../../../../../estilos/estilos.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap.min.css">

                    <script type="text/javascript" language="JavaScript1.2" src="../../../../../jsp/menu/stmenu.js"></script>
                    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/popcalendar.js"></script>
                    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/bootstrap.min.js"></script>
                </head>

                <body>
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="titulo">ASIGNACIÓN DE EMPRESAS</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                    </table>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-3">&nbsp;</div>
                        <div class="col-md-2">
                            Competencia
                            <br>
                            <input type="text" class="captura combo200" value="<%=nombre_competencia%>" readonly>
                        </div>
                        <div class="col-md-2">
                            Seleccionar empresa
                            <br>
                            <select name="SEmpresa" id="SEmpresa" class="captura combo200">
                                <option value="-1">...seleccionar...</option>
                                <%
                                    consultas = "SELECT cve_empresa, nombre, giro_empresa "
                                              + "FROM direc_empresas";
                                    rs = SMBD.SQLBD(consultas);
                                    while (rs.next())
                                    {
                                        cve_empresa = rs.getInt(1);
                                        nombre_empresa = rs.getString(2);
                                        giro_empresa = rs.getString(3);
                                        %>
                                            <option value="<%=cve_empresa%>"><%=nombre_empresa%> / <%=giro_empresa%></option>
                                        <%
                                    }
                                    SMBD.desconectarBD();
                                %>
                            </select>
                        </div>
                        <div class="col-md-2">
                            Guardar
                            <br>
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistrar_empresa()">
                        </div>
                        <div class="col-md-3" id="gif_espera">&nbsp;</div>
                    </div>

                    <br>
                    <div class="col-md-12">
                        <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblEmpresas">
                            <!--Tabla-->
                        </table>
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
                    function FCargando() 
                    {
                        $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');
                    }

                    function FTerminado() 
                    {
                        $('#gif_espera').html('&nbsp;');
                    }

                    function FTabla_empresas() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_competencia" : "<%=cve_competencia%>"
                        }

                        $.post
                        (
                            "dual_empresas/tabla_empresas.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblEmpresas').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_empresas()

                    function FRegistrar_empresa() 
                    {
                        if ($('#SEmpresa').val() == -1 || $('#SEmpresa').val() == null) 
                        {
                            alert("Favor de registrar una empresa");
                            $('#SEmpresa').focus();
                        }
                        else
                        {
                            FCargando();
                            var par =
                            {
                                "p_SEmpresa"         : $('#SEmpresa').val(),
                                "p_cve_competencia"  : <%=cve_competencia%>
                            }

                            $.ajax
                            (
                                {
                                    data        : par,
                                    url         : "dual_empresas/registrar_empresa.jsp",
                                    type        : "POST",
                                    dataType    : "JSON",
                                    success     : function (res)
                                                  {
                                                      alert(res.error);
                                                      FTerminado();
                                                      FTabla_empresas();
                                                  }
                                }
                            );
                        }
                    }

                    function FQuitar_empresa(cve_empresa)
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_empresa"      : cve_empresa,
                            "p_cve_competencia"  : <%=cve_competencia%>
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_empresas/eliminar_empresa.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  alert(res.error);
                                                  FTerminado();
                                                  FTabla_empresas();
                                              }
                            }
                        );
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