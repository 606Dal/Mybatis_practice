<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	.errMsg{color: red; font-size: 9pt;}
</style>
</head>
<body>
	<div align="center" class="container my-4">
		<h2>회원 정보 수정</h2>
		<hr class="border border-danger border-2 opacity-50 mb-4">
		
		<div class="mx-4 col-10">
			<%-- <form:form commandName="member"> 이거 쓰면 오류남 --%>
			<form:form modelAttribute="mybatisMember"
					   method="post"
					   action="${pageContext.request.contextPath}/modifyOk">
				<table class="table" style="text-align: center;">
					<tr>
						<td width="20%">아이디</td>
						<td>
							<form:input path="id" maxlength="20" readonly="true"/>
							<form:errors path="id" cssClass="errMsg" />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<form:password path="pwd" maxlength="20"/>
							<form:errors path="pwd" cssClass="errMsg" />
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<form:input path="name" maxlength="50"/>
							<form:errors path="name" cssClass="errMsg" />
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<form:input path="tel" maxlength="13"/>
							<form:errors path="tel" cssClass="errMsg"/>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<form:input path="email" maxlength="50"/>
							<form:errors path="email" cssClass="errMsg"/>
						</td>
					</tr>
				</table>
				<input type="submit" value="수정" class="btn btn-outline-success mt-4 me-5">
				<input type="reset" value="취소" class="btn btn-outline-danger mt-4">
			</form:form>
		</div>
	</div>

</body>
</html>