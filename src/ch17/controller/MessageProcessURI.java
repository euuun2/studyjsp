package ch17.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcessURI implements CommandProcess{
	
	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable{
		request.setAttribute("message", "��û URI�� ��ɾ ����");
		return "/20181108/process.jsp";
	}
}
