<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style type="text/css">
table, th, td {
   border: 1px solid black;
}
</style>
<body>


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<table border="1" >
<c:forEach var="person" items="${listPerson}">
	<tr>
		<td>${person.id}</td><td>${person.name}</td><td>${person.email}</td>
	</tr>
</c:forEach>
</table>

</body>
</html>
