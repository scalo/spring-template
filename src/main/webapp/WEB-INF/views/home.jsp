<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home Spring Template</title>
</head>
<style type="text/css">
table, th, td {
   border: 1px solid black;
}
</style>
<body>


<h1>
	Hello Spring Template!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<spring:url value="/insert" var="insertUrl"></spring:url>
<form:form modelAttribute="person" action="${insertUrl}" method="POST">

<fieldset>
<legend>Person</legend>
	<form:label path="name">Name:<form:input path="name" value="" /></form:label>
	<form:label path="email">Email<form:input path="email" value=""/></form:label>
	<form:button>Insert</form:button>
</fieldset>

</form:form>


<table border="1" >
<c:forEach var="person" items="${listPerson}">
	<tr>
		<td>${person.id}</td><td>${person.name}</td><td>${person.email}</td>
	</tr>
</c:forEach>
</table>

</body>
</html>
