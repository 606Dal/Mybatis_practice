<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div align="center" class="container my-4">
		<h2>회원 정보 목록</h2>
		<hr class="border border-primary border-2 opacity-50">
		<div class="mx-4 col-10">
			<table class="table table-hover" style="text-align: center;">
			<%-- <colgroup>
				<col width="10%">
			</colgroup> --%>
				<thead class="table-dark">
					<tr>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>관리자메뉴</td>
					</tr>
				</thead>
				<tbody>
					<%-- 회원 정보 가져오기. (mybatisMembers : 컨트롤러에서 담은 모델 객체 이름) --%>
					<c:forEach items="${mybatisMembers }" var="mybatisMember">
					<tr>
						<td>${mybatisMember.id }</td>
						<td>${mybatisMember.pwd }</td>
						<td>${mybatisMember.name }</td>
						<td>${mybatisMember.tel }</td>
						<td>${mybatisMember.email }</td>
						<td>
							<input type="button" value="수정" class="btn btn-outline-success btn-sm me-2"
								onclick="location.href='${pageContext.request.contextPath}/modifyMember/${mybatisMember.id}'">
							<input type="button" value="삭제" class="btn btn-outline-danger btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/delMember/${mybatisMember.id}'">
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><a class="btn btn-outline-primary" href="writeForm" role="button">글쓰기</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>