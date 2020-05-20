<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>    
    <script src="https://kit.fontawesome.com/201657538f.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../../resources/styles/myLibrary.css">
    <link rel="stylesheet" href="../../resources/styles/reset.css">
    <link rel="stylesheet" href="../../resources/styles/common.css">
    <script src="../../resources/js/common.js"></script>

</head>
<body>
    <header class="topbar">
        <nav>
          <div class="container">
            <a href="javascript: history.back();"><i class="far fa-arrow-left"></i></a>
            <h2>내 서재</h2>
          </div>
        </nav>
      </header>
<div class="wrapper">
<div class="firstColumn">
<!-- 배경화면 넣는곳 -->
<div class="follow">
   	<c:if test="${checkId}">
   		<button type="button" id="followBtn"> <i class="fas fa-plus-circle"></i> 팔로우 </button>
   	</c:if>    
  </div>
<div class="bigbox">
<div class="myImage"> 
    <a href="#modalGo" id="modalOpen"><img id="myFaceImage" src="${pageContext.request.contextPath }/resources/images/myLibrary/picture1.png" ></a>   
</div>
<div class="myNickname">
		<c:choose>
			<c:when test="${checkId}"> <a> 다른사람<%-- ${ryanMember.memberNickName } --%> </a> 님의 서재  </c:when>
			<c:otherwise><a>  ${ryanMember.memberNickName }  </a> 님의 서재 </c:otherwise>
		</c:choose>
</div>
</div>
<div class = "manyBtn">
    <ul>
        <li><a href="#"> 읽은 책 <b>( ${readbookcount } )</b> </a></li>
        <li><a href="#"> 좋아요 <b>( ${likeBookcount } )</b> </a></li>
        <li><a href="#"> 팔로우 <b>( ${myFollower} )</b> </a></li>
    </ul>
</div>
<div class="goSubscribe">
<c:if test="${checkId}">
<a href="goSubscribe.jsp"> 
  <b> 정기구독 시작 </b><br>
  <em> 바로가기 </em> 
  <i class="fas fa-arrow-circle-right"></i>
</a>
</c:if>
    
</div>

</div>
<!-- firstColumn end -->

<div class="secondColumn">
    <input type="radio" name="myPage" id="mybook" checked><label for="mybook"> 내 책</label>
    <input type="radio" name="myPage" id="mybookcart"><label for="mybookcart">책장</label>
    <input type="radio" name="myPage" id="mypost"><label for="mypost">포스트</label>
    
    <div class="content one">
        <div class="mybookTitle">
            <a> ${readbookcount} </a> 권의 도서
        </div>
         <c:choose>
          <c:when test="${readbooklist.size() >0 }">
        <div class="myBookbook">
          <ul>
            <c:forEach var="readbook" items="${readbooklist}">
            	<li>
              	<a href="#">
              	<div class="books"> 
             
              	<div class="mybookimage">
                   <a href="/book/bookdetail?booknumber=${readbook.bookNum }"> 
                   	<img src="${pageContext.request.contextPath }${readbook.bookThumbnail }" alt="없음">	
                   </a>
              	</div>
              	<div class="names">
                <strong>${readbook.bookTitle}</strong> <br>
                <span>${readbook.bookWriter}</span> 
              	</div>
              	</div> <!-- books end -->
           		 </a>
            	</li>
          	</c:forEach>
          </ul>
   		 </div> <!-- myBookbook end -->  
   		 </c:when>     
           	<c:otherwise>
           		 <div class="mybook_Content">
        	   <span> <i class="fas fa-books"></i></span>
        	    	서재에 등록된 도서가 없습니다
      		     </div>
           	</c:otherwise>
          </c:choose>  	
        </div>
           <div class="content two">
        <div class="mybookTitle">
            <a>${libcount}</a> 개의 책장
        </div>
    
        <div class="ebooks">
            <div class="listTitle">
              <strong> 찜 목록 </strong> 
            </div>
            <div class="totalBtn">
           	  <c:if test="${checkId}">
              <label for="allChk">
              <input type="checkbox" name="allChk" id="allChk"> 전체선택
              </label>    
              <button type="button" id="allDelete"> 삭제 </button>   
              </c:if>   
            </div>
            <div class="ebookList"> 
                 <c:choose>
                     <c:when test="${libbooklist.size() >0 }">
                  <table>
                         <c:forEach var="book" items="${libbooklist}">
                          
                          <tr>
                  <td><input type="checkbox" name="chkbox" id="chkbox" value="${book.bookNum }"></td>
                  <td>
                     <a href="/book/bookdetail?booknumber=${book.bookNum }"> 
                  		<img src="${pageContext.request.contextPath }${book.bookThumbnail }" alt="없음">
                  	</a>
                  </td>
                  <td>
                    <ul>
                      <li> <strong>${book.bookTitle}</strong> </li>
                      <li> <a>${book.bookWriter} 지음</a>  </li>
                      <li> <span>${book.bookPublisher}</span></li>
                    </ul>
                  </td>
                <c:if test="${checkId}">
                  <td><button type="button" id="goRead">바로보기</button>
                  <a href="/booklist/deleteLibList?booknum=${book.bookNum }" id=eachDelete>삭제</a></td>
                  </c:if>
                </tr>
                       </c:forEach>   	
                       </table>		
                     </c:when>        
                     <c:otherwise>
                         <span> <i class="fas fa-books"></i></span>
                              찜한 도서가 없습니다. 
                       <!-- <button type="button" id=makeBookCart> <i class="fas fa-plus"></i> 새 책장 만들기 </button> -->
                     </c:otherwise>
             </c:choose>             
          </div>
    </div>
    </div>
     <div class="content four">

        <div class="mybookTitle">
        	   나의 포스트 <a>0</a> 개
        </div>
        <div class ="postInputBtn">
        <button type= "button" id = postInput onclick="openNewPost()"> <i class="fas fa-pencil-alt"></i> 포스트 작성</button>
        </div>
            
        <div class="myPostCheck" id="myPostCheck">
        <c:choose>
          <c:when test="${myreviewlist.size() >0 }">
          <table>
          <c:forEach var="review" items="${myreviewlist}">
                <tr>
                    <th> 도서명 </th>
                    <th> 내용 </th>
                    <th> 등록날짜 </th>
                </tr>
                <tr>
                	<td><b>${review.reviewTitle}</b><td>
                    </td>
                    <td>
                    	<textarea name="postText" id="postText" readonly>  
                            ${review.reviewContent}
                        </textarea>
                    </td>
                    <td>${review.reviewRegdate}<td>
                </tr>
               </c:forEach>
            </table>
            </c:when>
		</c:choose>
            <%-- <table>
                <tr>
                    <th> 도서명 </th>
                    <th> 별점 </th>
                    <th> 등록날짜 </th>
                </tr>
                <tr>
                    <td> 달빛 마신 마녀 </td>
                    <td> ★★★★☆ </td>
                    <td> ${reviewRegdate} </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="text" name="postTitleChk" id="postTitleChk" 
                        value="${reviewTitle}" readonly>     
                        <textarea name="postText" id="postText" readonly>  
                            ${reviewContent}
                        </textarea>
                    </td>
                </tr>
            </table> --%>
        </div>
        <div class="postInsert" id="postInsert">
            <select name="bookSelect" id="bookSelect">
                <option value="bookChoice"> ===== 책선택 ===== </option>
                <option value="bookChoice"> book1 </option>
                <option value="bookChoice"> book2 </option>
            </select>
            <div class ="bookStarScore">
                <b>별점 등록</b>     
                <span><i class="fas fa-star"></i></span>
                <span><i class="fas fa-star"></i></span>
                <span><i class="fas fa-star"></i></span>
                <span><i class="fas fa-star"></i></span>
                <span><i class="fas fa-star"></i></span>
                <span id=starScore> 0 </span> 점
            </div>
            <div class="postImgFile">  
                <input type="file" name="postImageFile" id="postImageFile" onchange="uploadImg(this);">
                    <div class="postImage" id="postImage">
                        <img id ="imgimg" width=200>
                    </div>
                    
            </div>

            <input type="text" name="postTitle" id="postTitle" placeholder="제목을 입력하세요">
            <textarea name="post_Content" id="post_Content" placeholder="솔직한 생각을 입력해주세요."></textarea>
            
            <div class="postEndBtn">
                <button type="button" id="postSave"> 저장 </button>
                <button type="button" id="postCancel"> 취소 </button>
            </div>
       
        </div>
   	 </div>
        </div>
   
 
