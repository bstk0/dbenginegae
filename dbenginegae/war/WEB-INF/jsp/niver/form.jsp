<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://waffle.codehaus.org" prefix="w" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/layout.css" />" />
<link type="text/css" href="<c:url value="/css/ui-lightness/jquery-ui-1.8.2.custom.css" />" rel="stylesheet" />	
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui-1.8.2.custom.min.js' />"></script>
<script>
function ListaNivers(idmes) {
   alert(idmes);
}

function excluir(uri) {
	var resp=confirm("Deseja EXCLUIR item?");
    if (resp) {
        document.location=uri+"&mes="+document.sel.mes.value;          
    }    
}
</script>
<title>Nivers</title>
</head>
<body>
<DIV id="conteudo">
<h2>Lista de Aniversários</h2>
<form name="sel" action='<c:url value="/niver/form"/>'>
<!-- select name="p_mes" onchange="ListaNivers(p_mes.value);" -->
<TABLE cellSpacing=3 cellPadding=3 width="50%" bgColor=#dfe2e6 border=0 class="ui-widget ui-widget-content">
	<TR class=conteudoInternaOver>
		<td width="35%">Selecione o Mês: ${mesSelected}
		<!--  <div class="my-skinnable-select"> --> 
		<w:selectTokens
			name="mes"
			tokens="0, [Escolha um mês] ,1,Janeiro,2,Fevereiro,3,Março,4,Abril,5,Maio,6,Junho,7,Julho,8,Agosto,9,Setembro,10,Outubro,11,Novembro,12,Dezembro"
			var="meses" onChange="document.sel.submit();">
			${meses}
		</w:selectTokens>
		<!-- </div>  -->
		<script>
			//atualiza valor do combo
			document.sel.mes.value=${mesSelected};
		</script>
		
		<!--
		<select name="mes" onchange="document.sel.submit();">
			<c:forEach var="mes" items="${mesList}">
				<c:if test="${mes.codigoMes == mesSelected}">
					<OPTION VALUE="${mes.codigoMes}" SELECTED>${mes.nomeMes}</OPTION>
				</c:if>
				<c:if test="${mes.codigoMes != mesSelected}">
					<OPTION VALUE="${mes.codigoMes}">${mes.nomeMes}</OPTION>
				</c:if>
			</c:forEach>
		</select>
		-->
		</td>
		<td width="5%" align="center">
			<input type="button" class="ui-state-default ui-corner-all" value="&nbsp;Incluir&nbsp;" onclick="javascript:popupInclusao();" />
		</td>
		<td width="25%">&nbsp;</td>
	</tr>
</TABLE>
<table cellSpacing="3" cellPadding="3" width="50%" border="0" class="ui-widget ui-widget-content">
<!-- 
 <TBODY>
  <TR bgColor="#dfe2e6">
     <td><SPAN class="cabecalho">Id</SPAN></td>
     <td><SPAN class="cabecalho">Nome</SPAN></td>
     <td><SPAN class="cabecalho">E-mail</SPAN></td>
     <td><SPAN class="cabecalho">Data</SPAN></td>
     <td><SPAN class="cabecalho">Telefone</SPAN></td>
     <td><SPAN class="cabecalho">&nbsp;</SPAN></td>
  </TR>
   -->
  <thead>
			<tr class="ui-widget-header ">
     <th>Id</th>
     <th>Nome</th>
     <th>E-mail</th>
     <th>Data</th>
     <th>Telefone</th>
     <th>&nbsp;</th>
  </tr>
  </thead>
 <TBODY>
    <c:set var="counter" value="1" /> 
	<c:forEach var="nivers" items="${niversList}">
		<tr class="row${counter%2}" >
			<c:url var="editUrl" value="/niver/edit">
				<c:param name="id" value="${nivers.id}" />
			</c:url>
			<td>
				<!-- <SPAN class="conteudoInterna">  --> 
				<a href="javascript:popupEdicao('<c:out value="${editUrl}"/>');">${nivers.id}</a>
				<!-- </SPAN>  -->
			</td>
			<td><!-- <SPAN class="conteudoInterna"> -->${nivers.nome}</SPAN></td>
			<td><!-- <SPAN class="conteudoInterna"> -->${nivers.mail}</SPAN></td>
			<td><!-- <SPAN class="conteudoInterna">  -->
			<fmt:formatDate value="${nivers.data}" type="date" pattern="dd/MM/yyyy" /></SPAN></td>
			<td><!-- <SPAN class="conteudoInterna">  -->${nivers.tel}</SPAN></td>
			
			<c:url var="editUrl" value="/niver/exclui">
				<c:param name="id" value="${nivers.id}" />
			</c:url>
			<td align="center"><!-- <SPAN class="conteudoInterna">  -->
			<a href="javascript:excluir('<c:out value="${editUrl}"/>');" class="ui-state-default ui-corner-all">DEL</a>
			<!-- </SPAN>  -->
			</td>
		</tr>
		<c:set var="counter" value="${counter + 1}" />
	</c:forEach>
	</TBODY>
