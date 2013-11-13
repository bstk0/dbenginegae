<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AcaoSaldo - List</title>
</head>
<body>

<ul>
<c:forEach items="${acaoSaldoList}" var="acaosaldo">
    <ol> ${acaosaldo.id} - SALDO: ${acaosaldo.saldo} / Tipo Movimentacao: ${acaosaldo.tipoMovimentacao}
    	<li> ${acaosaldo.acaoObj.sigla }: ${acaosaldo.acaoObj.nome } || ${acaosaldo.saldo } </li> 
    </ol>	
</c:forEach>
</ul>
<br> TOTAL : ${total}
<a href="<c:url value='/acao/incluir'/>">Acao.incluir</a>&nbsp;|&nbsp;
<a href="<c:url value='/index/index'/>">Voltar</a>
</body>
</html>