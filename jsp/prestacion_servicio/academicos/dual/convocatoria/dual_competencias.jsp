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
        
        String consultas = "", nombre_carrera = "", nombre_unidad = "";
        int cve_carrera = 0;

        %>
            <html>
                <head>
                    <title>Registro de competencias</title>
                    
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
                            <td class="titulo">REGISTRO DE COMPETENCIAS</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                    </table>
                    
                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-3">&nbsp;</div>
                        <div class="col-md-1">
                            Folio
                            <br>
                            <input type="text" name="TCveCompetencia" id="TCveCompetencia" class="captura combo100" readonly value="0">
                        </div>
                        <div class="col-md-2">
                            Nombre de la competencia
                            <br>
                            <input type="text" name="TNombreCompetencia" id="TNombreCompetencia" class="captura_obligada combo200" onkeypress="return FNombre_competencia(event)">
                        </div>
                        <div class="col-md-3">
                            Carrera
                            <br>
                            <select name="SCarrera" id="SCarrera" class="captura combo300">
                                <option value="-1">...selecciona...</option>
                                <%
                                    consultas = "SELECT c.cve_carrera, c.descripcion, u.nombre "
                                              + "FROM carreras_universidad c INNER JOIN unidades_academicas u ON c.cve_unidad_academica = u.cve_unidad_academica "
                                              + "WHERE (c.activo = 1) AND c.cve_director = "+cve_usuario+" "
                                              + "ORDER BY c.cve_unidad_academica, c.continuidad ASC";
                                    rs = SMBD.SQLBD(consultas);
                                    while (rs.next())
                                    {
                                        cve_carrera = rs.getInt(1);
                                        nombre_carrera = rs.getString(2);
                                        nombre_unidad = rs.getString(3);
                                        %>
                                            <option value="<%=cve_carrera%>"><%=nombre_carrera%> / <%=nombre_unidad%></option>
                                        <%
                                    }
                                    SMBD.desconectarBD();
                                %>
                            </select>
                        </div>
                        <div class="col-md-3">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-3" id="gif_espera">&nbsp;</div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Limpiar" onclick="FLimpiar()">
                            <br>
                            Limpiar/Nuevo
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistrar_competencias()">
                            <br>
                            Guardar/Modificar
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Cerrar" onclick="window.opener.FActualizar_select_competencias(); window.close()">
                            <br>
                            Cerrar
                        </div>
                        <div class="col-md-3">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblCompetencias">
                                <!--Tabla-->
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
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

                    function FNombre_competencia(event) 
                    {
                        var key = (event.keyCode || event.which);
                        var tecla = String.fromCharCode(key).toString();
                        var letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú 1234567890";

                        if (letras.indexOf(tecla) == -1) 
                        {
                            return false;
                        }
                    }

                    function FTabla_competencias()
                    {
                        FCargando();
                        var par = 
                        {
                            "p_cve_usuario" : <%=cve_usuario%>
                        }

                        $.post
                        (
                            "dual_competencias/tabla_competencias.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblCompetencias').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_competencias()

                    function FRegistrar_competencias()
                    {
                        var valida = 0;
                        if ($('#TNombreCompetencia').val() == "" || $('#TNombreCompetencia').val() == null) 
                        {
                            alert("Favor de ingresar el nombre");
                            valida++;
                            $('#TNombreCompetencia').focus();
                        }
                        else
                        {
                            if ($('#SCarrera').val() == -1 || $('#SCarrera').val() == null) 
                            {
                                alert("Favor de ingresar la carrera");
                                valida++;
                                $('#SCarrera').focus();
                            }
                            else
                            {
                                if ($('#TCveCompetencia').val() != 0) 
                                {
                                    FActualizar_competencias();
                                    valida++;
                                }
                            }
                        }

                        if (valida == 0)
                        {
                            FCargando();
                            var par = 
                            {
                                "p_TCveCompetencia"    : $('#TCveCompetencia').val(),
                                "p_TNombreCompetencia" : $('#TNombreCompetencia').val(),
                                "p_SCarrera"           : $('#SCarrera').val(),
                                "p_cve_usuario"        : <%=cve_usuario%>
                            }

                            $.ajax
                            (
                                {
                                    data        : par,
                                    url         : "dual_competencias/registrar_competencia.jsp",
                                    type        : "POST",
                                    dataType    : "JSON",
                                    success     : function (res)
                                                  {
                                                      alert(res.error);
                                                      FTerminado();
                                                      $('#TCveCompetencia').val(res.cve_competencia);
                                                      FTabla_competencias();
                                                  }
                                }
                            );
                        }
                    }

                    function FLimpiar()
                    {
                        $('#TCveCompetencia').val(0);
                        $('#TNombreCompetencia').val("");
                        $('#SCarrera').val(-1);
                    }

                    function FBuscar_competencias(cve_competencia) 
                    {
                        FCargando();
                        var par = 
                        {
                            "p_TCveCompetencia" : cve_competencia
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_competencias/buscar_competencia.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  $('#TCveCompetencia').val(res.cve_competencia);
                                                  $('#TNombreCompetencia').val(res.nombre_competencia);
                                                  $('#SCarrera').val(res.cve_carrera);
                                                  FTerminado();
                                              }
                            }
                        );
                    }

                    function FActualizar_competencias()
                    {
                        FCargando();
                        var par =
                        {
                            "p_TCveCompetencia"    : $('#TCveCompetencia').val(),
                            "p_TNombreCompetencia" : $('#TNombreCompetencia').val(),
                            "p_SCarrera"           : $('#SCarrera').val(),
                            "p_cve_usuario"        : <%=cve_usuario%> 
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_competencias/actualizar_competencia.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  alert(res.error);
                                                  FTabla_competencias();
                                                  FTerminado();
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