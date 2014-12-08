<%@ include file="common/header.jsp" %>

<body>

<div class="container">

	<h1>
		Spring Template
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	<spring:url value="/insert" var="insertUrl"></spring:url>
	<form:form modelAttribute="person" action="${insertUrl}" method="POST"  class="form-horizontal">
	
	<fieldset>
	<legend>Person</legend>
		<div class="form-group" >
			<label class="col-sm-2 control-label" >Id</label>
			<div class="col-md-2">
				<form:input path="id" class="form-control disabled"/>
			</div>
		</div>
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
				<fmt:formatDate value="${person.startDate}" var="dateString" pattern="dd/MM/yyyy" />
				<form:input path="startDate" data-provide='datepicker' value="${dateString}" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-6">
				<button class="btn btn-primary pull-right" >Insert</button>
			</div>
		</div>
	</fieldset>
	
	</form:form>
	
	<table id="datatable" class="table table-striped table-bordered">
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
		<c:forEach var="p" items="${listPerson}">
			<tr>
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td>${p.email}</td>
				<td>${p.cost}</td>
				<td>${p.startDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>

<spring:url var="loadUrl" value="/load" />

<script type="text/javascript">

$(document).ready(function() {
	
	$.validator.setDefaults({
		errorElement: "span",
	    errorClass: "has-error help-block",
	    highlight: function (element, errorClass, validClass) {
	        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	    },
	    unhighlight: function (element, errorClass, validClass) {
	    	$(element).closest('.form-group').removeClass('has-error');
	    },
	    errorPlacement: function (error, element) {
 	       error.insertAfter(element.parent());
	    }
	});
	
	$(".disabled").prop("disabled",true);
	
	$("#datatable").DataTable({
		"lengthChange": false,
		"searching" : false,
		"stateSave" : true,
		"language": {
	        "search": "Ricerca: ",
	        "info": " _PAGE_ / _PAGES_",
	        "paginate": {
	            "first":      "Primo",
	            "previous":   "<<",
	            "next":       ">>",
	            "last":       "Ultimo"
	        }
	    },
	    "drawCallback": function( settings ) {
	    	$('#datatable tbody tr').on('click', function(event) {
			    $(this).toggleClass('active').siblings().removeClass('active');
				var url ="${loadUrl}";
				var id = $('#datatable tbody tr.active').children('td:eq(0)').text(); 
			    var form = $("<form>").attr("action",url+"/"+id);
			    form.appendTo(document.body).submit();
			});
	    }
	});
	
	$("input[data-provide='datepicker']").datepicker({
	    format: 'dd/mm/yyyy',
	    language: "it"
	});
});

</script>

</body>
</html>
