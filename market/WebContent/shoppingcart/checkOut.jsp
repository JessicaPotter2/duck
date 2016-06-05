
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <jsp:directive.page import="java.text.DecimalFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<SCRIPT language=JavaScript type=text/JavaScript>
<!--

-->
</SCRIPT>
</head>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<center><img src="../images/header.jpg"/></center>
<a href="../index.jsp">回到主页</a>
<TABLE cellSpacing=0 cellPadding=0 width=576 align=center border=0>
	<TBODY>
		<TR vAlign=top>			
			<TD>
		<form method="post" action="../orderservlet" >
			<table cellspacing=1 cellpadding=4 width="92%" border=0
				align="CENTER" bgcolor="#c0c0c0">
				
				<tr bgcolor="#dadada">
					<td colspan="5" height="25" align=center><font color="#000000">请确认支付和配送信息</font></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" align="RIGHT"><font color="#000000">收货人：</font></td>
					<td colspan=4 width="78%">
						<input type="text" name="name" size="46" maxlength="20">
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" align="RIGHT"><font color="#000000">送货地址：</font></td>
					<td colspan=4 width="78%">
					<input type="text" name="addr" size="46" maxlength="200">
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" align="RIGHT"><font color="#000000">邮政编码：</font></td>
					<td colspan=4 width="78%">
					<input type="text" name="zip" size="46" maxlength="6">
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" height="31" align="RIGHT"><font
						color="#000000">联系电话：</font></td>
					<td colspan=4 width="78%" height="31"><input type="text"
						name="tel" size="46" maxlength="13"></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" align="RIGHT"><font color="#000000">电子邮件：</font></td>
					<td colspan=4 width="78%"><input type="text" name="email"
						size="46" maxlength="50"></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" align="RIGHT"><font color="#000000">支付金额：</font></td>
					<td colspan=4 width="78%">
					<%
						double total=((Double)session.getAttribute("total")).doubleValue();
						out.println(new DecimalFormat("0.00").format(total));
					 %>
					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" height="31" align="RIGHT"><font
						color="#000000">配送方式：</font></td>
					<td colspan=4 width="78%" height="31">
					<table width='100%' border='0' cellpadding='3' cellspacing='1'
						bgcolor='#c0c0c0'>
						<tr bgcolor='#ffffff'>
							<td align='center' width='20'><input type='radio'
								name='sendradio' value='普通快递'></td>
							<td nowrap><font color='#000000'>&nbsp;普通快递&nbsp;</font></td>
							<td><font color='#000000'>10起包邮</font></td>
						</tr>
					</table>

					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" height="36" align="RIGHT"><font
						color="#000000">支付方式：</font></td>
					<td colspan=4 width="78%" height="36">
					<table width='100%' border='0' cellpadding='3' cellspacing='1'
						bgcolor='#c0c0c0'>
						<tr bgcolor='#ffffff'>
							<td align='center' width='20'><input type='radio'
								name='payradio' value='paied'></td>
							<td nowrap><font color='#000000'>&nbsp;网上支付&nbsp;</font></td>
							<td align='center' width='20'><input type='radio'
								name='payradio' value='unpaied'></td>
							<td nowrap><font color='#000000'>&nbsp;暂不支付&nbsp;</font></td>
							<td><font color='#000000'>全国范围内通用</font></td>
						</tr>
					</table>

					</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td width="22%" height="31" align="right"><font
						color="#000000">订单附言：</font></td>
					<td colspan=4 width="78%" height="31"><textarea name="notice"
						cols="45" rows="6"></textarea></td>
				</tr>
				<tr bgcolor="#dadada">
					<td colspan="5" height="12" align="center"><input type=submit
						value="确认以上信息无误,提交" name=Submit></td>
				</tr>
			</table>
		</form>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</BODY>
</html>