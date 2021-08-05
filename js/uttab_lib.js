// Title: uttab_lib
// Description: Funciones de JavaScript para el manejo del sistema integral de información
// Version: 1.0
// Date: 11-04-2002 (mm-dd-yyyy)
// Author: Enrique Díaz Carranza

function show_carreras(target_carrera, valor_carrera)
{
  var pag = "../jsp/muestra_carreras.jsp?cCarrera=" + target_carrera + "&xCarrera=" + valor_carrera;
  var vWinPres = window.open(pag, "Carreras",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_usuarios(target_usuario, valor_nombre, valor_appaterno, valor_apmaterno, valor_login)
{
  var pag = "../jsp/muestra_usuarios.jsp?cClave=" + target_usuario +
                                       "&xNombre=" + valor_nombre +
                                       "&xApPaterno=" + valor_appaterno +
                                       "&xApMaterno=" + valor_apmaterno +
                                       "&xLogin=" + valor_login;
  var vWinPres = window.open(pag, "Usuarios",
                             "width=650, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=280,left=180");
  vWinPres.opener = self;
}

function show_personas(target_persona, valor_nombre, valor_appaterno, valor_apmaterno)
{
  var pag = "../jsp/muestra_personas.jsp?cClave=" + target_persona +
                                       "&xNombre=" + valor_nombre +
                                       "&xApPaterno=" + valor_appaterno +
                                       "&xApMaterno=" + valor_apmaterno;
  var vWinPres = window.open(pag, "Personas",
                             "width=650, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=280,left=180");
  vWinPres.opener = self;
}

function show_normas_certificacion(target_norma, valor_norma)
{
  var pag = "muestra_normas_certificacion.jsp?cNorma=" + target_norma + "&xNorma=" + valor_norma;
  var vWinPres = window.open(pag, "normas_certificacion",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_modulos(target_modulo, valor_modulo)
{
  var pag = "../jsp/muestra_modulos.jsp?cModulo=" + target_modulo + "&xModulo=" + valor_modulo;
  var vWinPres = window.open(pag, "Modulos",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}


function show_asesor(target_asesor, valor_asesor, target_nombre, valor_nombre, target_appaterno, valor_appaterno, target_apmaterno, valor_apmaterno, valor_carrera)
{
  var pag = "../jsp/muestra_maestro_asesor.jsp?cMaestro=" + target_asesor + "&xMaestro=" + valor_asesor +
                                               "&cNombre=" +target_nombre + "&xNombre=" + valor_nombre +
                                               "&cApPaterno=" +target_appaterno + "&xApPaterno=" + valor_appaterno +
                                               "&cApMaterno=" +target_apmaterno + "&xApMaterno=" + valor_apmaterno +
                                               "&xCarrera=" + valor_carrera;

  var vWinPres = window.open(pag, "Grupos",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_maestros(target_maestro, valor_maestro, valor_nombre, valor_appaterno, valor_apmaterno)
{
  var pag = "../jsp/muestra_maestros.jsp?cMaestro=" + target_maestro + "&xMaestro=" + valor_maestro +
                                         "&xNombre=" + valor_nombre +
                                       "&xApPaterno=" + valor_appaterno +
                                       "&xApMaterno=" + valor_apmaterno;
  var vWinPres = window.open(pag, "Maestros",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_maestros_carga(target_maestro, valor_maestro, valor_nombre, valor_appaterno, valor_apmaterno)
{
  var pag = "../jsp/muestra_maestros_carga.jsp?cMaestro=" + target_maestro + "&xMaestro=" + valor_maestro +
                                         "&xNombre=" + valor_nombre +
                                       "&xApPaterno=" + valor_appaterno +
                                       "&xApMaterno=" + valor_apmaterno;
  var vWinPres = window.open(pag, "Maestros",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_alumnos(target_alumno, valor_alumno, valor_nombre, valor_appaterno, valor_apmaterno, valor_carrera , valor_grupo, valor_grado, valor_situacion, valor_turno, valor_matricula)
{
  var pag = "../jsp/muestra_alumnos.jsp?cAlumno=" + target_alumno + "&xAlumno=" + valor_alumno +
                                       "&xNombre=" + valor_nombre +
                                       "&xApPaterno=" + valor_appaterno +
                                       "&xApMaterno=" + valor_apmaterno +
                     "&xCarrera=" + valor_carrera +
                                       "&xGrupo=" + valor_grupo +
                                       "&xGrado=" + valor_grado +
                                       "&xSituacion=" + valor_situacion +
                                       "&xTurno=" + valor_turno +
                     "&xMatricula=" + valor_matricula;
  var vWinPres = window.open(pag, "Alumnos",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_personal(target_clave, target_nombre, valor_nombre)
{
  var pag = "../jsp/muestra_personal.jsp?cClave=" + target_clave + "&cNombre=" + target_nombre + "&xNombre=" + valor_nombre;
  var vWinPres = window.open(pag, "Personal",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_materias(target_materia, valor_materia)
{
  var pag = "../jsp/muestra_materias.jsp?cMateria=" + target_materia + "&xMateria=" + valor_materia;
  var vWinPres = window.open(pag, "Materias",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_planes(target_plan, valor_plan)
{
  var pag = "../jsp/muestra_planes.jsp?cPlan=" + target_plan + "&xPlan=" + valor_plan;
  var vWinPres = window.open(pag, "Planes",
                             "width=680, height=480, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function presDom(val_pers)
{
  var pag = "../jsp/domicilios.jsp?clave=" + val_pers;
  var vWinPres = window.open(pag, "Domicilios",
                             "width=600, height=400, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function presCom(val_pers)
{
  var pag = "../jsp/comunicacion.jsp?clave=" + val_pers;
  var vWinPres = window.open(pag, "Comunicacion",
                             "width=600, height=400, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_situaciones_alumno(target_situacion, valor_situacion)
{
  var pag = "../jsp/muestra_situaciones_alumno.jsp?csituacion=" + target_situacion + "&xsituacion=" + valor_situacion;
  var vWinPres = window.open(pag, "Situaciones_Alumno",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_areas_especialidad(target_area, valor_area)
{
  var pag = "../jsp/muestra_areas_especialidad.jsp?cArea=" + target_area + "&xArea=" + valor_area;
  var vWinPres = window.open(pag, "Areas_Especialidad",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_grados_academicos(target_grado, valor_grado)
{
  var pag = "../jsp/muestra_grados_academicos.jsp?cGrado=" + target_grado + "&Grado=" + valor_grado;
  var vWinPres = window.open(pag, "Grados_Academicos",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=100,left=100");
  vWinPres.opener = self;
}

function show_areas_conocimiento(target_area, valor_area)
{
  var pag = "../jsp/muestra_areas_conocimiento.jsp?cClave=" + target_area + "&xclave=" + valor_area;
  var vWinPres = window.open(pag, "Areas_Conocimientos",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=280,left=250");
  vWinPres.opener = self;
}

function show_turnos(target_turnos, valor_turnos)
{
  var pag = "../jsp/muestra_turnos.jsp?cClave=" + target_turnos + "&xclave=" + valor_turnos;
  var vWinPres = window.open(pag, "turnos",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=270,left=200");
  vWinPres.opener = self;
}

function show_costos(target_costos, valor_costos)
{
  var pag = "../jsp/admin_muestra_costos.jsp?cClave=" + target_costos + "&xclave=" + valor_costos;
  var vWinPres = window.open(pag, "costos",
                             "width=550, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=270,left=200");
  vWinPres.opener = self;
}

function show_grupo_seguridad(target_seguridad, valor_seguridad)
{
  var pag = "../jsp/muestra_grupo_seguridad.jsp?cClave=" + target_seguridad + "&xClave=" + valor_seguridad;
  var vWinPres = window.open(pag, "Grupo_Seguridad",
                             "width=650, height=350, statusbar=yes, directories=no, scrollbars=yes, resizable=no,top=280,left=180");
  vWinPres.opener = self;
}

function redondeaCalificacion(num)
{
  // tratarlo primero como si fuese cadena, hay que retornar un numero de tipo X.Y
  var cad = new String(num);
  var dec = "00";
  var nDec = 0;
  var pos = cad.indexOf('.');
  if ( pos >= 0 )
  {
    dec = '1' + cad.substr(pos + 1);
    cad = cad.substring(0, pos);
  }
  // dec tiene la parte decimal
  if ( dec.length > 4)
  {
    // la parte decimal es muy grande hay que redondearla a 3 decimales
    dec = dec.substr(0,4) + '.' + dec.substr(4);
    nDec = Math.round(dec*1);
    dec = new String(nDec);
  }
  dec = dec.substring(1,2);
  return cad + '.' + dec;
}
function getDateFromFormat(val,format)
{
  val 					= val+"";
  format 				= format+"";
  var i_val 		= 0;
  var i_format 	= 0;
  var c 				= "";
  var token 		= "";
  var token2		= "";
  var x,y;
  var now   		= new Date();
  var year  		= now.getYear();
  var month 		= now.getMonth()+1;
  var date  		= now.getDate();
  var hh    		= now.getHours();
  var mm    		= now.getMinutes();
  var ss    		= now.getSeconds();
  var ampm  		= "";

  while (i_format < format.length)
  {
    // Get next token from format string
    c = format.charAt(i_format);
    token = "";
    while ((format.charAt(i_format) == c) && (i_format < format.length))
    {
      token += format.charAt(i_format);
      i_format++;
    }
    // Extract contents of value based on format token
    if (token=="yyyy" || token=="yy" || token=="y")
    {
      if (token=="yyyy") { x=4;y=4; }// 4-digit year
      if (token=="yy")   { x=2;y=2; }// 2-digit year
      if (token=="y")    { x=2;y=4; }// 2-or-4-digit year
      year = _getInt(val,i_val,x,y);
      if (year == null) { return 0; }
      i_val += year.length;
      if (year.length == 2)
      {
        if (year > 70) { year = 1900+(year-0); }
        else { year = 2000+(year-0); }
      }
    }
    else if (token=="MMM")
    {// Month name
      month = 0;
      for (var i=0; i<MONTH_NAMES.length; i++)
      {
        var month_name = MONTH_NAMES[i];
        if (val.substring(i_val,i_val+month_name.length).toLowerCase() == month_name.toLowerCase())
        {
          month = i+1;
          if (month>12) { month -= 12; }
          i_val += month_name.length;
          break;
        }
      }

      if (month == 0) { return 0; }
      if ((month < 1) || (month>12)) { return 0; }
      // TODO: Process Month Name
    }
    else if (token=="MM" || token=="M")
    {
      x=token.length; y=2;
      month = _getInt(val,i_val,x,y);
      if (month == null) { return 0; }
      if ((month < 1) || (month > 12)) { return 0; }
      i_val += month.length;
    }
    else if (token=="dd" || token=="d")
    {
      x=token.length; y=2;
      date = _getInt(val,i_val,x,y);
      if (date == null) { return 0; }
      if ((date < 1) || (date>31)) { return 0; }
      i_val += date.length;
    }
    else if (token=="hh" || token=="h")
    {
      x=token.length; y=2;
      hh = _getInt(val,i_val,x,y);
      if (hh == null) { return 0; }
      if ((hh < 1) || (hh > 12)) { return 0; }
      i_val += hh.length;
      hh--;
    }
    else if (token=="HH" || token=="H")
    {
      x=token.length; y=2;
      hh = _getInt(val,i_val,x,y);
      if (hh == null) { return 0; }
      if ((hh < 0) || (hh > 23)) { return 0; }
      i_val += hh.length;
    }
    else if (token=="KK" || token=="K")
    {
      x=token.length; y=2;
      hh = _getInt(val,i_val,x,y);
      if (hh == null) { return 0; }
      if ((hh < 0) || (hh > 11)) { return 0; }
      i_val += hh.length;
    }
    else if (token=="kk" || token=="k")
    {
      x=token.length; y=2;
      hh = _getInt(val,i_val,x,y);
      if (hh == null) { return 0; }
      if ((hh < 1) || (hh > 24)) { return 0; }
      i_val += hh.length;
      h--;
    }
    else if (token=="mm" || token=="m")
    {
      x=token.length; y=2;
      mm = _getInt(val,i_val,x,y);
      if (mm == null) { return 0; }
      if ((mm < 0) || (mm > 59)) { return 0; }
      i_val += mm.length;
    }
    else if (token=="ss" || token=="s")
    {
      x=token.length; y=2;
      ss = _getInt(val,i_val,x,y);
      if (ss == null) { return 0; }
      if ((ss < 0) || (ss > 59)) { return 0; }
      i_val += ss.length;
    }
    else if (token=="a")
    {
      if (val.substring(i_val,i_val+2).toLowerCase() == "am") { ampm = "AM"; }
      else if (val.substring(i_val,i_val+2).toLowerCase() == "pm") { ampm = "PM"; }
      else { return 0; }
    }
    else
    {
      if (val.substring(i_val,i_val+token.length) != token) { return 0;	}
      else { i_val += token.length;	}
    }
  }

  // If there are any trailing characters left in the value, it doesn't match
  if (i_val != val.length) { return 0; }

  // Is date valid for month?
  if (month == 2)
  {
    // Check for leap year
    if ( ( (year%4 == 0)&&(year%100 != 0) ) || (year%400 == 0) )
    { // leap year
      if (date > 29){ return false; }
    }
    else
    {
      if (date > 28) { return false; }
    }
  }

  if ((month==4)||(month==6)||(month==9)||(month==11))
  {
    if (date > 30) { return false; }
  }

  // Correct hours value
  if (hh<12 && ampm=="PM") { hh+=12; }
  else if (hh>11 && ampm=="AM") {	hh-=12;	}

  var newdate = new Date(year,month-1,date,hh,mm,ss);
  return newdate.getTime();
}

function isEmail(str)
{
  var pass = 0;

  if (window.RegExp)
  {
    var tempStr = "a";
    var tempReg = new RegExp(tempStr);
    if (tempReg.test(tempStr)) pass = 1;
  }

  if (!pass) return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
  var r1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
  var r2 = new RegExp("^[a-zA-Z0-9\\.\\!\\#\\$\\%\\&\\'\\*\\+\\-\\/\\=\\?\\^\\_\\`\\{\\}\\~]*[a-zA-Z0-9\\!\\#\\$\\%\\&\\'\\*\\+\\-\\/\\=\\?\\^\\_\\`\\{\\}\\~]\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$");
  return (!r1.test(str) && r2.test(str));
}

function getInputValue(obj)
{
  if ((typeof obj.type != "string") && (obj.length > 0) && (obj[0] != null) && (obj[0].type=="radio"))
  {
    for (var i = 0; i < obj.length; i++)
    {
      if (obj[i].checked == true) return obj[i].value;
    }
    return "";
  }

  if ( obj.type == "text"				) 	return obj.value;
  if ( obj.type == "hidden"			) 	return obj.value;
  if ( obj.type == "textarea"		) 	return obj.value;
  if ( obj.type == "checkbox"		) 	return obj.checked ? obj.value : "";
  if ( obj.type == "password"		) 	return obj.value;
  if ( obj.type == "select-one"	)
  {
    if ((obj.selectedIndex == 0) && (obj.options[0].value == "-1")) return "";
    for (var i=0; i<obj.options.length; i++)
    {
      if (obj.options[i].selected) return obj.options[i].value;
    }
    return "";
  }

  if (obj.type == "select-multiple")
  {
    var val = "";
    for (var i=0; i<obj.options.length; i++)
    {
      if (obj.options[i].selected) val = val + "" + obj.options[i].value + ",";
    }
    if (val.length > 0) val = val.substring(0,val.length-1);
    return val;
  }

  return "";
}

function findObj(n, d)
{
  var p, i ,x;

  if (!d) d = document;
  if ((p = n.indexOf("?")) > 0 && parent.frames.length )
  {
    d = parent.frames[n.substring(p+1)].document;
    n = n.substring(0,p);
  }
  if (!(x = d[n]) && d.all) x = d.all[n];
  for (i=0; !x && i < d.forms.length; i++) x = d.forms[i][n];
  for (i=0; !x && d.layers && i < d.layers.length; i++) x = findObj(n, d.layers[i].document);
  return x;
}

function MM_validateForm()
{
  var test, errors = '';
  var args = MM_validateForm.arguments;

  for (var i = 0; i < (args.length-2);  i += 3)
  {
    var obj = findObj(args[i]);

    if ( obj )
    {
      test = args[i+2];
      var val = getInputValue(obj);

      if (val != "")
      {
        if (test.indexOf('isEmail') != -1)
        {
          if (!isEmail(val)) errors += '- ' + args[i+1] + ' debe contener una dirección de correo valida.\n';
        }
        else if (test.indexOf('isDate') != -1)
        {
          var date = getDateFromFormat(val,"dd/MM/yyyy");
          if (date == 0) errors += '- ' + args[i+1] + ' debe contener una fecha valida.\n';
        }
        else if (test != 'R')
        {
          var num = parseFloat(val);
          var val = parseFloat(val);

          if ( val != '' + num) errors += '- ' + args[i+1] + ' debe contener un numero.\n';

          if ( test.indexOf('inRange') != -1)
          {
            var r = test.indexOf('inRange');
            var p = test.indexOf(':');
            var min = test.substring(r+7,p);
            var max = test.substring(p+1);
            if ( num < min || max < num )
              errors += '- ' + args[i+1] + ' debe contener un número entre ' + min + ' y ' + max + '.\n';
          }
        }
      }
      else if (test.charAt(0) == 'R')
        errors += '- ' + args[i+1] + ' es requerido.\n';

    }
  }

  if (errors) alert('Los siguientes campos son requeridos :\n\n' + errors);
  document.MM_returnValue = (errors == '');
}

function validaNumero(field)
{
  var valid = "0123456789"
  var ok = true;
  var temp;
  var punto = false;

  for (var i=0; i<field.value.length; i++)
  {
    temp = "" + field.value.substring(i, i+1);
    if (valid.indexOf(temp) == "-1")
    {
      if (temp == "." && !punto)
        punto = true;
      else
        ok = false;
    }
  }
  return ok;
}

function _isInteger(val) {
  var digits = "1234567890";
  for (var i=0; i < val.length; i++) {
    if (digits.indexOf(val.charAt(i)) == -1) { return false; }
  }

  return true;
}

function _isFloat(val) {
  var digits = "1234567890.,";
  for (var i=0; i < val.length; i++)
  {
    if ( digits.indexOf(val.charAt(i)) == -1 ) { return false; }
  }

  return true;
}

function _getInt(str,i,minlength,maxlength) {
  for (x=maxlength; x>=minlength; x--) {
    var token = str.substring(i,i+x);
    if (token.length < minlength) {
      return null;
    }

    if (_isInteger(token)) {
      return token;
    }
  }

  return null;
}

function Prepend(Q, L, c)
{
  var S = Q+'' // ??
  // if (!c) var c = ' '
  if (c.length>0)
    while (S.length<L)
    {
      S = c+S
    }
  return S
}

function StrU(X, M, N)
{
  // X>=0.0
  var T, S=new String(Math.round(X*Number("1e"+N)))
  // if (S.search && S.search(/\D/)!=-1) { return ''+X } // was search(/e/)
  if (/\D/.test(S))
  {
    return ''+X
  }
  //with (new String(Prepend(S, M+N, '0')))
  return S.substring(0, T=(S.length-N)) + '.' + S.substring(T)
}

function StrT(X, M, N) { return Prepend(StrU(X, 1, N), M+N+2, ' ') }

function StrS(X, M, N) { return Sign(X)+StrU(Math.abs(X), M, N) }

function StrW(X, M, N) { return Prepend(StrS(X, 1, N), M+N+2, ' ') }

// JavaScript Document
