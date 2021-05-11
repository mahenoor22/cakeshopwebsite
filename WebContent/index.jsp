<%@page import="com.cakeshop.Customer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%--
/**
 * Task	: index page  - forward page
 *
 *
 */ 
 --%>

<%
	//Session check
	HttpSession session2 = request.getSession();

	synchronized (session2) {

		String userType = (String) session2.getAttribute("userType");

		if (session.getAttribute("customer") == null && session.getAttribute("csr") == null) {
%>

<jsp:forward page="Login.jsp" />
<%
	} else {

			//System.out.print(userType);

			if (userType.equals("csr")) {
%>
<jsp:forward page="LoginCSRRst.jsp" />
<%
	} else if (userType.equals("customer")) {
%>
<jsp:forward page="LoginRst.jsp" />
<%
	}

		}

	}
%>


