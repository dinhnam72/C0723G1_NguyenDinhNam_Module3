package com.example.bt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value ="")
public class StudentServlet extends HttpServlet {
private static List<Student> studentList= new ArrayList<>();
static {
       Student student1=new Student(1,"Nguyen Van An",true,83);
       Student student2=new Student(2,"Nguyen Thi Lan",false,49);
       Student student3=new Student(3,"Tran Thi Ha",false,64);
       Student student4=new Student(4,"Tran Tuan Anh ",true,99);
       studentList.add(student1);
       studentList.add(student2);
       studentList.add(student3);
       studentList.add(student4);
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            default:
                display(request,response);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) {
//        if (studentList.size()==0){
//            String notification = "Lop chua co hoc sinh";
//            request.setAttribute("notification",notification);
//            RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
//            try {
//                requestDispatcher.forward(request,response);
//            } catch (ServletException e) {
//                throw new RuntimeException(e);
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//        }else {
        System.out.println(studentList.size());
            request.setAttribute("studentList",studentList);
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
