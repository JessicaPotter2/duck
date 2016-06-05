<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.io.*,eb.java.imall.DbUtil"%>
    <%@ page import="com.jspsmart.upload.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片</title>
</head>
<body>
<center><img src="../images/header2.jpg"/></center>
<a href="../myTree.jsp">返回商品管理界面</a>
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
window.location='upload.jsp';
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
String goodsImage=url+filename+"."+fileExt;
String goodsID=su.getRequest().getParameter("goodsID");
//Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//ResultSet rs=stmt.executeQuery( "select * from addgoods where goodsID='"+goodsID+"'");
PreparedStatement stmt=conn.prepareStatement("insert into goodsImage(goodsID,goodsImage) values(?,?)");
	stmt.setString(1,goodsID);
	stmt.setString(2, goodsImage);
//rs.first();
//rs.updateString(5, goodsImage);
//rs.updateRow();
stmt.executeUpdate();
	stmt.clearParameters();
stmt.close();
conn.close();
myFile.saveAs(fileurl,SmartUpload.SAVE_PHYSICAL);//保存上传的文件到web服务器路径下
out.print("<script language='javascript'>alert('成功上传');window.location.href='upload.jsp';</script>");


}

}
}catch (Exception e){
out.print(e.toString());
}
%>

</body>
</html>