</table>

<script type="text/javascript" language="Javascript">
function voltar() {
    //alert(window.opener.document.sel.name);     
    //alert(window.opener.document.sel.mes.value);
    //alert(document.sel.mes.value);
    var id = document.sel.mes.value;
    var uri = "../niver/form?mes=";
	//window.opener.document.sel.refresh();
	//window.opener.document.sel.location.reload();
	//window.opener.sel.location.reload();
	parent.location= uri + id;
  }	

function popupEdicao(url) {
	//window.open("<c:url value="/niver/edit?id=5" />");
	//window.open(url);
    //$('.ui-dialog #dialog-div').load(url);
    //$("#dialog-div").clear();
    //$("#dialog-div").html("");
    //$("#dialog-div").reset(); 
//    $('#dialog-div').load(url);
//    $('#dialog-div').dialog('open');
    //return false;
		    var botaoclica = {
								"Fechar": function() {
							  		$(this).dialog("close");
							  		voltar(); 
						  	 	}
							 };

    criaJanela(1,null,"Edit",url,300,650,true,botaoclica,null);
}

function popupInclusao() {
	//window.open("<c:url value="/niver/insert" />");
    //$('.ui-dialog #dialog-div').load("<c:url value="/niver/insert" />");
    //$('#dialog-div').dialog('open');
    var url = "<c:url value="/niver/insert" />";
    var botaoclica = {
						"Fechar": function() {
					  		$(this).dialog("close");
					  		voltar(); 
				  	 	}
					 };

    criaJanela(1,null,"Insert",url,320,650,true,botaoclica,null);    
}


function criaJanela(id,icone,titulo,pagina,tamH,tamW,modal,botoes,ajax){  
    var parametros = {  
        icon: icone,  
        icon_draggable: true,  
        dock: "#dock",  
        dock_sortable: true,  
        collapsed: false,  
        title:titulo  
    }  
      
    var div = document.getElementById(id);  
    if (div) {  
        return false;  
    }  
      
    $('body').append('<div id='+id+' title='+titulo+' style="overflow:hidden;"><div id=dvCont'+id+'></div></div>');  
      
    result = $('#'+id).dialog({ closeOnEscape: false,   
                       height: tamH,  
                       width:tamW,  
                       modal:modal,  
                       title:titulo,  
                       maxHeight:screen.availHeight - 170,  
                       maxWidth:screen.width -50,  
                       stack: true,  
                       focus: function() {  
                           },  
                       close: function() {  
                        var div = document.getElementById(id);  
                         if (div) {  
                            div.parentNode.removeChild(div);  
                         }  
                       },  
                       buttons: botoes  
                    });  
      
    if (ajax == true){   
        $('#dvCont'+id).load(pagina);     
        //$('#'+id).iconize(parametros);  
    }else  
    {  
        $('#dvCont'+id).append('<iframe src='+pagina+' allowtransparency="yes" frameborder="0"  style="width:100%;height:100%;"></iframe>');  
        $('iframe').height(screen.height);  
        }  
                  
      
    if (modal != true){   
        $('#'+id).iconize(parametros);  
    }  
      
    $('.iconizer').hover(  
        function() { $(this).addClass('ui-state-hover'); },   
        function() { $(this).removeClass('ui-state-hover'); }  
    );  
      
    return result;  
}  
</script>
|<a href="<c:url value='/index/index'/>">Voltar</a>
</form>
</DIV>
</body>
</html>