<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 삭제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.errMsg{color: red; font-size: 9pt;}
</style>
</head>
<body>
	<div align="center" class="container my-4">
		<h2>회원 정보 삭제</h2>
		<hr class="border border-danger border-2 opacity-50 mb-4">
		<%-- 모델이름 같아도 괜찮은 지 나중에 확인(여기는 이상 없음) --%>
		<form:form modelAttribute="mybatisMember" name="frm"
				   method="post"
				   action="${pageContext.request.contextPath}/deleteOk">
			<table class="table" style="text-align: center; width: 300;">
				<tr>
					<td>
						아이디 : <form:input path="id" maxlength="20" />
								<%-- <form:errors path="id" cssClass="errMsg" /> --%><br>
						<span id="del" style="display: none">
							<input type="submit" value="삭제" class="btn btn-outline-danger mt-4 me-5">
						</span>
						<input type="reset" value="취소" class="btn btn-outline-secondary mt-4">
					</td>
				</tr>
			</table>
		</form:form>
	</div>
<script type="text/javascript">
	/* 이 페이지에서 볼 때 아래 id는 form의 path의 id. 그 값이 비어있지 않을 때 삭제 버튼이 보임*/
	if(document.frm.id.value != ""){
		document.getElementById("del").style.display="";
	}
</script>
</body>
</html>