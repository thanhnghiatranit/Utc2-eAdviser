
fs.action/LoginServler
------------------------
package fs.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fs.common.Constants;
import fs.dao.MSTUSER_DAO;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher myRD = null;
		// Hien thi man hinh Login
		//dispatcher: khong co dinh duong dan
		myRD = request.getRequestDispatcher(Constants.T001_LOGIN);

		myRD.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if (action.equals("login")) {
			// tao session
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			String username = request.getParameter("txtUserID");
			String password = request.getParameter("txtPassword");
			// xac thuc id va pass
			if (MSTUSER_DAO.validate(username, password)) {
				session.setAttribute("txtUserID", username);
//				RequestDispatcher rd = request.getRequestDispatcher("/jsp/T002.jsp");
//				rd.forward(request, response);
				response.sendRedirect("jsp/T002.jsp");
			} else {
//				RequestDispatcher rd = request.getRequestDispatcher("/jsp/T001.jsp");
//				rd.forward(request, response);
				response.sendRedirect("jsp/T001.jsp");
			}
			out.close();
		}
		if (action.equals("logout")) {
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
//			request.getRequestDispatcher(Constants.T001_LOGIN).include(request, response);
			response.sendRedirect("jsp/T001.jsp");
			session.invalidate();
			out.close();
		}
	}

}
------------------------------
fs.action/CustomerAction
-----
package fs.action;

import java.io.IOException;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fs.dao.MSTCUSTOMER;
import fs.dao.MSTCUSTOMER_DAO;

/**
 * Servlet implementation class CustomerAction
 */
