<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer table {
		border: 1px solid;
		border-collapse: collapse;
	}
	.outer tr, .outer td {
		border: 1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2>게시판 상세보기</h2>
		
		<table align="center">
			<tr>
				<td width="100px;">글번호</td>
				<td width="400px;">${b.boardNo}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${b.boardTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${b.boardWriter}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${b.count}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${b.createDate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${b.boardContent}</td>
			</tr>
		</table>
		<br>
		<table align="center">
			<c:choose>
			<c:when test="${empty loginUser}">
			<tr>
				<th>댓글작성</th>
				<th><textarea rows="3" cols="50" readonly>로그인 후 이용하세요</textarea></th>
				<th><input type="button" value="댓글등록" disabled></th>
			</tr>
			</c:when>
			
			<c:otherwise>
			
			<tr>
				<th>댓글작성</th>
				<th><textarea rows="3" cols="50" id="content"></textarea></th>
				<th><input type="button" value="댓글등록" id="replyInsert"></th>
			</tr>
			</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="3" style="text-align:center">댓글 : ${reply.size()}</td>
			</tr>
			<c:forEach var="r" items="${reply}">
				<tr>
					<td>${r.replyWriter}</td>
					<td>${r.replyContent}</td>
					<td>${r.createDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script>
		$(()=>
			$('#replyInsert').click(function(){
				// serialize() : form 안에 input, select, textarea등의 value값을 간단하게 표준 url인코딩 형태의 문자열로 만들어줌
				// content=내용&id=값&writer=값
				$.ajax({
					url : 'detail.bo',
					data : {
						bno : ${b.boardNo},
						content : $('#content').value(),
						writer : '${loginUser.userName}'
					},
					type : 'post',
					succsee: function(result) {
						console.log(result)
					},
					error: function() {
						console.log("댓글달기 통신 실패");
					}
				})
			})
		)
	</script>
</body>
</html>