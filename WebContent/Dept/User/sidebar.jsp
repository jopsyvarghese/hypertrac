<%@page import="com.hypertrac.commons.Helper"%>
<% Helper helper = new Helper(); %>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<li><a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.jsp">
		<span class="sidebar-brand-icon rotate-n-15">
			<small> <i class="fas fa-walking"></i>
			</small>
		</span> <%
            	int userType = Integer.parseInt(session.getAttribute("loggedInUserRole").toString());            	           	
            	if(userType == 0) { %>
		<span class="sidebar-brand-text mx-3">
			Contra<sup>ctor</sup>
		</span> <%} else { %>
		<span class="sidebar-brand-text mx-3">
			Us<sup>er</sup>
		</span> <%}
            %>

	</a></li>

	<!-- Divider -->
	<li><hr class="sidebar-divider my-0"></li>

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="index.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="../readMore.jsp?q=<%=helper.encrypt("4")%>"> <i
			class="fas fa-truck-loading"></i> <span>Chat Inbox</span>
	</a></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="appStatus.jsp">
			<i class="fas fa-truck-loading"></i> <span>Application Status</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="newService.jsp">
			<i class="fas fa-newspaper"></i> <span>Apply for New Service</span>
	</a></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="history.jsp"> <i
			class="fas fa-fw fa-user"></i> <span>View History</span>
	</a></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="userChat.jsp">
			<i class="fas fa-fw fa-history"></i> <span>Chat With Dept. Staff</span>
	</a></li>

	<!-- Divider -->
	<li><hr class="sidebar-divider d-none d-md-block"></li>

	<!-- Sidebar Toggler (Sidebar) -->
	<li class="text-center"><div class="d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div></li>
</ul>