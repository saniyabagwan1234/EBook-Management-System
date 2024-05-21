<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.dao.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.user_servlet.LoginServlet"%>
<%@ page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_components/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/booksLi.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #bfbfbd;
}
</style>

</head>
<body style="background-color: #d6d4d5;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_components/navbar.jsp"%>

	<div class="cotainer-fluid back-img">
		<h2 class="text-center text-white">EBook Management System</h2>
	</div>

	<!----------------------------------- start recent book-------------------------------->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row ">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row ">
						
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm"><i
						class="fa-solid fa-cart-plus"></i>Add Cart></a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-danger btn-sm"><i
						class="fa-solid fa-cart-plus"></i>Add Cart</a>
						<%
						}
						%>
							
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm">View Details</a> 
								
								<a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger  btn-sm text-white">View all</a>
		</div>
	</div>

	<!----------------------------------- End recent book-------------------------------->

	<hr>

	<!----------------------------------- New book--------------------------------------->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row ">

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart></a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger  btn-sm text-white">View
				all</a>
		</div>
	</div>

	<!----------------------------------- End New book-------------------------------->

	<hr>
	<!----------------------------------- old  book-------------------------------->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger  btn-sm text-white">View
				all</a>
		</div>
	</div>
	<!----------------------------------- end old book-------------------------------->
	<hr>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>