<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/layout.css" />" />
<link type="text/css" href="<c:url value="/css/ui-lightness/jquery-ui-1.8.2.custom.css" />" rel="stylesheet" />	
<script type="text/javascript" src="<c:url value="/js/jquery-1.4.2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.2.custom.min.js" />"></script>
<script>
function fechar() {
	//$(this).dialog('close');
	//allFields.val('').removeClass('ui-state-error');
	 $('#dialog-div').dialog('close'); 
}
</script>
<title>Alterar Aniversário</title>
</head>
<body>
<DIV id="conteudo">
<h2>edit</h2>
<form name="edit" action='<c:url value="/niver/atualiza"/>'>
<input type="hidden" name="niver.id" value="${niver.id}">
<input type="text" name="niver.nome" value="${niver.nome}" size="45"><br>
<input type="text" name="niver.mail" value="${niver.mail}" size="45"><br>
<!-- 
<input type="text" name="niver.data" value="${nivers.data}" onkeypress="javascript:mascara(this,dataMySQL);" maxlength=10 />(yyyy-mm-dd)<br/>
<input type="text" name="niver.strData" value="${niver.data}" onkeypress="javascript:mascara(this,dataMySQL);" maxlength=10 />(yyyy-mm-dd)<br/>
-->
<input type="text" name="niver.strData" value="${niver.strData}" onkeypress="javascript:mascara(this,dataMySQL);" maxlength=10 />(yyyy-mm-dd)<br/>
<input type="text" name="niver.tel" value="${niver.tel}"><br>
<br>
<input type="submit" class="ui-state-default ui-corner-all" name="Salvar" value="&nbsp;Salvar&nbsp;">
 <!-- 
<input type="button" class="ui-state-default ui-corner-all" name="Fechar" value="&nbsp;Fechar&nbsp;" onclick="javascript:fechar();">
 -->
</form>
</DIV>
</body>
</html>