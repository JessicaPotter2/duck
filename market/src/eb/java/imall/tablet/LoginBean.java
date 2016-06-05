package eb.java.imall.tablet;

public class LoginBean {
public int userID;
private String loginName;
private String loginPass;
public LoginBean(){
}
public LoginBean(int userID,String loginName,String loginPass){
	this.userID=userID;
	this.loginName=loginName;
	this.loginPass=loginPass;
}
public int getUserID(){
	return userID;
}
public void setUserID(int userID){
	this.userID=userID;
}
public String getLoginName(){
	return loginName;
}
public void setLoginName(String loginName){
	this.loginName=loginName;
}
public String getLoginPass(){
	return loginPass;
}
public void setLoginPass(String loginPass){
	this.loginPass=loginPass;
}
}
