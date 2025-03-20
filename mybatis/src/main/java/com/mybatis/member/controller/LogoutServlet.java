package com.mybatis.member.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*
        HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
        
        if (session != null) {
            session.invalidate(); // 세션 무효화 (로그아웃)
        }

        response.sendRedirect(request.getContextPath()); // 메인 페이지로 이동
        */
    	request.getSession().invalidate();
    	response.sendRedirect(request.getContextPath());
    }
}
