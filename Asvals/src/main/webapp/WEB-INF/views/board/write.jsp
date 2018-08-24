<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title = $("#title").val();
			var content = $("#content").val();
			var writer = $("#writer").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if (writer == "") {
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
	});
</script>
</head>
<body>

	<%
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		String strdate = simpleDate.format(date);
	%>

	<h2>게시글 작성</h2>
	<form name="form1" method="post" action="./insert.do"">
		<div id="wrap">
			<table class="tbl_View">
				<caption>Board</caption>
				<colgroup>
					<col style="width: 30%" />
					<col style="width:;" />
				</colgroup>
				<tbody>
					<tr>
						<th>글번호</th>
						<td><input name="bno" type="text" size="63" maxlength="20" /></td>
					</tr>

					<tr>
						<th>작성자</th>
						<td><input name="writer" type="text" size="63" maxlength="20" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="title" type="text" size="63" maxlength="20" /></td>
					</tr>
					<tr>
						<th>작성 날짜</th>
						<td><input name="regdate" size="63" value="<%=strdate%>"
							maxlength="20" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="5" cols="20" name="content"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="txt-rt mt20">
				<button type="submit" id="btnSave">글저장</button>
				<button type="button" OnClick="window.location='./list.do'">목록</button>
			</div>
		</div>
	</form>
</body>
</html>