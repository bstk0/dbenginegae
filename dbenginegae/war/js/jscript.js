/* Exemplo: <input type="text" onkeypress="javascript:mascara(this,Telefone);" maxlength=16> */
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}

function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}

/*Função que padroniza telefone 55(11) 4184-1241*/
function Telefone(v) {
   
    v = v.replace(/\D/g, "")
    v = v.replace(/(\d{2})(\d)/, "$1($2")
    v = v.replace(/(\d{2})(\d)/, "$1)$2")
    v = v.replace(/(\d{4})(\d{4})/, " $1-$2")
    
    return v
}

/*Função que padroniza DATA*/
function Data(v) {
    v = v.replace(/\D/g, "")
    v = v.replace(/(\d{2})(\d)/, "$1/$2")
    v = v.replace(/(\d{2})(\d)/, "$1/$2")
    return v
}

/*Função que padroniza DATA - 2010-04-23*/
function dataMySQL(v) {
    v = v.replace(/^(\d{4})(\d)/, "$1-$2")
    v = v.replace(/^(\d{4})\-(\d{2})(\d)/, "$1-$2-$3")
    v = v.replace(/\.(\d{2})(\d)/, ".$1-$2")
    return v
}

function data(v){
	v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
	v=v.replace(/(\d{2})(\d)/,"$1-$2") //Coloca um ponto entre o segundo e o terceiro dígitos
	v=v.replace(/(\d{2})(\d)/,"$1-$2") //Coloca um ponto entre o quarto e o quinto dígitos
	//v=v.replace(/^[0-3]?\d\/[01]?\d\/(\d{2}|\d{4})$/)
	v=v.replace(/^((0[1-9]|[12]\d)\-(0[1-9]|1[0-2])|30\-(0[13-9]|1[0-2])|31\-(0[13578]|1[02]))\-\d{4}$/)
	//v=v.replace(/^(0[1-9]|[012][0-9]|3[01])/\-(0[1-9]|1[012])/\-([12][0-9]{3})/,"")
	return v
}

/*Função que padroniza CNPJ*/
function Cnpj(v) {
    v = v.replace(/\D/g, "")
    v = v.replace(/^(\d{2})(\d)/, "$1.$2")
    v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
    v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")
    v = v.replace(/(\d{4})(\d)/, "$1-$2")
    return v
}
