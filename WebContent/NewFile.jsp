<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@page import="eCore.model.DonVi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		DonVi dv = new DonVi();
		dv.setMaDonVi("DV01");
		dv.setTenDonVi("Bo mon CNTT");
		dv.setDonViCha(null);
		ObjectDAO dao1 = new DAO_DonVi();
		dao1.saveOrUpdate(dv);
	%>
</body>
</html>