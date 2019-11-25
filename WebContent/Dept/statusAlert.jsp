<%
	String statusAlert = "";
	if (request.getParameter("status") != null) {
		statusAlert = request.getParameter("status");
		if (statusAlert.equals("success")) {
%>
<div class="alert alert-success alert-dismissible fade show alert-sm">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Success!</strong> Processed Successfully.
</div>
<%
	} else if (statusAlert.equals("failed")) {
%>
<div class="alert alert-danger alert-dismissible fade show alert-sm">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Failed!</strong> Unable to Process.
</div>
<%
	}
	}
%>