</div>

<script>
$(document).ready(function(){
	
	$("#allDelete").on('click',function(){
		var array = [];
		$("input[name=chkbox]:checked").each(function(){
			array.push($(this).val());
		});
		alert(array);
		$.ajax({
			url:"/booklist/deleteLibList",
			type:"post",
			traditional:true,
			data:{
				booknum:array
			},
			success:function(data){
				if(data==null || data == ""){
					console.log("컨트롤러에서 받은 배열 : "+data);
					
				}else{
					console.log("컨 : "+data);
				}
			},
			error:function(){
				alert("에러");
			}
		});
	});	
});


</script>
    <script>
$(function() {

$('.bookStarScore span').click(function() {
  var starNum = $(this).index() +1;
  $('.bookStarScore span').css({color:'#979797'});
  $('.bookStarScore span:nth-child(-n+'+starNum+')').css({color:'#f1c40f'});
  $('#starScore').html(starNum-1);
});

});
    </script>
    <script>    
        function openNewPost() {          
            var openP = document.getElementById('postInsert');
            var postChk = document.getElementById('myPostCheck');
            if (openP.style.display == 'none') {
                openP.style.display ='block';
                postChk.style.display = 'none';
            }else {          
                openP.style.display ='none';
                postChk.style.display = 'block';              
            }
        }
    </script>

    <script>
        function uploadImg(here) {
            if(here.files && here.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#imgimg').attr('src', e.target.result);
                }
                reader.readAsDataURL(here.files[0]);
            }
        }
    </script>

 <script>
  var $allChk = $('#allChk');
  $allChk.change(function () {
      var $this = $(this);
      var checked = $this.prop('checked');
      $('input[name="chkbox"]').prop('checked', checked);
  });
</script> 

<script>
  var modal = document.getElementById('modalGo');
  var openBtn = document.getElementById('modalOpen');
  var closeBtn = document.getElementsByClassName('close')[0]; 
  openBtn.onclick = function() {
     modal.style.display = "block";
  }
  closeBtn.onclick = function() {
    modal.style.display = "none";
  }
 window.onclick = function(event){
     if(event.target==modal) {
         modal.style.display = "none";
 
     }
 }
 </script>

 <script>
    $(document).ready(() => {
      const li = document.querySelector('footer.fixed a[href="myLibrary.jsp"]').parentElement;
      const ul = li.parentElement;
      [ul, li].forEach(element => element.classList.add('active'));
    });
  </script>
  <script>
  
  function allDelte(){
	  location.href = "/booklist/allDelte";
  }
  
  </script>
<%@ include file="template/footer.jsp" %>
</body>
</html>