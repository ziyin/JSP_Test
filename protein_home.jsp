<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>蛋白質搜尋</title>

<script>
	function openfile() {
		var formObj = document.getElementById('Dataform');
		formObj.submit();
<%Date dNow = new Date();
SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");

Runtime runtime = Runtime.getRuntime();
Process process;
String OutPutdata = "";
try {
	String resiData = ft.format(dNow);
	process = runtime.exec("cmd.exe /c C:\\Users\\ziyin\\Desktop\\test.bat");

	OutputStream stdin = process.getOutputStream();
	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin));
	writer.write(resiData);
	writer.flush();
	writer.close();
	process.waitFor();

	String Path = "C:\\Users\\ziyin\\Desktop\\file\\" + resiData + ".txt";
	FileReader FR = new FileReader(Path);
	BufferedReader br = new BufferedReader(FR);
	StringBuffer strB = new StringBuffer();

	String str = br.readLine();
	while (str != null) {
		OutPutdata += str;
		str = br.readLine();
	}

	br.close();
	FR.close();

} catch (IOException e) {
	e.printStackTrace();
}%>
	}
</script>
</head>
<body>
	<jsp:include page="NavigationBar.jsp" />
	<form id="Dataform">
		<input type="text" name="EnterData">
	</form>
	<input type="submit" value="Enter" name="send" onclick="openfile()">
	<h1><%=OutPutdata%></h1>
</body>
</html>