<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" method="post" action="update.do">
		<div id="wrap">
			<table class="tbl_View">
				<caption>info</caption>
				<colgroup>
					<col style="width: 30%" />
					<col style="width:;" />
				</colgroup>
				<tbody>
					<tr>
						<th>조회수</th>
						<td>${dto.viewcnt}</td>
					</tr>

					<tr>
						<th>번호</th>
						<td><input name="bno" value="${dto.bno}" type="text"
							size="63" maxlength="20" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input name="writer" value="${dto.writer}" type="text"
							size="63" maxlength="20" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="title" value="${dto.title}" type="text"
							size="63" maxlength="20" /></td>
					</tr>

					<tr>
						<th>수정 날짜</th>
						<td><input name="regdate" value="${dto.regdate}" readonly="readonly" style="width: 199px; "/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="10" name="content"
								style="width: 462px;">${dto.content}</textarea>
					</tr>
				</tbody>
				<tr>
					<td colspan="2">
						<input type="button" value="글저장" onclick="form.submit()" /> 
					<%-- 	<input type="hidden" id="bno" value="${bno}">  --%>
						<input type="button" id="btnDelete" value="삭제" OnClick="window.location='delete.do?bno=${dto.bno}'">
						<input type="button" value="목록" OnClick="window.location='./list.do'">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>