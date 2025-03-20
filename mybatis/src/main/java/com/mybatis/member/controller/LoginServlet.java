package com.mybatis.member.controller;

import java.io.IOException;

import com.mybatis.member.service.MemberServiceImpl;
import com.mybatis.member.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("path : " + request.getContextPath());
		Member m = new Member();
		
		m.setUserId(request.getParameter("userId"));
		m.setUserPwd(request.getParameter("userPwd"));
		
		// MemberServiceImpl mi = new MemberServiceImpl();
		Member loginUser = new MemberServiceImpl().loginMember(m);
		
		if(loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
		}
	}

}
