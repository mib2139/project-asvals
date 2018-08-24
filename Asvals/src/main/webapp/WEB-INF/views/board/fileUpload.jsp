<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link href="https://fonts.googleapis.com/css?family=Imprima"
	rel="stylesheet">
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Form</title>
</head>

<style>
.bordered {
	*border-collapse: collapse; /* IE7 and lower */
	border-spacing: 0;
	width: 100%;
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	box-shadow: 0 1px 1px #ccc;
	background-color: #f1f1f1;
}
.bordered td, .bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}
.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}
.bordered th:first-child {
	
}
.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}
.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}
.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}
.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}
.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}
input[type=button], input[type=submit], input[type=reset] {
	background-color: #8ACCB9;
	border: none;
	border-radius: 15px;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
select {
	width: 100%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
}
</style>
</style>
<body>
	<h3 style="font-family: 'Imprima', sans-serif;">File Upload Form</h3>
	<center>
		<!--   파일업로드를 위해선 반드시 method="post" enctype="Multipart/form-data"여야함!  -->
		<form name="forcate" action="insertimg.do" method="post"
			enctype="Multipart/form-data" style="height: 110px;">
			<table class="bordered">
				<tr
					style="background-color: #8ACCB9; color: white; font-family: 'Imprima', sans-serif;">
					<td>No
					<td>Cate
					<td>File upload
				</tr>
				<tr>
					<td>
					<td>
					<select name="cate" id="cate" size="1">
							<option value="" selected></option>
							<option value="p">평창</option>
							<option value="k">강릉</option>
							<option value="j">정선</option>
							<option value="e">기타</option>
					</select>
					<td>
						<!--  파일 업로드는 input type="file"로 지정한다. --> 
						<input type="file" id="file" name="file" /><br /> <input type="reset" value="취소" /><br>
				</tr>
				<tr style="border: 0px">
					<td colspan="3" align="center"><br> <input type="submit"
						value="전송" /><br> <br>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>