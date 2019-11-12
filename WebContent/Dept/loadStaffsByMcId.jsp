<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%
int mcId = Integer.parseInt(request.getParameter("mcId"));
Helper helper = new Helper();
ArrayList<Integer> arr = helper.getStaffNamesByMcId(mcId);
for(int rowValues:arr) {
%>
<option value="<%=rowValues %>"><%=helper.getNameById(rowValues) %></option>
<%
}
%>