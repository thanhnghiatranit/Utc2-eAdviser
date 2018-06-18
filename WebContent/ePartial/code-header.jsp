<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Lay ra thong bao
	String msg = request.getSession().getAttribute("msg") + "";
	msg = msg.equals("null") ? "" : msg;

	// Lay ra ten trang hien tai
	String pageName = getServletConfig().getServletContext().getRealPath(request.getServletPath());
	String host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/index.jsp";

	if (!pageName.endsWith("index.jsp")) {
		// Ngăn cản truy cập trực tiếp trang này. Khi truy cập trực tiếp sẽ được trả về trang chủ.
		response.sendRedirect(host);
	}

	// Kiểm tra va lay trang con bên trong
	String p1 = request.getParameter("p") + "";
	if (p1.equals("null")) {
		p1 = session.getAttribute("p") + "";
	} else {
		session.setAttribute("p", p1);
	}

	p1 = "index.jsp?p=" + p1;

	// Kiểm tra có quyền truy cập chức năng này

	// Phân trang	
	String pid = request.getParameter("page");
	pid = (pid == null || pid.equals("null")) ? "0" : pid;

	String s_recordPerPage = request.getParameter("recordPerPage");
	s_recordPerPage = (s_recordPerPage == null || s_recordPerPage.equals("null")) ? "10" : s_recordPerPage;
	long recordPerPage = Long.parseLong(s_recordPerPage);
%>


<script type="text/javascript">
	function confirmDelete(a) {
		if (confirm("Bạn có chắc chắn xóa: " + a.target + " ?")) {
			window.location.href = "delete" + a.id + ".action?maobj=" + a.title;
		}
	}
</script>