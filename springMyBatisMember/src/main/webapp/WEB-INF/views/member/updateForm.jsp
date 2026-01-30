<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); width: 100%; max-width: 550px; }
    
    h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; font-size: 24px; border-bottom: 2px solid #eee; padding-bottom: 15px; }
    
    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: 600; color: #495057; }
    
    /* 입력 필드 및 셀렉트 박스 스타일 */
    input[type="text"], input[type="password"], select {
        width: 100%; padding: 12px; border: 1px solid #ced4da; border-radius: 6px; box-sizing: border-box; font-size: 14px; margin-bottom: 10px;
    }
    input:focus, select:focus { outline: none; border-color: #4dabf7; box-shadow: 0 0 0 3px rgba(77, 171, 247, 0.2); }

    /* 권한 선택 영역 스타일 */
    .auth-title { font-size: 14px; font-weight: bold; color: #666; margin-bottom: 10px; display: block; }
    .auth-select-group { background: #f1f3f5; padding: 15px; border-radius: 8px; }

    /* 버튼 영역 */
    .btn-area { display: flex; gap: 10px; margin-top: 30px; }
    .btn { flex: 1; padding: 13px; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: 0.2s; }
    
    .btn-submit { background-color: #007bff; color: white; }
    .btn-cancel { background-color: #ffc107; color: #212529; }
    .btn-list { background-color: #343a40; color: white; }
    .btn:hover { opacity: 0.8; }
</style>
</head>
<body>

    <div class="container">
        <h2>${member.name}님 정보 수정</h2>
        <form action="/member/update" method="post">
            <input type="hidden" name="no" value="${member.no}">

            <div class="form-group">
                <label>아이디</label>
                <input type="text" value="${member.id}" readonly style="background-color: #e9ecef;">
            </div>

            <div class="form-group">
                <label for="pw">비밀번호 변경</label> 
                <input type="password" id="pw" name="pw" value="${member.pw}" required>
            </div>

            <div class="form-group">
                <label for="name">이름 변경</label> 
                <input type="text" id="name" name="name" value="${member.name}" required>
            </div>

            <div class="form-group">
                <label class="auth-title">권한 설정 (최대 3개)</label>
                <div class="auth-select-group">
                    <c:forEach var="i" begin="0" end="2">
                        <select name="authList[${i}].auth">
                            <option value="">=== 권한 선택 없음 ===</option>
                            <option value="ROLE_USER" ${member.authList[i].auth == 'ROLE_USER' ? 'selected' : ''}>사용자</option>
                            <option value="ROLE_MEMBER" ${member.authList[i].auth == 'ROLE_MEMBER' ? 'selected' : ''}>회원</option>
                            <option value="ROLE_ADMIN" ${member.authList[i].auth == 'ROLE_ADMIN' ? 'selected' : ''}>관리자</option>
                        </select>
                    </c:forEach>
                </div>
            </div>

            <div class="btn-area">
                <button type="submit" class="btn btn-submit">수정 완료</button>
                <button type="reset" class="btn btn-cancel">초기화</button>
                <a href="/member/memberList" class="btn btn-list">목록으로</a>
            </div>
        </form>
    </div>

</body>
</html>