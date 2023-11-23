<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>

<%
String sql = "select p_no, p_name, substr(p_birth, 1, 4) ||'년'||"
+ " substr(p_birth, 5, 2) ||'월'|| substr(p_birth, 7, 2) ||'일' as 생년월일," 
+ " case p_gender  when 'M' then '남' when 'F' then '여' end as p_gender, p_tel1 || '-' || p_tel2 || '-' || p_tel3 as 전화번호,"
+ " case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as p_city"
+ " from TBL_PATIENT_202004";

Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
		<jsp:include page="./layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="./layout/nav.jsp"></jsp:include>
	</nav>
	<section class = "section">
	<h2>환자조회</h2>
	<table class = "table_line">
		<tr>
			<th>환자번호</th>
			<th>환자성명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>지역</th>
		</tr>
		<%while(rs.next()) { %>
		<tr>
		<td><%=rs.getString("p_no") %></td>
		<td><%=rs.getString("p_name") %></td>
		<td><%=rs.getString("생년월일") %></td>
		<td><%=rs.getString("p_gender") %></td>
		<td><%=rs.getString("전화번호") %></td>
		<td><%=rs.getString("p_city") %></td>
		
		</tr>
		<% } %>
	</table>
	</section>
	<footer>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>