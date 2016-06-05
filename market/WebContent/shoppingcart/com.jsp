<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.io.*,eb.java.imall.DbUtil"%>
    <%@ page import="com.jspsmart.upload.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单评论</title>
</head>
<body>
<%
SmartUpload su =new SmartUpload();// 新建一个SmartUpload对象
long file_size_max=4000000;//文件最大值
String fileExt="";
String url="/images/"; //将上传文件全部保存到指定目录
su.initialize(pageContext);// 上传初始化
try {
su.setAllowedFilesList("jpg,gif,png,jpeg");//只允许上载文件类型
su.upload();//上传
} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("只允许上传.jpg和.gif,png,jpeg类型图片文件");
window.location='upload.jsp';
</script>
<%
}
try{
com.jspsmart.upload.File myFile = su.getFiles().getFile(0);
//文件不能为空,否则返回
if (myFile.isMissing()){%>
<script language=javascript>
alert("请先选择你要上传的文件");
window.location='com.jsp';
</script>
<%}
else{
fileExt= myFile.getFileExt(); //取得文件后缀名
int file_size=myFile.getSize(); //取得文件的大小
String fileurl="";
if(file_size<file_size_max){
//更改文件名，取得当前上传时间的毫秒数值
Connection conn=DbUtil.getConnection();
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis());
fileurl=application.getRealPath("/")+url;
fileurl+=filename+"."+fileExt; //图片上传后的路径
String image=url+filename+"."+fileExt;
String wuliu=su.getRequest().getParameter("grade1");
String fuwu=su.getRequest().getParameter("grade3");
String zhiliang=su.getRequest().getParameter("grade2");
String comment=su.getRequest().getParameter("comment");
String loginName=(String)session.getAttribute("loginName");
Integer orderID=(Integer)session.getAttribute("orderID");
PreparedStatement stmt=conn.prepareStatement("insert into comment(wuliu,fuwu,zhiliang,comment,image,loginName,orderID) values(?,?,?,?,?,?,?)");
stmt.setString(1,wuliu);
stmt.setString(2, fuwu);
stmt.setString(3,zhiliang);
stmt.setString(4,comment);
stmt.setString(5,image);
stmt.setString(6,loginName);
stmt.setInt(7,orderID);
stmt.executeUpdate();
stmt.clearParameters();
stmt.close();
conn.close();
myFile.saveAs(fileurl,SmartUpload.SAVE_PHYSICAL);//保存上传的文件到web服务器路径下
out.print("<script language='javascript'>alert('评论成功');window.location.href='lookat.jsp';</script>");
}

}
}catch (Exception e){
out.print(e.toString());
}
%>
%>
</body>
</html>