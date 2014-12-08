<%@ include file="common/header.jsp" %>

<body>

<div class="container">

	<h1>
		Hello Spring Template!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	<spring:url value="/insert" var="insertUrl"></spring:url>
	<form:form modelAttribute="person" action="${insertUrl}" method="POST"  class="form-horizontal">
	
	<fieldset>
	<legend>Person</legend>
		<div class="form-group">
			<label class="col-sm-2 control-label" >Name</label>
			<div class="col-md-4">
				<form:input path="name" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Email</label>
			<div class="col-md-4">
				<form:input path="email" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Cost</label>
			<div class="col-md-2">
				<form:input path="cost" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Start Date</label>
			<div class="col-md-2">
				<form:input path="startDate" data-provide='datepicker' class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-6">
				<button class="btn btn-primary pull-right" >Insert</button>
			</div>
		</div>
	</fieldset>
	
	</form:form>
	
	<table id="table" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Cost</th>
			<th>Start date</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="person" items="${listPerson}">
		<tr>
			<td>${person.id}</td>
			<td>${person.name}</td>
			<td>${person.email}</td>
			<td>${person.cost}</td>
			<td>${person.startDate}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>

</div>

<script type="text/javascript">

$(document).ready(function() {
	$("#table").DataTable({
		"lengthChange": false,
		"searching" : false
	});
	
	$("input[data-provide='datepicker']").datepicker({
	    format: 'dd/mm/yyyy',
	    language: "it"
	});
});

</script>

</body>
</html>
