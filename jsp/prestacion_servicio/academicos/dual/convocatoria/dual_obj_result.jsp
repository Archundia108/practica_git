<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") != null)
    {
        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        String nombre_dual_puesto = request.getParameter("nombre_dual_puesto");
        int cve_dual_puesto = Integer.parseInt(request.getParameter("cve_dual_puesto"));
        int anio = Integer.parseInt(request.getParameter("anio"));

        BD SMBD = new BD();
        ResultSet rs;
        String consultas = "", error = "", objetivo = "";
        int numero = 0;
        %> 
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                    
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
                            <input type="text"class="captura combo200" value="<%=nombre_dual_puesto%>" readonly>
                        </div>
                        <div class="col-md-2">
                            Folio
                            <br>
                            <input type="text" name="TFolio" id="TFolio" class="captura combo100" value="0" readonly>
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
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="Fregistrar_objetivos()">
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
                        <table style="margin: auto;" align="" class="table table-hover table-sm border border-info SoloTexto2" cellpadding="0" cellspacing="0" id="TblObjetivos">
                            <thead class="table-dark SoloTexto2">
                                <tr class="bg-secondary">
                                    <th class="align-middle text-center" scope="col">Folio</th>
                                    <th class="align-middle text-center" scope="col">Objetivo</th>
                                    <th class="align-middle text-center" scope="col">Resutado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="align-middle text-center">--</td>
                                    <td class="align-middle text-center">--</td>
                                    <td class="align-middle text-center">--</td>
                            </tbody>
                        </table>
                    </div>

                    <br>
                    <div class="row SoloTexto2">    
                        <div class="col-md-12">
                            Universidad Tecnológica de San Juan del Río <br>
                            Departamento de Tecnologías de la Información <br>
                            <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Neftali Cruz Soriano">
                                Coordinador de sistemas
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
                            "p_cve_usuario"      : <%=cve_usuario%>,
                            "p_cve_dual_puesto"  : <%=cve_dual_puesto%>
                        }
                        $.post
                        (
                            "dual_obj_result/tabla_obj_result.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblObjetivos').html(htmlExterno);
                                FTerminado();
                            }
                        )
                    }
                    FTabla_objetivos()

                    function Fregistrar_objetivos() 
                    {
                        FCargando();
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
                                if ($('#TFolio').val() != 0) 
                                {
                                    FActualizar_objetivos();
                                    valida++;
                                }
                            }
                        }
                        if (valida == 0) 
                        {
                            var par = 
                            {
                                "p_objetivo"         : $('#TObjetivo').val(),
                                "p_resultado"        : $('#TResultado').val(),
                                "p_cve_dual_puesto"  : <%=cve_dual_puesto%>,
                                "p_anio"             : <%=anio%>,
                                "p_cve_usuario"      : <%=cve_usuario%>
                            }
                            $.ajax
                            (
                                {
                                    data     : par,
                                    url      : "dual_obj_result/registrar_obj_result.jsp",
                                    type     : "POST",
                                    dataType : "JSON",
                                    success  : function(res) 
                                                {
                                                    alert(res.error);
                                                    FTerminado();
                                                    $('#TFolio').val(res.numero);
                                                    FTabla_objetivos();
                                                }
                                }
                            );
                        }
                    }

                    function FBuscar(numero) 
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
                                url : "dual_obj_result/buscar_obj_result.jsp",
                                type : "POST",
                                dataType : "JSON",
                                success : function (res) 
                                            {
                                                $('#TFolio').val(res.numero);
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
                        $('#TFolio').val(0);
                        $('#TObjetivo').val("");
                        $('#TResultado').val("");
                        FTerminado();
                    }

                    function FActualizar_objetivos() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_numero"           : $('#TFolio').val(),
                            "p_objetivo"         : $('#TObjetivo').val(),
                            "p_resultado"        : $('#TResultado').val(),
                            "p_cve_dual_puesto"  : <%=cve_dual_puesto%>,
                            "p_anio"             : <%=anio%>,
                            "p_cve_usuario"      : <%=cve_usuario%>
                        }
                        $.ajax
                        (
                            {
                                data : par,
                                url : "dual_obj_result/actualizar_obj_result.jsp",
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
        out.print("Inicia sesi&oacute;n");
    }
%>