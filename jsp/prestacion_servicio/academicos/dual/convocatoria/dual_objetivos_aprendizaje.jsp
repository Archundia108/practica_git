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
        String nombre_puesto_aprendizaje = request.getParameter("nombre_puesto_aprendizaje");
        int cve_puesto_aprendizaje = Integer.parseInt(request.getParameter("cve_puesto_aprendizaje"));
        int anio = Integer.parseInt(request.getParameter("anio"));

        String consultas = "", error = "", objetivo = "";
        int numero = 0;

        %> 
            <html>
                <head>
                    <title>Objetivos de aprendizaje</title>
                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                    <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
                </head>

                <body>
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="titulo">OBJETIVOS DE APRENDIZAJE</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                    </table>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-2">&nbsp;</div>
                        <div class="col-md-2">
                            Puesto
                            <br>
                            <input type="text"class="captura combo200" value="<%=nombre_puesto_aprendizaje%>" readonly>
                        </div>
                        <div class="col-md-2">
                            Folio
                            <br>
                            <input type="text" name="TFolioObjetivo" id="TFolioObjetivo" class="captura combo100" value="0" readonly>
                        </div>
                        <div class="col-md-2">
                            Objetivo
                            <br>
                            <textarea name="TObjetivo" id="TObjetivo" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                        </div>
                        <div class="col-md-2">
                            Resultado
                            <br>
                            <textarea name="TResultado" id="TResultado" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                        </div>
                        <div class="col-md-2">&nbsp;</div>
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
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistrar_objetivo()">
                            <br>
                            Guardar/Modificar
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Cerrar" onclick="window.close()">
                            <br>
                            Cerrar
                        </div>
                        <div class="col-md-3">&nbsp;</div>
                    </div>

                    <br>
                    <div class="col-md-12">
                        <table class="table table-hover table-sm border border-info SoloTexto2" cellpadding="0" cellspacing="0" id="TblObjetivos">
                            <!--Tabla-->
                        </table>
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

                    function FCaracteres(event) 
                    {
                        var key = (event.keyCode || event.which);                
                        var tecla = String.fromCharCode(key).toString();
                        var letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú1234567890 ,.";

                        if (letras.indexOf(tecla) == 13) 
                        {
                            if (letras.indexOf(tecla) == -1) 
                            {
                                return false;   
                            }
                        }
                    }

                    function FTabla_objetivos() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_usuario"             : <%=cve_usuario%>,
                            "p_cve_puesto_aprendizaje"  : <%=cve_puesto_aprendizaje%>
                        }

                        $.post
                        (
                            "dual_objetivos_aprendizaje/tabla_objetivos.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblObjetivos').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_objetivos()

                    function FRegistrar_objetivo() 
                    {
                        var valida = 0;
                        if ($('#TObjetivo').val() == 0 || $('#TObjetivo').val() == null) 
                        {
                            alert("Favor de redactar el objetivo");
                            $('#TObjetivo').focus();
                            valida++;
                        }
                        else
                        {
                            if ($('#TResultado').val() == 0 || $('#TResultado').val() == null) 
                            {
                                alert("Favor de redactar el resultado");
                                $('#TResultado').focus();
                                valida++;
                            }
                            else
                            {
                                if ($('#TFolioObjetivo').val() != 0) 
                                {
                                    FActualizar_objetivo();
                                    valida++;
                                }
                            }
                        }

                        if (valida == 0) 
                        {
                            FCargando();
                            var par = 
                            {
                                "p_objetivo"                : $('#TObjetivo').val(),
                                "p_resultado"               : $('#TResultado').val(),
                                "p_cve_puesto_aprendizaje"  : <%=cve_puesto_aprendizaje%>,
                                "p_anio"                    : <%=anio%>,
                                "p_cve_usuario"             : <%=cve_usuario%>
                            }

                            $.ajax
                            (
                                {
                                    data     : par,
                                    url      : "dual_objetivos_aprendizaje/registrar_objetivo.jsp",
                                    type     : "POST",
                                    dataType : "JSON",
                                    success  : function(res) 
                                               {
                                                   alert(res.error);
                                                   FTerminado();
                                                   $('#TFolioObjetivo').val(res.numero);
                                                   FTabla_objetivos();
                                               }
                                }
                            );
                        }
                    }

                    function FBuscar_objetivo(numero) 
                    {
                        FCargando();
                        var par =
                        {
                            "p_numero" : numero
                        }

                        $.ajax
                        (
                            {
                                data : par,
                                url : "dual_objetivos_aprendizaje/buscar_objetivo.jsp",
                                type : "POST",
                                dataType : "JSON",
                                success : function (res) 
                                          {
                                              $('#TFolioObjetivo').val(res.numero);
                                              $('#TObjetivo').val(res.objetivo);
                                              $('#TResultado').val(res.resultado);
                                              FTerminado();
                                          }
                            }
                        );
                    }

                    function FLimpiar() 
                    {
                        FCargando();
                        $('#TFolioObjetivo').val(0);
                        $('#TObjetivo').val("");
                        $('#TResultado').val("");
                        FTerminado();
                    }

                    function FActualizar_objetivo() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_numero"                  : $('#TFolioObjetivo').val(),
                            "p_objetivo"                : $('#TObjetivo').val(),
                            "p_resultado"               : $('#TResultado').val(),
                            "p_cve_puesto_aprendizaje"  : <%=cve_puesto_aprendizaje%>,
                            "p_anio"                    : <%=anio%>,
                            "p_cve_usuario"             : <%=cve_usuario%>
                        }

                        $.ajax
                        (
                            {
                                data : par,
                                url : "dual_objetivos_aprendizaje/actualizar_objetivo.jsp",
                                type : "POST",
                                dataType : "JSON",
                                success : function (res) 
                                          {
                                              alert(res.error);
                                              FTerminado();
                                              FTabla_objetivos();
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