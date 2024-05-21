<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.dao.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #bfbfbd;
}
</style>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Categories:<%=b.getBookCategory()%>
						</p>
						<div class="row ">

							<a href="" class="btn btn-success btn-sm ml-9">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="" class="btn btn-danger btn-sm ml-4"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
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
	</div>
</body>
</html>