<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
/* 공통 스타일 유지 */
body {
	font-family: 'Malgun Gothic', sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	padding: 50px 20px;
	margin: 0;
}

.container {
	background: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	width: 100%;
	max-width: 900px;
}

h2 {
	color: #2c3e50;
	text-align: center;
	margin-bottom: 30px;
	font-size: 24px;
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #eee;
}

th {
	background-color: #fcfcfc;
	color: #495057;
	font-weight: bold;
}

tr:hover {
	background-color: #f1f3f5;
	cursor: pointer;
}

/* 제목 왼쪽 정렬 */
.text-left {
	text-align: left;
	padding-left: 20px;
}

/* 버튼 스타일 */
.btn-area {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}

.btn-write {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.2s;
}

.btn-write:hover {
	background-color: #0056b3;
}

/* Search Bar Styles - 기존 게시판 스타일과 통일 */
.search-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.search-form {
	display: flex;
	background: #ffffff;
	border: 1px solid #ced4da; /* 테이블 경계선과 비슷한 색상 */
	border-radius: 6px;
	overflow: hidden;
	transition: border-color 0.2s, box-shadow 0.2s;
}

/* 포커스 되었을 때 글쓰기 버튼 색상과 통일 */
.search-form:focus-within {
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
}

.search-select {
	background: #f8f9fa;
	color: #495057;
	border: none;
	border-right: 1px solid #ced4da;
	outline: none;
	padding: 8px 15px;
	font-size: 14px;
	cursor: pointer;
}

.search-input {
	background: transparent;
	border: none;
	color: #495057;
	padding: 8px 15px;
	width: 200px;
	outline: none;
	font-size: 14px;
}

.btn-search {
	background-color: #f8f9fa;
	border: none;
	border-left: 1px solid #ced4da;
	color: #007bff;
	font-weight: bold;
	cursor: pointer;
	padding: 0 20px;
	transition: background-color 0.2s;
}

.btn-search:hover {
	background-color: #e9ecef;
	color: #0056b3;
}

/* 게시글 번호 등 강조 */
.no-data {
	padding: 50px;
	color: #adb5bd;
}
</style>
</head>
<body>

	<div class="container">
		<h2>회원 목록</h2>
		<div class="search-container">
			<form action="/member/search" method="get" class="search-form">
				<select name="searchType" class="search-select">
					<option value="id">아이디</option>
					<option value="name">회원이름</option>
				</select> <input type="text" name="keyword" class="search-input"
					placeholder="검색">
				<button type="submit" class="btn-search">SEARCH</button>
			</form>
		</div>
		<table>
			<thead>
				<tr>
					<th style="width: 10%;">NO</th>
					<th style="width: 20%;">ID</th>
					<th style="width: 20%;">PW</th>
					<th style="width: 20%;">NAME</th>
					<th style="width: 20%;">REGDATE</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty memberList}">
						<c:forEach var="member" items="${memberList}">
							<%-- 행 전체 클릭 시 상세 페이지로 이동 --%>
							<tr onclick="location.href='/member/detail?no=${member.no}'">
								<td>${member.no}</td>
								<td class="text-left">${member.id}</td>
								<td class="text-left">${member.pw}</td>
								<td class="text-left">${member.name}</td>
								<td><fmt:formatDate value="${member.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<%-- 컬럼 개수에 맞춰 colspan을 5로 수정 --%>
							<td colspan="5" class="no-data">등록된 회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div class="btn-area">
			<a href="/member/memberList" class="btn-write">회원목록</a> <a
				href="/member/insertForm" class="btn-write">회원등록</a>
		</div>
	</div>

</body>
</html>