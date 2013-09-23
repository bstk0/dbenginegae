<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acao-Incluir</title>
</head>
<body>
<form action="<c:url value='/acao/adicionar'/>">
    Sigla:     <input type="text" name="acao.sigla" /><br/>
    Nome:      <input type="text" name="acao.nome" /><br/>
    Descrição: <input type="text" name="acao.descricao" /><br/>
    <input type="submit" value="Salvar" />
<a href="<c:url value='/acao/lista'/>">Acao.lista</a>&nbsp;|&nbsp;
<a href="<c:url value='/index/index'/>">Voltar</a>    
</form>
</body>
</html>