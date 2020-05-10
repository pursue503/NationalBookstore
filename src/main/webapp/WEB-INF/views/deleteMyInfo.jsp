<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../../resources/styles/deleteMyInfo.css">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap" rel="stylesheet">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script src="https://kit.fontawesome.com/201657538f.js" crossorigin="anonymous"></script>

</head>
<body>
 <div class="title">
        <h3> 회원 탈퇴 </h3>
    </div>

    <div class="wrapper">
        <h3> 서재 이용 현황 </h3>
        <div class="useInfo">
            <p>지혜로운 셀럽 님의 서재</p>
            <ul>
                <li><strong>서재에 기록된 도서</strong> <span>0 권</span></li>
                <li><strong>서재에 기록된 포스트</strong><span>0 개</span></li>
                <li><strong>적립된 마일리지</strong><span>0 마일리지</span></li>
                <li><strong>종이책 결제 건수</strong><span>0 권</span></li>
            </ul>
            

        </div>
         <!-- useInfo end -->
        
        <hr class="line"> 
        <div class="inner">
        <p class="chkDelete"> 탈퇴 회원 유의 사항 </p>
        <ul>
            <li> 탈퇴를 해도 다른 사람이 스크랩한 고객님의 포스트와 직접 작성하신 댓글은 자동 삭제되지 않습니다. 
                노출을 원치 않으실 경우 탈퇴 전 삭제 하시기 바랍니다.
            </li>
            <li>
                탈퇴를 하실 경우, 어떤 경우에도 기존 서재의 대한 복구는 불가능하며, 로그인이 필요한 모든 서비스를 이용하실 수 없습니다.
            </li>
            <li>
                탈퇴를 하실 경우 계정과 함께 마일리지가 소멸됩니다. 원치 않으실 경우, 마일리지 이용 후 탈퇴해 주시기 바랍니다.
            </li>
            <li>
                탈퇴를 하실 경우 기 결제하신 서비스 이용 권한과 구매 내역을 포기하는 것으로 간주됩니다. 원치 않으실 경우, 탈퇴를 보류해주세요.
            </li>
        </ul>
    </div>

    <div class="lastChkBtn">
    <label for="agreeBtn"><input type="checkbox" name="agreeBtn" id="agreeBtn">
        <span> 회원 탈퇴에 관한 모든 내용을 숙지하였고, 회원 탈퇴를 신청합니다. </span>
    </label>

    </div>
    <div class="finishBtn">
        <button type="button" id="doLater">나중에 하기</button>
        <button type="button" id="goRightNow" onclick="location.href='deleteNext.jsp'">계속 진행하기</button>

    </div>

    </div>
    <!-- wrapper end -->
</body>
</html>