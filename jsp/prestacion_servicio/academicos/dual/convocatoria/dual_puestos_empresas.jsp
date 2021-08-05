<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") != null)
    {
        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("cve_puesto_aprendizaje"));

        BD SMBD = new BD();
        ResultSet rs;
        String consultas = "", error = "", nombre_empresa = "", giro_empresa = "", nombre_puesto_aprendizaje = "";
        int cve_empresa = 0;

        consultas = "SELECT nombre_puesto_aprendizaje "
                + "FROM dual_puestos_aprendizaje  "
                + "WHERE cve_puesto_aprendizaje = "+cve_puesto_aprendizaje+" ";
        rs = SMBD.SQLBD(consultas);
        while (rs.next())
        {
            nombre_puesto_aprendizaje = rs.getString(1);
        }
        SMBD.desconectarBD();
        %>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                    
                    <title>Selección de empresas</title>

                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                    <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
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
                            Puesto de aprendizaje
                            <br>
                            <input type="text" class="captura combo200" value="<%=nombre_puesto_aprendizaje%>" readonly>
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
                        <table style="margin: auto;" align="" class="table table-hover table-sm border border-info SoloTexto2" cellpadding="0" cellspacing="0" id="TblEmpresas">
                            <thead class="table-dark SoloTexto2">
                                <tr class="bg-info">
                                    <th class="align-middle text-center" colspan="4" scope="col">Listado de empresas</th>
                                </tr>
                                <tr class="bg-secondary">
                                    <th class="align-middle text-center" scope="col">Folio</th>
                                    <th class="align-middle text-center" scope="col">Nombre de empresa</th>
                                    <th class="align-middle text-center" scope="col">Giro de la empresa</th>
                                    <th class="align-middle text-center" scope="col">Quitar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="align-middle text-center">--</td>
                                    <td class="align-middle text-center">--</td>
                                    <td class="align-middle text-center">--</td>
                                    <td class="align-middle text-center">
                                        <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Quitar">
                                    </td>
                                </tr>
                            </tbody>
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
                    function FCargando() {
                        $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">')
                    }

                    function FTerminado() {
                        $('#gif_espera').html('&nbsp;')
                    }

                    function FTabla_empresas() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_puesto_aprendizaje" : "<%=cve_puesto_aprendizaje%>"
                        }
                        $.post
                        (
                            "dual_puestos_empresas/tabla_empresas.jsp", par,
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
                                "p_SEmpresa"               : $('#SEmpresa').val(),
                                "p_cve_puesto_aprendizaje" : <%=cve_puesto_aprendizaje%>
                            }
                            $.ajax
                            (
                                {
                                    data        : par,
                                    url         : "dual_puestos_empresas/registrar_empresa.jsp",
                                    type        : "POST",
                                    dataType    : "JSON",
                                    success     : function (res)
                                                {
                                                    alert(res.error);
                                                    FTerminado();
                                                    FTabla_empresas();
                                                }
                                }
                            )
                        }
                    }

                    function FQuitar_empresa(cve_empresa)
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_empresa"            : cve_empresa,
                            "p_cve_puesto_aprendizaje" : <%=cve_puesto_aprendizaje%>
                        }
                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_puestos_empresas/eliminar_empresa.jsp",
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
        out.print("Inicia sesi&oacute;n");
    }
%>