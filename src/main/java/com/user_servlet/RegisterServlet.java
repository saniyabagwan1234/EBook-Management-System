package com.user_servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.DB.DBConnect;

import com.dao.UserDAOImpl;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+""+email+""+phno+""+password);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			if(check!=null) 
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				boolean f=dao.userRegister(us);
				
				if(f)
				{
					System.out.println("User Register Success..");
					
					session.setAttribute("succMsg", "Registration Successfully..");
					resp.sendRedirect("register.jsp");
				}else {
					System.out.println("User Register failed..");
					session.setAttribute("failedMsg", "Registration Failed..");
					resp.sendRedirect("register.jsp");
				}
			}else {
					System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("failedMessage", "Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");
				}																														
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
