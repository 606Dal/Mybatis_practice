<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	.msg{color: red; font-size: 10pt;}
</style>

</head>
<body>
	<div align="center" class="container my-4">
		<h2>회원 가입 페이지</h2>
		<hr class="border border-success border-2 opacity-50">
		
		<div class="mx-4 col-10">
			<form:form method="post" action="insertOk" modelAttribute="mybatisMember">
				<!-- 아이디 -->
				<div class="form-group row my-2 col-8">
				 	<label class="col-sm-3">아이디</label>
				 	<div class="col-sm-3">
				 		<form:input path="id" maxlength="20" style="width: 220px;"/>
				 	</div>
				</div>
				<div class="col-offset-2 col-sm-8">
				 	<form:errors path="id" cssClass="msg"/>
				</div>
				<!-- 비번 -->
				<div class="form-group row my-2 col-8">
				 	<label class="col-sm-3">비밀번호</label>
				 	<div class="col-sm-3">
				 		<form:password path="pwd" maxlength="20" style="width: 220px;"/>
				 	</div>
				</div>
				<div class="col-offset-2 col-sm-8">
				 	<form:errors path="pwd" cssClass="msg"/>
				</div>
				<!-- 이름 -->
				<div class="form-group row my-2 col-8">
				 	<label class="col-sm-3">이름</label>
				 	<div class="col-sm-3">
				 		<%-- maxlength - db에 설정했던 크기 --%>
				 		<form:input path="name" maxlength="45" style="width: 220px;"/>
				 	</div>
				</div>
				<div class="col-offset-2 col-sm-8">
				 	<form:errors path="name" cssClass="msg"/>
				</div>
				<!-- 전화번호 -->
				<div class="form-group row my-2 col-8">
				 	<label class="col-sm-3">전화번호</label>
				 	<div class="col-sm-4">
				 		<form:input path="tel" maxlength="13" style="width: 220px;"/>
				 	</div>
				</div>
				<div class="col-offset-2 col-sm-8">
				 	<form:errors path="tel" cssClass="msg"/>
				</div>
				<!-- 이메일 -->
				<div class="form-group row my-2 col-8">
				 	<label class="col-sm-3">이메일</label>
				 	<div class="col-sm-4" >
				 		<form:input path="email" maxlength="45" style="width: 270px;"/>
				 	</div>
				</div>
				<div class="col-offset-2 col-sm-8">
				 	<form:errors path="email" cssClass="msg"/>
				</div>
				<!-- 전송 취소 버튼 -->
				<div class="form-group row my-4 col-8">
			 		<div class="col-sm-offset-2 col-sm-8">
						<input type="submit" class="btn btn-outline-success mx-5" value="등록">
						<input type="reset" class="btn btn-outline-danger" value="취소">
					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>