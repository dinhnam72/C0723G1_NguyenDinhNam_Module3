package com.example.bt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                createUser(request,response);
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String passWork = request.getParameter("pass");
        Date date = new Date();
        DateFormat dateFormat= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        if (userName.equals("admin") && passWork.equals("123abc")){
            request.setAttribute("date",dateFormat.format(date));
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("succes.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            String error = "Tên đăng nhập hoặc mật khẩu không đúng";
            request.setAttribute("error",error);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
