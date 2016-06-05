<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@page import="eb.java.imall.login.*" %>
<% 
        //接收参数 
        String loginName = request.getParameter("loginName"); 
        String loginPass = request.getParameter("loginPass"); 
        String mail = request.getParameter("mail");
        //控制台输出表单数据看看 
        System.out.println("loginName=" + loginName + ",loginPass=" + loginPass+ ",mail=" + mail); 
        //检查code的合法性 
        UserOperation u=new UserOperation();
		int num=u.isExists(loginName);
        if (loginName == null || loginName.trim().length() == 0) { 
                out.println("loginName can't be null or empty"); 
        } else if (loginName != null && num!=0) { 
                out.println("loginName can't be "+loginName+"this loginName is exists!"); 
        } else { 
                out.println("OK"); 
        } 
%>