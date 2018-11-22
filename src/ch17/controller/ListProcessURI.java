package ch17.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch17.model.MemberDBBean;

public class ListProcessURI implements CommandProcess{
	
	@Override
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable{
		MemberDBBean db = MemberDBBean.getInstance();
		request.setAttribute("members", db.getList());
		return "/20181114/list.jsp";
	}
}
