<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String result="---------------------<br>";
		String realFolder="";
		String saveFolder="/20181107upload";
		String encType="utf-8";
		int maxSize=5*1024*1024;
		
		ServletContext context=getServletContext();
		realFolder=context.getRealPath(saveFolder);
		
		try{
			MultipartRequest upload=null;
			
			upload=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
			
			Enumeration<?> params=upload.getParameterNames();
					
					while(params.hasMoreElements()){
						String name=(String)params.nextElement();//파라미터 명
						String value=upload.getParameter(name);//파라미터 값
						result+=name+":"+value+"<br>";//결과 문자열 누적
					}
			Enumeration<?> files=upload.getFileNames();
			while(files.hasMoreElements()){
				String name=(String)files.nextElement();
				//서버에 업로드 된 파일명
				String filename=upload.getFilesystemName(name);
				//원래 파일 명
				String original=upload.getOriginalFileName(name);
				//업로드된 파일의 타입-파일 종류
				String type=upload.getContentType(name);
				
				//결과 문자열 누적
				result+="파라미터 이름 : "+name+"<br>";
				result+="실제 파일 이름 : "+original+"<br>";
				result+="저장된 파일 이름 : "+filename+"<br>";
				result+="파일 타입 : "+type+"<br>";
				
				//업로드된 파일의 정보를 얻어내기 위해 File 객체로 생성
				File file=upload.getFile(name);
				if(file!=null)
					result+="크기:"+file.length()+"bytes <br>";//파일 크기
			}
			result+="---------------------<br>";
			out.println(result);//처리 결과를 반환
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>