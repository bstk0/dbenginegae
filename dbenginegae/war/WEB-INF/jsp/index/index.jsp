<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>

  <body>
[121113.1]=> <%= request.getRequestURI() %><br>
<%
	String uri = request.getRequestURI(); //"/index/index";
	UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
        
%>
It works!! ${variable}

<p>Hello, ${fn:escapeXml(user.nickname)}! (You can
<a href="<%= userService.createLogoutURL("/index/index") %>">sign out</a>.)</p>
<table>
	<tr>
		<td><a href="<c:url value='/niver/form'/>">Niver.form</a>&nbsp;|&nbsp;
		<a href="<c:url value='/carro/lista'/>">Carro.lista</a>&nbsp;|&nbsp;
		<a href="<c:url value='/acao/incluir'/>">Acao.incluir</a>&nbsp;|&nbsp;
		<a href="<c:url value='/acaosaldo/incluir'/>">AcaoSaldo.incluir</a>&nbsp;|&nbsp;
		<a href="/angular1.html">Angular1</a>&nbsp;|&nbsp;
		<a href="/angularContactManager/index.html">Angular Contact Manager</a>&nbsp;|&nbsp;
		<a href="<c:url value='/index/log'/>">index.log</a>
		</td>
	</tr>
	<tr>
		<td><a href="<c:url value='/angularjs/index'/>">Angular (JM 121)</a>
		</td>
	</tr>
</table>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL("/index/index") %>">Sign in</a>
to include your name with greetings you post.</p>
<%
    }
%>
<table>
	<tr>
		<td>	
		<img src="http://code.google.com/appengine/images/appengine-noborder-120x30.gif" alt="Powered by Google App Engine" style="padding-top:20px">
		</td> 
	</tr>
</table>
  </body>
</html>