<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/menubar.jsp"></jsp:include>
	
	<div align="center">
		<h2>게시판 상세보기</h2>
		
		<table>
		<thead>
				<tr>
					<th width="300px">제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<td>${b.boardContent}</td>
				

			</tbody>
		</table>
	</div>
	
</body>
</html>