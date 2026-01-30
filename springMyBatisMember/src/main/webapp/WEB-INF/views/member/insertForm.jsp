<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    /* 배경 및 레이아웃 */
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 500px; }
    
    h1 { color: #2c3e50; text-align: center; margin-bottom: 30px; font-size: 28px; }
    
    /* 폼 스타일 */
    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: 600; color: #495057; }
    input { 
        width: 100%; padding: 12px; border: 1px solid #ced4da; border-radius: 6px; box-sizing: border-box; transition: all 0.3s;
    }
    input:focus { outline: none; border-color: #007bff; box-shadow: 0 0 0 3px rgba(0,123,255,0.1); }

    /* 버튼 스타일 */
    .btn-area { display: flex; gap: 10px; margin-top: 30px; }
    .btn { 
        flex: 1; padding: 13px; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: 0.2s; 
    }
    
    /* 회원등록 버튼 - 파란색 (Submit) */
    .btn-submit { background-color: #007bff; color: white; }
    .btn-submit:hover { background-color: #0056b3; }

    /* 취소/리셋 버튼 - 노란색 (Reset) */
    .btn-reset { background-color: #ffc107; color: #212529; }
    .btn-reset:hover { background-color: #e0a800; }

    /* 목록 버튼 - 검은색 (Link) */
    .btn-list { background-color: #343a40; color: white; }
    .btn-list:hover { background-color: #23272b; }

    /* 에러 메시지 스타일 */
    .error-msg { color: #dc3545; background: #f8d7da; padding: 10px; border-radius: 6px; margin-bottom: 20px; text-align: center; font-size: 14px; }
</style>
</head>
<body>

<div class="container">
    <h1>회원가입</h1>

    <%-- 컨트롤러에서 에러가 발생해서 돌아왔을 때 메시지 출력 --%>
    <c:if test="${not empty Message}">
        <div class="error-msg">${Message}</div>
    </c:if>

    <form action="/member/insert" method="post">
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" placeholder="사용할 아이디를 입력하세요" required>
        </div>
        
        <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요" required>
        </div>
        
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
        </div>
        
        <div class="btn-area">
            <button type="submit" class="btn btn-submit">회원등록</button>
            
            <button type="reset" class="btn btn-reset">초기화</button>
            
            <a href="/member/memberList" class="btn btn-list">회원리스트</a>
        </div>
    </form>
</div>

</body>
</html>