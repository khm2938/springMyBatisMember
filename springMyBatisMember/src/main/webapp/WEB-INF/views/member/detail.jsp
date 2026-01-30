<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세정보</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; padding: 50px 20px; margin: 0; }
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 600px; }
    h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; font-size: 24px; border-bottom: 2px solid #f1f3f5; padding-bottom: 20px; }

    /* 세로 배열을 위한 테이블 스타일 */
    .info-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
    .info-table th { 
        width: 30%; text-align: left; padding: 15px; background-color: #fcfcfc; 
        border-bottom: 1px solid #eee; color: #495057; font-weight: bold; 
    }
    .info-table td { width: 70%; padding: 15px; border-bottom: 1px solid #eee; color: #333; }

    /* 권한 태그(배지) 스타일 */
    .auth-badge { 
        display: inline-block; background-color: #e7f5ff; color: #1971c2; 
        padding: 5px 12px; border-radius: 20px; font-size: 12px; font-weight: bold; margin-right: 5px; 
    }

    .btn-area { display: flex; justify-content: center; gap: 10px; margin-top: 30px; }
    .btn { padding: 12px 25px; border: none; border-radius: 6px; font-size: 14px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: 0.2s; }

    .btn-modify { background-color: #007bff; color: white; }
    .btn-delete { background-color: #dc3545; color: white; }
    .btn-list { background-color: #6c757d; color: white; }
    .btn:hover { opacity: 0.8; transform: translateY(-1px); }
</style>
</head>
<body>

<div class="container">
    <h2>회원 상세정보</h2>
    
    <table class="info-table">
        <tr>
            <th>번호</th>
            <td>${member.no}</td>
        </tr>
        <tr>
            <th>아이디</th>
            <td>${member.id}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td style="color: #e64980; font-weight: bold;">${member.pw}</td>
        </tr>
        <tr>
            <th>회원이름</th>
            <td>${member.name}</td>
        </tr>
        <tr>
            <th>보유 권한</th>
            <td>
                <c:choose>
                    <c:when test="${not empty member.authList}">
                        <c:forEach items="${member.authList}" var="authItem">
                            <span class="auth-badge">${authItem.auth}</span>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <span style="color: #adb5bd;">권한 없음</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>가입일</th>
            <td><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </table>

    <div class="btn-area">
        <a href="/member/updateForm?no=${member.no}" class="btn btn-modify">회원정보 수정</a>
        <button type="button" class="btn btn-delete" onclick="deletePost(${member.no})">회원탈퇴</button>
        <a href="/member/memberList" class="btn btn-list">목록으로</a>
    </div>
</div>

<script>
    function deletePost(no) {
        if(confirm("정말로 탈퇴하시겠습니까? 관련 권한 정보도 함께 삭제됩니다.")) {
            location.href = "/member/delete?no=" + no;
        }
    }
</script>

</body>
</html>