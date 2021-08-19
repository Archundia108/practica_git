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
        String usuario = String.valueOf(session.getAttribute("usuario"));
        //int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));
        int cve_usuario = 131;

        %>
            <html>
                <head>
                    <title>Registro de alumnos propuestos</title>
                    
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
                            <td><img src="../../../../../imagenes/banner.jpg" width="751" height="80"></td>
                        </tr>
                        <tr align="center">
                            <td class="titulo">PROYECTO DUAL</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                        <tr align="center">
                            <td class="encabezado">Proponer alumnos</td>
                        </tr>
                    </table>
                    
                    <br>
                    <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPropuestos">
                        <!--Tabla-->
                    </table>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-5" id="gif_espera">&nbsp;</div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir" onclick="FSalir()">
                            <br>
                            Salir
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
                    function FSalir() 
                    {
                        location.href = "../../../../../menuDual.jsp";
                    }

                    function FCargando() 
                    {
                        $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');
                    }

                    function FTerminado() 
                    {
                        $('#gif_espera').html('&nbsp;');
                    }

                    function FCaracteres(event) 
                    {
                        var key = (event.keyCode || event.which);
                        var tecla = String.fromCharCode(key).toString();
                        var letras = "ABCDEFGHIJKLMNÑOPQRSTUVXYZ1234567890-";

                        if (letras.indexOf(tecla) == -1) 
                        {
                            return false;
                        }
                    }

                    function FVentana_ver_competencias(cve_competencia)
                    {
                        var w = screen.width;
                        var h = screen.height;
                        var left = w / 8;
                        var top =  h / 8;
                        w = (w / 8) * 6;
                        h = (h / 8) * 5;
                        
                        var URL = "ver_competencia.jsp?cve_competencia="+cve_competencia;
                        
                        window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                    }

                    function FTabla_alumnos()
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_usuario" : <%=cve_usuario%>
                        }

                        $.post
                        (
                            "dual_alumnos_propuestos/tabla_propuestos_madre.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblPropuestos').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_alumnos();

                    function FRegistrar_alumnos(v, cve_usuario, cve_convocatoria) 
                    {
                        var valida = 0;
                        if ($('#TAgregar'+v).val() == "" || $('#TAgregar'+v).val() == null) 
                        {
                            alert("Favor de escribir el expediente del alumno");
                            $('#TAgregar'+v).focus();
                            valida++;
                        }

                        if (valida == 0) 
                        {
                            FCargando();
                            var par = 
                            {
                                "p_expediente" : $('#TAgregar'+v).val()
                            }

                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_alumnos_propuestos/buscar_nombre.jsp",
                                    type      : "POST",
                                    dataType  : "JSON",
                                    success   : function (res) 
                                                {
                                                    var nombre_alumno = res.nombre;
                                                    var confirmar = confirm("Confirmar a "+nombre_alumno);

                                                    if (confirmar == true) 
                                                    {
                                                        var par =
                                                        {
                                                            "p_exp_alumno"       : $('#TAgregar'+v).val(),
                                                            "p_cve_usuario"      : cve_usuario,
                                                            "p_cve_convocatoria" : cve_convocatoria
                                                        }

                                                        $.ajax
                                                        (
                                                            {
                                                                data      : par,
                                                                url       : "dual_alumnos_propuestos/registrar_propuesto.jsp",
                                                                type      : "POST",
                                                                dataType  : "JSON",
                                                                success   : function (res) 
                                                                            {
                                                                                alert(res.error);
                                                                                $('#TAgregar'+v).val("");
                                                                                FTabla_alumnos2(v, cve_usuario, cve_convocatoria);
                                                                                FTerminado();
                                                                            }
                                                            }
                                                        );
                                                    }
                                                    else
                                                    {
                                                        FTerminado();
                                                    }
                                                }
                                }
                            );
                            
                        }
                    }

                    function FQuitar_alumno(v, cve_usuario, cve_convocatoria, cve_alumno) 
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_alumno" : cve_alumno
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_alumnos_propuestos/eliminar_propuesto.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  alert(res.error);
                                                  FTabla_alumnos2(v, cve_usuario, cve_convocatoria);
                                                  FTerminado();
                                              }
                            }
                        );
                    }

                    function FNotificar_alumno(v, cve_usuario, cve_convocatoria, cve_alumno)
                    {
                        FCargando();
                        var par = 
                        {
                            "p_cve_alumno" : cve_alumno
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_alumnos_propuestos/notificar_propuesto.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  alert(res.error);
                                                  FTabla_alumnos2(v, cve_usuario, cve_convocatoria);
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