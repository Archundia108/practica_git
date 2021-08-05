/*
	FUNCIONES GENERICAS
*/

function validarSiNumero(object)
/************************************************************************************
	DESCRIPCION: Esta función es para validar solo números.
				 En la validación estamos indicando que sea diferente a la expresión regular definida. 
				 De ahí el simbolo exclamación (!). Que lo que hace es negar lo puesto después.	
	CREADO POR: Nancy Alegría López
	FECHA: 13/05/2015
************************************************************************************/
{
	var numero = object.value;
	if (!/^([0-9])*$/.test(numero))
	{
		object.value = numero.substring(0,numero.length-1);
	}
}

function validarFecha(object)
/************************************************************************************
	DESCRIPCION: Esta función es para validar que la fecha se ponga con este formato:
				 (Por ejemplo 01/01/2007)
	CREADO POR: Nancy Alegría López
	FECHA: 13/05/2015
************************************************************************************/
{
	
	var fecha = object.value;
	var expreReg = /^\d{1,2}\/\d{1,2}\/\d{4}$/;

	if (!expreReg.test(fecha)) 
	{
		alert("EL FORMATO DE LA FECHA ES INCORRECTO. VERIFIQUE POR FAVOR.");		
		object.value = "";
		object.focus();		
	}			
}

