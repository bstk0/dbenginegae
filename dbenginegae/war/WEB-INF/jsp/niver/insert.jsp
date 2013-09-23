<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css" href="<c:url value="/css/layout.css" />" />  -->
<link type="text/css" href="<c:url value="/css/ui-lightness/jquery-ui-1.8.2.custom.css" />" rel="stylesheet" />	
<script type="text/javascript" src="<c:url value="/js/jquery-1.4.2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.2.custom.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jscript.js" />" ></script>
<title>Insert title here</title>
</head>
<body>
<DIV id="conteudo">
<h2>insert</h2>
<form action="<c:url value="/niver/add"/>">
    Nome:             <input type="text" name="niver.nome" /><br/>
    Data:             <input type="text" name="niver.strData" onkeypress="javascript:mascara(this,dataMySQL);" maxlength=10 />(yyyy-mm-dd)<br/>
    E-mail:           <input type="text" name="niver.mail" /><br/>
    Telefone:         <input type="text" name="niver.tel" /><br/><br/>
    <input type="submit" class="ui-state-default ui-corner-all" value="Salvar" />
    <!-- 
    <input type="button" class="ui-state-default ui-corner-all" name="Fechar" value="&nbsp;Fechar&nbsp;" onclick="javascript:window.close();">
     -->
</form>
</DIV>
</body>
</html>