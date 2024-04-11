<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제 실패</title>
<script type="text/javascript">
	alert("삭제하고자 하는 회원 ID가 존재하지 않습니다.");
	location.href="<%= request.getContextPath()%>/delMember";
</script>
</head>
<body>

</body>
</html>