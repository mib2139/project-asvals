<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
<H1 align="center">공지사항</H1>
	<div id="wrap">
		<table border="1" width="600px" class="tbl_List">
			<caption>Board</caption>
			<colgroup>
				<col style="width: 9%" />
				<col style="width: 16%" />
				<col style="width: 16%" />
				<col style="width: 20%" />
				<col style="width: 40%" />
				<col style="width:;" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr>
						<td><a href="<c:url value="${path}/board/view.do">
						<c:param name="bno" value="${row.bno}"/>
						</c:url>">
						${row.bno}</a></td>
						<td>${row.title}</td>
						<td>${row.writer}</td>
						<td>${row.regdate}</td>
						<td>${row.viewcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="txt-rt mt20">
			<button type="button" id="btnWrite" OnClick="window.location='./write.do'"
			style="font-size: 25px">글쓰기</button>
		</div>
	</div>
</body>
</html>
