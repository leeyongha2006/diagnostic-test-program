# diagnostic-test-program
진단검사 프로그램
## 홈화면
![image](https://github.com/leeyongha2006/diagnostic-test-program/assets/126844590/9989830d-7171-4fb6-88dd-324504db2201)

## 환자조회
![image](https://github.com/leeyongha2006/diagnostic-test-program/assets/126844590/00b3a78e-0b27-44de-859e-90d9eb67bf6e)
``` sql
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
```
#### DB에 있는 값을 나타낼 쿼리문을 작성한다
``` html
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
```
#### rs에 값이 있다면 rs에 저장된 값을 테이블에 표시한다
# 검사결과입력
![image](https://github.com/leeyongha2006/diagnostic-test-program/assets/126844590/57be47ce-e0d8-4b95-9217-428be23271d9)

