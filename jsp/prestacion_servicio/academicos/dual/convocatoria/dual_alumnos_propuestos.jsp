<%@ page language="java" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%
if (session.getAttribute("usuario") != null)
{
    String usuario = String.valueOf(session.getAttribute("usuario"));
    //int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
    int cve_usuario = 30824;

    %>
        <!DOCTYPE html>
        <html>
            <head>
                <meta charset="UTF-8">
                <title>Registro de puestos</title>
                <link rel="stylesheet" href="../../../../../estilos/sic.css">
                <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
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
                <div class="col-md-12 SoloTexto2">
                    <table class="table table-hover table-sm SoloTexto2" cellpading="0" cellspacing="0" id="TblPropuestos">
                        <thead class="table-dark SoloTexto2">
                            <tr class="bg-secondary">
                                <th class="aling-middle text-center" scope="col" colspan="2">Fecha de convocatoria</th>
                                <th class="aling-middle text-center" scope="col" rowspan="2">Descripción de convocatoria</th>
                                <th class="aling-middle text-center" scope="col" rowspan="2">Puesto de aprendizaje</th>
                                <th class="aling-middle text-center" scope="col" colspan="5">Asignación de alumnos</th>
                            </tr>
                            <tr class="bg-secondary">
                                <th class="aling-middle text-center" scope="col">Fecha de inicio</th>
                                <th class="aling-middle text-center" scope="col">Fecha de término</th>
                                <th class="aling-middle text-center" scope="col">Agregar (alumnos inscritos)</th>
                                <th class="aling-middle text-center" scope="col" colspan="4">Información de alumnos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">
                                    <a onclick="FVentana()" href="" class="liga">Ver</a>
                                </td>
                                <td class="aling-middle text-center">
                                    <input type="text" class="captura_obligada combo200" id="TAgregar" name="TAgregar">
                                    <img src="../../../../../imagenes/ikonoz/agregar_persona.png" class="iconsButtons" title="Agregar">
                                </td>
                                <td class="aling-middle text-center" colspan="4">
                                    <table class="table table-hover table-sm SoloTexto2" cellpading="0" cellspacing="0" id="TblAlumnos">
                                        <tr>
                                            <td class="aling-middle text-center">--</td>
                                            <td class="aling-middle text-center">--</td>
                                            <td class="aling-middle text-center">
                                                <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar">    
                                            </td>
                                            <td class="aling-middle text-center">
                                                <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Limpiar">    
                                            </td>
                                        </tr>
                                    </table>   
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

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
                        <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Neftali Cruz Soriano">
                            Coordinador de sistemas
                        </a>
                    </div>
                </div>
            </body>
            <script type="text/JavaScript" language="JavaScript">
                function FSalir() 
                {
                    location.href = "../../../../../menuDual.jsp";
                }

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
                    var letras = "ABCDEFGHIJKLMNÑOPQRSTUVXYZ1234567890-";

                    if (letras.indexOf(tecla) == -1) 
                    {
                        return false;
                    }
                }

                function FVentana(cve_puesto_aprendizaje)
                {
                    var w = screen.width;
                    var h = screen.height;
                    var left = w / 8;
                    var top =  h / 8;
                    w = (w / 8) * 6;
                    h = (h / 8) * 5;
                    
                    var URL = "ver_puesto_aprendizaje.jsp?cve_puesto_aprendizaje="+cve_puesto_aprendizaje;
                    
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
                    )
                }
                FTabla_alumnos();

                function FRegistra_alumnos(v, cve_usuario, cve_convocatoria) 
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
                                                                            FTabla(v, cve_usuario, cve_convocatoria);
                                                                            FTerminado();
                                                                        }
                                                        }
                                                    )
                                                }
                                                else
                                                {
                                                    FTerminado();
                                                }
                                            }
                            }
                        )
                        
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
                                                FTabla(v, cve_usuario, cve_convocatoria);
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
    out.print("Inicia sesi&oacute;n");
}
%>