@WebServlet("/CustomerAction")
public class CustomerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MSTCUSTOMER_DAO dao = new MSTCUSTOMER_DAO();
		String action = request.getParameter("action");
		switch (action) {
		case "delete":
			//// tra ve  id da chon o checkbox 22022,22023
			String strList = request.getParameter("listDelete"); 
			//tra ve mang id
			String[]listId = strList.split(","); // [22022,22023]
			for (String id : listId) {
				dao.DeleteByID(id);
			}
			response.sendRedirect("jsp/T002.jsp");
			break;
		case "create":
			MSTCUSTOMER mstcustomer = new MSTCUSTOMER();
			String s_customerName = request.getParameter("CUSTOMER_NAME");
			String sex = request.getParameter("SEX");
			String address = request.getParameter("ADDRESS");
//			int birthday_day = 
//			Date birthday = new Date();
//			String email = request.getParameter("EMAIL");
//			Date UPDATE_YMD = new Date(request.getParameter("UPDATE_YMD"));
//			Date INSERT_YMD = new Date(request.getParameter("INSERT_YMD"));
//			Date DELETE_YMD = new Date(request.getParameter("DELETE_YMD"));
			mstcustomer.setS_customerName(s_customerName);
			mstcustomer.setS_sex(sex);
			mstcustomer.setS_address(address);
//			mstcustomer.setS_birthday(birthday);
			System.out.println(mstcustomer.toString());
			if(dao.CreateNew(mstcustomer)) {
				System.out.println("OKkkkkkkkkkk");
			}
			response.sendRedirect("jsp/T002.jsp");
			System.out.println("Zo");
			break;
		case "update":

			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
--------------------------
fs.common
package fs.common;

public class Constants {
	// T001(Login)
	public static final String T001_LOGIN = "/jsp/T001.jsp";
	// T002(Search)
	public static final String T002_SEARCH = "/jsp/T002.jsp";
	// T002(Edit)
	public static final String T003_EDIT = "/jsp/T003.jsp";
}
-----------------------
JDBC Connection
---------------
package fs.common;

import java.sql.Connection;
import java.sql.DriverManager;


public class JDBC_Connection {

		private static String dbURL = "jdbc:sqlserver://localhost:1433;" + "databaseName=CustomerSystem";
	    private static String userName = "sa";
	    private static String password = "12345";
	 

	    public static Connection getConnection() {
	        Connection conn = null;
	        try {
	        	//khai bao class Driver
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            conn = DriverManager.getConnection(dbURL, userName, password);
	            
	            System.out.println("OKKKKK");
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            System.out.println("Loiiiiiiiiiii");
	        }
	        return conn;
	    }
	    
	    public static void main(String[] args) {
			System.out.println(getConnection());
		}
}
----------------------------------
MSTCUSTOMERDAO
package fs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fs.common.JDBC_Connection;

public class MSTCUSTOMER_DAO {

	public ArrayList<MSTCUSTOMER> getListCustomer() {
		Connection conn = JDBC_Connection.getConnection();
		String sql = "SELECT * FROM MSTCUSTOMER";
		ArrayList list = new ArrayList();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MSTCUSTOMER mstcustomer = new MSTCUSTOMER() {
				};
				mstcustomer.setS_customerID(rs.getString("CUSTOMER_ID"));
				mstcustomer.setS_customerName(rs.getString("CUSTOMER_NAME"));
				mstcustomer.setS_sex(rs.getString("SEX"));
				mstcustomer.setS_birthday(rs.getDate("BIRTHDAY"));
				mstcustomer.setS_address(rs.getString("ADDRESS"));
				list.add(mstcustomer);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<MSTCUSTOMER> getListCustomerByID(String id) {
		Connection conn = JDBC_Connection.getConnection();
		String sql = "SELECT * FROM MSTCUSTOMER WHERE CUSTOMER_ID = ?";
		ArrayList list = new ArrayList();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			//
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MSTCUSTOMER mstcustomer = new MSTCUSTOMER() {
				};
				mstcustomer.setS_customerID(rs.getString("CUSTOMER_ID"));
				mstcustomer.setS_customerName(rs.getString("CUSTOMER_NAME"));
				mstcustomer.setS_sex(rs.getString("SEX"));
				mstcustomer.setS_birthday(rs.getDate("BIRTHDAY"));
				mstcustomer.setS_address(rs.getString("ADDRESS"));
				mstcustomer.setS_email(rs.getString("EMAIL"));
				mstcustomer.setD_deleteYMD(rs.getDate("DELETE_YMD"));
				mstcustomer.setD_insertYMD(rs.getDate("INSERT_YMD"));
				mstcustomer.setD_updateYMD(rs.getDate("UPDATE_YMD"));
				list.add(mstcustomer);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean DeleteByID(String id) {
		try {
			Connection conn = JDBC_Connection.getConnection();
			String sql = "DELETE FROM MSTCUSTOMER WHERE CUSTOMER_ID = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, id);
			if (ps.executeUpdate() != 0)
				return true;
			else
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public boolean CreateNew(MSTCUSTOMER cus) {
		try {
			Connection conn = JDBC_Connection.getConnection();
			//String sql = "INSERT INTO MSTCUSTOMER(CUSTOMER_NAME, SEX, ADDRESS, BIRTHDAY, EMAIL, UPDATE_YMD, INSERT_YMD, DELETE_YMD) VALUES(?,?,?,?,?,?,?,?)";
			String sql = "INSERT INTO MSTCUSTOMER(CUSTOMER_NAME, SEX, ADDRESS) VALUES(?,?,?)";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setString(1, cus.getS_customerName());
			ps.setString(2, cus.getS_sex());
			ps.setString(3, cus.getS_address());
			/*ps.setDate(4, cus.getS_birthday());
			ps.setString(5, cus.getS_email());
			ps.setDate(6, cus.getD_updateYMD());
			ps.setDate(7, cus.getD_insertYMD());
			ps.setDate(8, cus.getD_deleteYMD());*/
			
			if (ps.executeUpdate() != 0)
				return true;
			else
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//phan trang
	//Pages number 1->4 or 5->8 ..
	public ArrayList<MSTCUSTOMER> GetCustomerPT(int start, int sl) {
		Connection conn = JDBC_Connection.getConnection();
	    ArrayList<MSTCUSTOMER> list = new ArrayList();
	    String sql = "SELECT * FROM MSTCUSTOMER ORDER BY CUSTOMER_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    try {
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, start);
	        ps.setInt(2, sl);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
				MSTCUSTOMER mstcustomer = new MSTCUSTOMER() {
				};
				mstcustomer.setS_customerID(rs.getString("CUSTOMER_ID"));
				mstcustomer.setS_customerName(rs.getString("CUSTOMER_NAME"));
				mstcustomer.setS_sex(rs.getString("SEX"));
				mstcustomer.setS_birthday(rs.getDate("BIRTHDAY"));
				mstcustomer.setS_address(rs.getString("ADDRESS"));
				list.add(mstcustomer);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	    
		
	}
	
	
	public int getCount() {
		Connection conn = JDBC_Connection.getConnection();
	    ArrayList<MSTCUSTOMER> list = new ArrayList();
	    String sql = "SELECT count(CUSTOMER_ID) FROM MSTCUSTOMER";
	    int count = 0;
	    try {
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	
	//test

	public static void main(String[] args) {
		MSTCUSTOMER_DAO dao = new MSTCUSTOMER_DAO();

		// if (dao.DeleteByID("1"))
		// System.out.println("ok");
		// else
		// System.out.println("not ok");

		/*MSTCUSTOMER cus = new MSTCUSTOMER();
		// CUSTOMER_NAME, SEX, ADDRESS, BIRHDAY, EMAIL, UPDATEYMD, INSERTYMD, DELETEYMD
		cus.setS_customerName("bi");
		cus.setS_sex("male");
		cus.setS_address("quan9");
		cus.setS_birthday(new Date(2008, 11, 11));
		cus.setS_email("mail");
		cus.setD_updateYMD(new Date(2008, 11, 11));
		cus.setD_insertYMD(new Date(2008, 11, 11));
		cus.setD_deleteYMD(new Date(2008, 11, 11));

		if (dao.CreateNew(cus))
			System.out.println("ok");
		else
			System.out.println("not ok");*/
		
		/*for (MSTCUSTOMER cus : dao.GetCustomerPT(1, 2)) {
			System.out.println(cus.toString());
		}*/
		
	}
	
}

------------------------------------
MSTUSERDAO
package fs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fs.common.JDBC_Connection;

public class MSTUSER_DAO {

	public static boolean validate(String userName, String password) {
		Connection conn = JDBC_Connection.getConnection();
		String sql = "SELECT * FROM MSTUSER WHERE USER_ID = ? AND PASSWORD =?";
		int totalRecord = 0;
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				totalRecord++;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalRecord > 0 ? true : false;
	}
}
-----------------
MSTUSER 
package fs.dao;

import java.util.Date;

public class MSTUSER implements Comparable<MSTUSER>{

	String s_psn_id;
	public String getS_psn_id() {
		return s_psn_id;
	}

	public void setS_psn_id(String s_psn_id) {
		this.s_psn_id = s_psn_id;
	}

	String s_userid;
	String s_username;
	Date d_updateYMD;
	Date d_insertYMD;
	Date d_deleteYMD;
	
	

	public MSTUSER() {
	}

	public MSTUSER(String s_psn_id, String s_userid, String s_username, Date d_updateYMD, Date d_insertYMD,
			Date d_deleteYMD) {
		this.s_psn_id = s_psn_id;
		this.s_userid = s_userid;
		this.s_username = s_username;
		this.d_updateYMD = d_updateYMD;
		this.d_insertYMD = d_insertYMD;
		this.d_deleteYMD = d_deleteYMD;
	}

	public String getS_userid() {
		return s_userid;
	}

	public void setS_userid(String s_userid) {
		this.s_userid = s_userid;
	}

	public String getS_username() {
		return s_username;
	}

	public void setS_username(String s_username) {
		this.s_username = s_username;
	}

	public Date getS_updateYMD() {
		return d_updateYMD;
	}

	public void setS_updateYMD(Date s_updateYMD) {
		this.d_updateYMD = s_updateYMD;
	}

	public Date getS_insertYMD() {
		return d_insertYMD;
	}

	public void setS_insertYMD(Date s_insertYMD) {
		this.d_insertYMD = s_insertYMD;
	}

	public Date getS_deleteYMD() {
		return d_deleteYMD;
	}

	public void setS_deleteYMD(Date s_deleteYMD) {
		this.d_deleteYMD = s_deleteYMD;
	}




	@Override
	public String toString() {
		return "MSTUSER [s_psn_id=" + s_psn_id + ", s_userid=" + s_userid + ", s_username=" + s_username
				+ ", d_updateYMD=" + d_updateYMD + ", d_insertYMD=" + d_insertYMD + ", d_deleteYMD=" + d_deleteYMD
				+ "]";
	}

	@Override
	public int compareTo(MSTUSER o) {
		return this.s_userid.compareTo(o.s_userid);
	}
	
	
}
----------------MSTCUSTOMER
package fs.dao;

import java.sql.Date;

public class MSTCUSTOMER implements Comparable<MSTCUSTOMER> {

	String s_customerID;
	String s_customerName;
	String s_sex;
	Date s_birthday;
	String s_address;
	String s_email;
	Date d_updateYMD;
	Date d_insertYMD;
	Date d_deleteYMD;
	
	public MSTCUSTOMER() {
	}


	public MSTCUSTOMER(String s_customerID, String s_customerName, String s_sex, Date s_birthday, String s_address,
			String s_email, Date d_updateYMD, Date d_insertYMD, Date d_deleteYMD) {
		this.s_customerID = s_customerID;
		this.s_customerName = s_customerName;
		this.s_sex = s_sex;
		this.s_birthday = s_birthday;
		this.s_address = s_address;
		this.s_email = s_email;
		this.d_updateYMD = d_updateYMD;
		this.d_insertYMD = d_insertYMD;
		this.d_deleteYMD = d_deleteYMD;
	}


	public String getS_customerID() {
		return s_customerID;
	}

	public void setS_customerID(String s_customerID) {
		this.s_customerID = s_customerID;
	}

	public String getS_customerName() {
		return s_customerName;
	}

	public void setS_customerName(String s_customerName) {
		this.s_customerName = s_customerName;
	}

	public String getS_sex() {
		return s_sex;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public Date getS_birthday() {
		return s_birthday;
	}

	public void setS_birthday(Date s_birthday) {
		this.s_birthday = s_birthday;
	}

	public String getS_address() {
		return s_address;
	}

	public void setS_address(String s_address) {
		this.s_address = s_address;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public Date getD_updateYMD() {
		return d_updateYMD;
	}

	public void setD_updateYMD(Date d_updateYMD) {
		this.d_updateYMD = d_updateYMD;
	}

	public Date getD_insertYMD() {
		return d_insertYMD;
	}

	public void setD_insertYMD(Date d_insertYMD) {
		this.d_insertYMD = d_insertYMD;
	}

	public Date getD_deleteYMD() {
		return d_deleteYMD;
	}

	public void setD_deleteYMD(Date d_deleteYMD) {
		this.d_deleteYMD = d_deleteYMD;
	}

	@Override
	public String toString() {
		return "MSTCUSTOMER [s_customerID=" + s_customerID + ", s_customerName=" + s_customerName + ", s_sex=" + s_sex
				+ ", s_birthday=" + s_birthday + ", s_address=" + s_address + ", s_email=" + s_email + ", d_updateYMD="
				+ d_updateYMD + ", d_insertYMD=" + d_insertYMD + ", d_deleteYMD=" + d_deleteYMD + "]";
	}

	@Override
	public int compareTo(MSTCUSTOMER o) {
		return this.s_customerID.compareTo(o.s_customerID);
	}


	
	
}
-------------------------------
Giao dien
js/error.js
//xử lý login
function myFunction() {
	var x = document.getElementById("txtUserID").value;
	var y = document.getElementById("txtPassword").value;

	if (x == "") {
		document.getElementById("lblError").innerHTML = "Error Message1";
		return false;
	} else if (y == "") {
		document.getElementById("lblError").innerHTML = "Error Message2";
		return false;
	}
	return true;
}

//xử lý clear
function myFunction1() {
	document.getElementById("lblError").innerHTML = "";
	var x = document.getElementById("txtUserID").value = "";
	var y = document.getElementById("txtPassword").value = "";

}
//xử lý check all
function toggle(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source)
            checkboxes[i].checked = source.checked;
    }
}
--------------------------------
js/T001.jsp
<!-- <script type="text/javascript" src="../js/error.js"></script> -->
<!-- <body> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="container"> -->
<!-- 			<h2>Training</h2> -->
<!-- 			<hr> -->
<!-- 			<p>Login</p> -->
			
<!-- 			<form class="form-control" name="myForm" -->
<!-- 				 style="text-align: center" -->
<!-- 				action="../T001" method="post"> -->
<!-- 				<h3 class="text-center">LOGIN</h3> -->
<!-- 				<div class="row"> -->
<!-- 					<label id="lblError"></label> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>User Id:</label> <input id="txtUserID" name="txtUserID" -->
<!-- 							style="margin-left: 14px" type="text" value="" /> -->
<!-- 					</div> -->
<!-- 					<div class="form-group" style="margin-top: 10px;"> -->
<!-- 						<label>Password:</label> <input id="txtPassword" -->
<!-- 							name="txtPassword" type="password" value="" /> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="form-group" style="margin-top: 20px"> -->
<!-- 						<input type="submit" id="btnLogin" style="margin-left: 50px" -->
<!-- 							onclick="myFunction()" value="Login" /> -->
<!-- 						<input type="submit" onclick="myFunction1()" style="margin-left: 100px" value="Clear"/> -->
							
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<input name="action" value="login"> -->
<!-- 			</form> -->
			
<!-- 		</div> -->
<!-- </body> -->


-----------------
js/T002.jsp
<!-- 		<script type="text/javascript" src="../js/error.js"></script> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<div class="container"> -->
<!-- 		<h2 style="color: red;">Training</h2> -->
<%-- 		<% --%>
			
<%-- 		%> --%>
<!-- 		<form class="form-group" action="../T001" method="post" name="myform"> -->
<!-- 			<div class="form-group"> -->
<!-- 				<div class="col-sm-3"> -->
<%-- 					Welcome:<%=session.getAttribute("txtUserID")%> --%>
<!-- 				</div> -->
<!-- 				<input name="action" value="logout" hidden> <input type="submit" -->
<!-- 					value="Logout"><br> <input -->
<!-- 					class="form-control input-sm" -->
<!-- 					style="background: blue; margin-bottom: 20px"></input> -->
<!-- 			</div> -->
<!-- 		</form> -->

<!-- 		<form class="form-group" action="" method="post"> -->
<!-- 			<div class="form-group" style="background: #ffff33"> -->
<!-- 				<div class="col-sm-5"> -->
<!-- 					<label id="llbCustomername">Customer name:</label> <input -->
<!-- 						id="txtCustomerName"> <label>Sex </label> <select -->
<!-- 						id="llbSex"> -->
<!-- 						<option></option> -->
<!-- 						<option>Male</option> -->
<!-- 						<option>Female</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div class="col-sm-5"> -->
<!-- 					<label>Birthday:</label> <input id="txtBirthdayForm">~<input -->
<!-- 						id="txtBirthdayTo"> -->
<!-- 				</div> -->
<!-- 				<div class="col-sm-offset-11"> -->
<!-- 					<button id="btnSearch" type="button" class="btn" -->
<!-- 						onclick="searchName()">Search</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- <div class="form-group"> -->
<!-- 				<div class="row-sm-12"> -->
<!-- 					<div class="col-sm-3"> -->
<!-- 						<button name="btnFirst" type="button" class="btn"><</button> -->
<!-- 						<button name="btnPrevious" type="button" class="btn"><<</button> -->
<!-- 						Previous -->
<!-- 					</div> -->

<!-- 					<div class="col-sm-offset-9"> -->
<!-- 						Next -->
<!-- 						<button name="btnNext" type="button" class="btn">>></button> -->
<!-- 						<button name="btnLast" type="button" class="btn">></button> -->

<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> --> -->

<!-- 			<!-- Phân trang --> -->
<%-- 			<% --%>
// 				int first = 0, last = 0, pages = 1;

// 				if (request.getParameter("pages") != null) {
// 					pages = (int) Integer.parseInt(request.getParameter("pages"));
// 				}
// 				//Lấy tổng CUS
// 				int total = new MSTCUSTOMER_DAO().getCount();

// 				if (total <= 4) {
// 					first = 0;
// 					last = total;
// 				} else {
// 					first = (pages - 1) * 2;
// 					last = 4;
// 				}
<%-- 			%> --%>





<!-- 			<table id="myTable" class="display"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th><input type="checkbox" name="Check_All" value="Check All" -->
<!-- 							onclick="toggle(this);"></th>	 -->
<!-- 						<th>Customer ID</th> -->
<!-- 						<th>Customer Name</th> -->
<!-- 						<th>Sex</th> -->
<!-- 						<th>Birthday</th> -->
<!-- 						<th>Address</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<% --%>
// 						//Lấy ra danh sách sản phẩm
// 						List<MSTCUSTOMER> list = new MSTCUSTOMER_DAO().GetCustomerPT(first, last);
// 						for (MSTCUSTOMER customerlist : list) {
<%-- 					%> --%>
<!-- 					<tr> -->
						
					
<!-- 						<td><input type="checkbox" -->
<%-- 							id="<%=customerlist.getS_customerID()%>" --%>
<%-- 							value="<%=customerlist.getS_customerID()%>" --%>
<!-- 							onclick=" -->
<!-- 							checkedFunction(this)" name="check_list" -->
<!-- 							class="styled"></td> -->


<!-- 						<td><a -->
<%-- 							href="T003.jsp?action=view&idCustomer=<%=customerlist.getS_customerID()%>"><%=(customerlist.getS_customerID() != null ? customerlist.getS_customerID() : "")%></a></td> --%>
<%-- 						<td><%=(customerlist.getS_customerName() != null ? customerlist.getS_customerName() : "")%></td> --%>
<%-- 						<td><%=(customerlist.getS_sex() != null ? customerlist.getS_sex() : "")%></td> --%>
<%-- 						<td><%=(customerlist.getS_birthday() != null ? customerlist.getS_birthday() : "")%></td> --%>
<%-- 						<td><%=(customerlist.getS_address() != null ? customerlist.getS_address() : "")%></td> --%>
<!-- 					</tr> -->
<!-- 				</tbody> -->
<%-- 				<% --%>
// 					}
<%-- 				%> --%>
<!-- 			</table> -->

<!-- 			<!-- Phan trang --> -->
<!-- 			<ul class="start"> -->
<%-- 				<% --%>
// 					//Button Previous
// 					int back = 0;
// 					if (pages == 0 || pages == 1) {
// 						back = 1;//Luon la page 1
// 					} else {
// 						back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
// 					}
<%-- 				%> --%>
<%-- 				<li><a href="T002.jsp?pages=<%=back%>"><i></i></a></li> --%>
<%-- 				<% --%>
// 					//Button Number pages
// 					int loop = 0, num = 0;
// 					if ((total / 2) % 2 == 0) {
// 						num = total / 4;
// 					} else {
// 						num = (total + 1) / 2;
// 					}
// 					//Nếu total lẻ thêm 1
// 					if (total % 2 != 0) {
// 						loop = (total / 2) + 1;

// 					} else {
// 						//Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
// 						if (total < (num * 2) + 2 && total != num * 2) {
// 							loop = (total / 2) + 1;
// 						} else {
// 							//Nếu bằng fullPage thì không thêm
// 							loop = (total / 2);
// 						}
// 					}
// 					//Lap so pages
// 					for (int i = 1; i <= loop; i++) {
<%-- 				%> --%>
<%-- 				<% --%>
// 					if (pages == i) {
<%-- 				%> --%>

<%-- 				<li><span><a href="T002.jsp?pages=<%=i%>"><%=i%></a></span></li> --%>
<%-- 				<% --%>
// 					} else {
<%-- 				%> --%>
<%-- 				<li class="arrow"><a href="T002.jsp?pages=<%=i%>"><%=i%></a></li> --%>

<%-- 				<% --%>
// 					}
// 					}
<%-- 				%> --%>
<%-- 				<% --%>
// 					//Button Next
// 					int next = 0;
// 					//Nếu total lẻ
// 					if (total % 2 != 0) {
// 						if (pages == (total / 2) + 1) {
// 							next = pages;//Khong next
// 						} else {
// 							next = pages + 1;//Co next
// 						}
// 					} else {
// 						//Nếu total chẵn nhỏ hơn fullpage
// 						//Và không fullPage thì thêm 1
// 						if (total < (num * 2) + 2 && total != num * 2) {
// 							if (pages == (total / 2) + 1) {
// 								next = pages;//Khong next
// 							} else {
// 								next = pages + 1;//Co next
// 							}
// 						} else {
// 							//Nếu fullPage đến trang cuối dừng
// 							//Chưa tới trang cuối thì được next
// 							if (pages == (total / 2)) {
// 								next = pages;//Khong next
// 							} else {
// 								next = pages + 1;//Co next
// 							}
// 						}
// 					}
<%-- 				%> --%>
<%-- 				<li><a href="T002.jsp?pages=<%=next%>"><i class="next"></i></a></li> --%>
<!-- 			</ul> -->
<!-- 	</div> -->

<!-- 	<br> -->





<!-- 	</form> -->
<!-- 	</div> -->

<!-- 	<form action="../CustomerAction" method="post"> -->
<!-- 		<input hidden name="listDelete" id="customerId"> <input name="action" -->
<!-- 			hidden value="delete"> -->
<!-- 		<button name="btnDelete" class="btn" type="submit">Delete</button> -->
<!-- 	</form> -->

<!-- 	<form action="T003.jsp" method="post"> -->
<!-- 		<input name="action" hidden value="addnew"> -->
<!-- 		<button class="btn" type="submit">Add new</button> -->
<!-- 	</form> -->

<!-- 	<script type="text/javascript"> -->
// 		function checkedFunction(arg) {
// 			var x = document.getElementById("customerId");
// 			if (arg.checked == true) {
// 				x.value = x.value + ",";
// 				x.value = x.value + arg.id;
// 			}
// 			if (arg.checked == false) {
// 				x.value = x.value.replace("," + arg.id, "");
// 			}
// 		}
<!-- 	</script> -->
<!-- </body> -->
------------------------------jsp/T003.jsp
<!-- <body> -->
<%-- 	<% --%>
// 		String idCustomer = request.getParameter("idCustomer")!=null?request.getParameter("idCustomer"):"";
// 		String action = request.getParameter("action");
// 		MSTCUSTOMER_DAO dao = new MSTCUSTOMER_DAO();
		
// 		ArrayList<MSTCUSTOMER> cusList = new ArrayList<>();
// 		if(idCustomer!=""){
// 			cusList = dao.getListCustomerByID(idCustomer);
// 		}
// 		MSTCUSTOMER cus = cusList.size()>0 ? cusList.get(0) : null;
// 		String CUSTOMER_ID = "";
// 		String CUSTOMER_NAME = "";
// 		String SEX = "";
// 		String ADDRESS = "";
// 		String EMAIL = "";
// 		String BIRTHDAY = "";
// 		if (cus != null) {
// 			CUSTOMER_ID = cus.getS_customerID() != null ? cus.getS_customerID() : "";
// 			CUSTOMER_NAME = cus.getS_customerName() != null ? cus.getS_customerName() : "";
// 			SEX = cus.getS_sex() != null ? cus.getS_sex() : "";
// 			ADDRESS = cus.getS_address() != null ? cus.getS_address() : "";
// 			BIRTHDAY = cus.getS_birthday() != null ? cus.getS_birthday().toString() : "";
// 			EMAIL = cus.getS_email() != null ? cus.getS_email() : "";
// 			System.out.print(EMAIL+"sssss");
// 		}
<%-- 	%> --%>

<!-- 	<form action="../CustomerAction"> -->
<%-- 		<div <%=!action.equals("view")?"hidden":"" %>> --%>
<!-- 			<label>CUSTOMER_ID</label> <input name="CUSTOMER_ID" -->
<%-- 				value=<%=action.equals("view") ? CUSTOMER_ID :""%>> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>CUSTOMER_NAME</label> <input name="CUSTOMER_NAME" -->
<%-- 				value="<%=action.equals("view") ? CUSTOMER_NAME:""%>"> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<%-- 			<label>SEX</label> <input name="SEX" value="<%=action.equals("view") ? SEX:""%>"> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<%-- 			<label>ADDRESS</label> <input name="ADDRESS" value="<%=action.equals("view") ? ADDRESS:""%>"> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<%-- 			<label>BIRTHDAY</label> <input name="BIRTHDAY" value="<%=action.equals("view") ? BIRTHDAY:""%>"> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<%-- 			<label>EMAIL</label> <input name="EMAIL" value="<%=action.equals("view") ? EMAIL:""%>"> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<%-- 			<% --%>
// 				Date d = new Date();
// 				String currentDate = d.getDate() + "-" + d.getMonth() + "-" + d.getYear();
// 				String UPDATE_YMD = (cus != null && cus.getD_insertYMD() != null) ? cus.getD_insertYMD().toString() : currentDate;
<%-- 			%> --%>
<!-- 			<input name="UPDATE_YMD" -->
<%-- 				value="<%=UPDATE_YMD%>"> --%>
<!-- 			<input name="INSERT_YMD" -->
<%-- 				value="<%=(cus != null && cus.getD_insertYMD() != null) ? cus.getD_insertYMD() : currentDate%>"> --%>
<!-- 			<input name="DELETE_YMD" -->
<%-- 				value="<%=(cus != null && cus.getD_deleteYMD() != null) ? cus.getD_deleteYMD() : currentDate%>"> --%>
<!-- 			<input name="action" value="create" hidden> -->
<!-- 		</div> -->
<%-- 		<input type="submit" value="Save" <%=action.equals("view")?"hidden":"" %>> --%>
<!-- 	</form> -->
<!-- </body> -->
-----------------------------
web.xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>CustomerSystem1</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  <servlet>
    <servlet-name>LoginServlet</servlet-name>
    <servlet-class>fs.action.LoginServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>LoginServlet</servlet-name>
    <url-pattern>/T001</url-pattern>
  </servlet-mapping>
</web-app>


