<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body {
		background-color: #f5eedc;
	}
	h1 {
	
	}

	.login-area a {
		text-decoration: none;
		color: black;
		font-size: 14px;
	}
	.loginInfo {
		font-size: 18px;
	}
	.nav-area {
		background-color: black;
		color: white;
		height: 50px;
	}
	.menu {
		display: table-cell;
		width: 250px;
		height: 50px;
		vertical-align: middle;
	}
	
	
 	
  	.D_input {
 	  position: relative;
	  width: 100%;
	  margin-bottom:20px;
	}
	
	.input {
	  font-size: 15px;
	  color: #222222;
	  width: 200px;
	  border: none;
	  border-bottom: solid #aaaaaa 1px;
	  padding-bottom: 10px;
	  padding-left: 10px;
	  position: relative;
	  background: none;
	  z-index: 5;
	}
	.input::placeholder { color: #aaaaaa; }
    .input:focus { outline: none; }

 	span {
	  display: block;
	  position: absolute;
	  bottom: 0;
	  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
	  background-color: #666;
	  width: 0;
	  height: 2px;
	  border-radius: 2px;
	  transition: 0.5s;
	}
	
	label {
	  position: absolute;
	  color: #aaa;
	  left: 10px;
	  font-size: 18px;
	  bottom: 8px;
	  transition: all .2s;
	}

	.input:focus ~ label, .input:valid ~ label {
	  font-size: 14px;
	  bottom: 30px;
	  color: #666;
	  font-weight: bold;
	}

	.input:focus ~ span, .input:valid ~ span {
  	  width: 100%;
	}  
	
	.login {
		height: 30px;
		
		
	}
	
	
</style>
</head>
<body>
	<h1 align="center">Welcome to MyBatis World</h1>
	
	<div class="login-area" align="right">
		<c:choose>
			<c:when test="${empty loginUser}">
				<form action="login.me" method="post">
					<table>
						<tr>
							<td>
								<div class="D_input">
									<input type="text" name="userId" class="input" required>
									 <label>ID</label> 
									<span></span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="D_input">
									<input type="password" name="userPwd" class="input" id="pw" required>
									 <label>PW</label> 
									<span></span>
								</div>
							</td>
						</tr>
							<td colspan="3"><input type="submit" class="login" value="로그인" ></td>
						<tr>
							<td colspan="3" align="center">
								<a href="enrollForm.me">회원가입</a>
								<a href="">아이디/비밀번호찾기</a>
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			
			<c:otherwise>
				 <table>
					<tr>
						<td colspan="2"><b class="loginInfo">${loginUser.userName}님 환영합니다</b></td>
					</tr>
					<tr>
						<td><a href="">마이페이지</a></td>
						<td><a href="Logout.me">로그아웃</a></td>
					</tr>
				 </table>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
	<div class="nav-area" align="center">
		<div class="menu">HOME</div>
		<div class="menu">공지사항</div>
		<div class="menu" onclick="location.href='list.bo?nowPage=1'">게시판</div>
		<div class="menu">ETC</div>
	</div>
</body>
</html>