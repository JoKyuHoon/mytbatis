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
				<form id="rFrm">
					<tr>
						<th>댓글작성</th>
						<th><textarea rows="3" cols="50" name="content"></textarea></th>
						<th><input type="button" value="댓글등록" id="replyInsert"></th>
						<input type="hidden" name="bno" value="${b.boardNo}">
						<input type="hidden" name="writer" value="${loginUser.userName}">
					</tr>
				</form>
			</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="3" style="text-align:center">댓글 : ${reply.size()}</td>
			</tr>
			<tbody id="replyList">
				<c:forEach var="r" items="${reply}">
					<tr>
						<td>${r.replyWriter}</td>
						<td>${r.replyContent}</td>
						<td>${r.createDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
	$(function() {
		// 댓글 등록 버튼 클릭 시
		$('#replyInsert').click(function(){
			let rdata = $('#rFrm').serialize();  // 폼 데이터 직렬화
			// Ajax 요청
			$.ajax({
				url: 'rinsert.bo',  // 댓글 등록 URL
				data: rdata,
				type: 'post',
				success: function(result) {
					console.log(result);
					if (result > 0) {
						replyList();  // 댓글 목록 새로고침
					}
				},
				error: function() {
					console.log("댓글달기 통신 실패");
				}
			});
		});
		
		// 댓글 목록 갱신 함수
		function replyList() {
			$.ajax({
				url: "detail.bo",  // 게시판 상세보기 페이지
				data: {bno: ${b.boardNo}},  // 게시글 번호
				type: 'post',
				success: function(result) {
					console.log(result);
					let list = "";
					// 서버에서 받은 댓글 목록을 순회하며 HTML로 표시
					$.each(result, function(index, value){
						list += "<tr>" +
							"<td>" + value.replyWriter + "</td>" +
							"<td>" + value.replyContent + "</td>" +
							"<td>" + value.createDate + "</td>" +
							"</tr>";
					});
					// 댓글 목록을 테이블에 삽입
					$('#replyList').html(list);
				},
				error: function() {
					console.log('댓글등록 후 리스트 목록 통신 실패');
				}
			});
		}
	});
</script>
</body>
</html>