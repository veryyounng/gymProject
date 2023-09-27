# 💪🏻 헬스장 웹 페이지 만들기(팀 프로젝트) 🥇🥈🥉
총 6명이서 진행한 프로젝트이며 
헬스장 소개 및 예약, 스케줄 관리, 쪽지기능, 게시판 , 댓글기능을 포함한 웹 페이지 입니다.  

#### 👩🏻‍💻담당 업무👩🏻‍💻
- 자유게시판 CRUD 작업의 FEBE 수행
- 자유게시판 댓글 작성, 수정, 삭제, 페이징(AJAX)
- 로그인, 로그아웃 구현
- 아이디 찾기
- 비밀번호 찾기

#### 📚기술스택📚
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7Df1E?style=flat&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"/>  
<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white"/> <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat&logo=Visual Studio Code&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/>
<img src="https://img.shields.io/badge/Discord-5865F2?style=flat&logo=Discord&logoColor=white"/>  
<img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat&logo=Apache Tomcat&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/>  


## 주제 선정 이유  
- 코로나 시국으로 운동에 대한 관심 증가하면서 회원간 쪽지 기능과 운동 커뮤니티를 활성화 시키자!
- 집에서 편리하게 GX룸을 예약 할 수 있게 하자!  

## 주요 기능
- 각종 커뮤니티 게시판 
- 원하는 날짜에 GX룸 예약기능 개발  
- 회원 간 쪽지 기능 구현 

## USECASE
- 회원  
    - 회원가입, 각종 커뮤니티 게시판 글쓰기 및 댓글을 등록, 수정, 삭제 할 수 있다.  
    - 원하는 날짜에 GX룸 스케줄을 조회, 예약, 취소, 조회 할 수 있다.  
    - 회원 정보 수정 및 탈퇴 할 수 있고 내가 쓴 글, 댓글을 조회 할 수 있다.  
- 관리자
    - 공지사항 게시판 글쓰기 등록, 삭제 할 수 있다.
    - GX룸 스케줄을 등록, 삭제 및 관리 할 수 있다.

## ERD
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/ff40b7de-dc17-4b72-8b13-8411b6111675"/>
<br><br>

## Home 🏠
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/b57cea9c-87ec-4dee-ad9d-f32984db9863"/>
<br><br>

## 로그인 화면 
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/b6bd6da2-4c35-43c6-b1b2-34d722087216"/>
<br><br>

## 로그아웃 화면
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/8bc4bdd8-ca1c-4cdf-ab0f-ffe9a818d5d4"/>
<br><br>

## 아이디 찾기
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/d63405b6-506f-4e8d-9894-d404408baa53"/>
<br><br>

## 비밀번호 찾기
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/2cdd3de4-c96d-4540-912e-8f0edb1a60a5"/>
<br><br>

## 자유 게시판 기본화면
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/ade8e75f-00fd-4bba-a84f-91cca9cfd05c"/>
<br><br>

## 자유 게시판 글쓰기
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/2c7d5124-5364-40c9-a0ab-8ea20c83478f"/>
<br><br>

## 자유 게시판 상세페이지
<br><img src = "https://github.com/veryyounng/react_project/assets/121228672/803d4f57-cc44-450e-9c7f-23a1ef98334d"/>
<br><br>

## 로그인
<br>

- controller
```java
	@RequestMapping(value = { "/login", "/join", "id_find", "/pw_find" , "/changePw"}, method = RequestMethod.GET)
	public void replace() {
	}

//  로그인
	@PostMapping("/login")
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		UserVO loginUser = service.login(vo);
		if(loginUser == null) {
		
			ra.addFlashAttribute("loginfail", "F"); //null값이라면 다시 login 화면으로 이동
			return "redirect:/user/login";
		}
		else {
			req.getSession().setAttribute("loginUser", loginUser);
			if(messageService.newMsg(loginUser.getUserid()) == 0) {
				req.getSession().setAttribute("newMsg", "F");
			} else {
				req.getSession().setAttribute("newMsg", "T");
			}
			return "redirect:/";
		}
	}
```
- mapper
```mysql
	<!-- 로그인 -->
	<select id="login" resultType="com.gym.domain.UserVO">
		select * from user
		where userid = #{userid} and userpw = #{userpw}
	</select>
```
- jsp
```javascript
  function check(){
		let userid = $("#useridtext");
		let userpw = $("#userpwtext");
		if(userid.val() == ""){
			alert("아이디를 입력하세요.");
			userid.focus();
			return false;
		}
		if(userpw.val() == ""){
			alert("비밀번호를 입력하세요.");
			userpw.focus();
			return false;
		}
			return true;
	}
```
## 로그아웃
- controller
```java
@GetMapping("/logout")
	public String logout(HttpServletRequest req, RedirectAttributes ra) {
		HttpSession session = req.getSession();
		session.invalidate();
		ra.addFlashAttribute("logout", "T");
		return "redirect:/";
	}
```
## 아이디 찾기
- controller
```java
@PostMapping("/findedid")
	public @ResponseBody UserVO postFindId(@RequestParam("username") String username, @RequestParam("email") String email) throws Exception {
		UserVO result = service.findId(username, email);
		if(result == null) {
			return null;
		}
		return result;
	}
```
- mapper
```mysql
<select id="findId" resultType="com.gym.domain.UserVO">
		select * from user where username =#{username} and email =#{email}
	</select>
```
- jsp
```javascript
$('#submitbutton').on('click',function(){
		const name = $('#usernametext').val();
	 	const email = $('#useremailtext').val() + '@' + $('#domain-txt').val();
		console.log(name);
		console.log(email);
		$.ajax({
	        url:'findedid',
	        type:'POST',
	        data: {"username": name,
	        	   "email": email},
	        dataType : "json",
	        success:function(result){
	        	let addString = $('#idfindtable');
	        	console.log("에이젝스 성공");
	        	addString.empty();
	        	var str = "";
	        	if(result == null){
					str += '<div>';
					str += '아이디를 찾을 수 없습니다.';
					str += '</div>';
	        	} else {
	        		str += '<div>';
	               	str += '<span style="color:blue; font-weight:700;">"'+name + '"</span> 님의 아이디는 <span style="color:blue; font-weight:700;">"' + result.userid + '"</span> 입니다.';
	       			str += '</div>';
	        	}
				addString.append(str);
	        },
	        error: function(request, error){
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
	    });
	});
```
## 비밀번호 찾기
- controller
```java
//	비밀번호 변경 view 보여주기 post방식
	@PostMapping("/changePW_view")
	public String postChangePW_view(@RequestParam("username") String userid, Model model) throws Exception{
		model.addAttribute("userid", userid);
		return "/user/changePW";
	}
//	비밀번호 변경하기
	@PostMapping("/changePW")
	public String postChangePW(String userpw, String userid) throws Exception{
		service.changePW(userid, userpw);
		return "redirect:/user/login";
	}
```
- DAOImple.java
```java
//	비밀번호 찾을 때 회원 정보 찾기
	@Override
	public int findpw(String userid, String email) {
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("userid", userid);
		data.put("email", email);
		return sql.selectOne(namespace + ".findPw", data);
	}
//	비밀번호 변경
	@Override
	public void changePW(String userid, String userpw) throws Exception {
		HashMap<String, String> map =  new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		sql.update(namespace + ".changePW", map);
	}
```
## 자유게시판 페이징
- controller
```java
//게시물 목록, 갯수 세기
      @GetMapping("/freelist")
      public String getFreelist (String keyword, Model model,int num,String searchType) throws Exception{
        
       Page page = new Page();
       
       page.setNum(num);
       page.setCount(service.getSearchCnt(keyword,searchType));
       
       List<FreeBoardVO> list = service.getFreelist(keyword,searchType,page.getDisplayPost(), page.getPostNum());
       
        model.addAttribute("freelist", list);
        model.addAttribute("page",page);
        model.addAttribute("select", num);
        model.addAttribute("keyword", keyword);
        
         return "/board/freeboard_list";
      }
```
## 자유게시판 리스트 조회
- controller
```java
//게시물 조회
      @GetMapping ("/freedetail")
      public String getFreeDetail (String keyword, int b_num, Model model,int reply_num) throws Exception{
         service.freeViewCnt(b_num);
         //db에 거치면 viewCnt가 +1이 됨-> 메소드 종료시 , 밑줄이 실행됨
         
         FreeBoardVO vo = service.getFreeDetail(b_num);
         model.addAttribute("freedetail", vo);
         model.addAttribute("keyword", keyword);
         
         //댓글 조회
         ReplyPage page = new ReplyPage();
           page.setNum(reply_num);
           page.setCount(service.getReplyCnt(b_num)); // 이거는 b_num에 대한 reply 갯수
         
         List<ReplyVO> reply = null;
         reply = service.freeReplylist(b_num,page.getDisplayPost(), page.getPostNum());
         model.addAttribute("page",page);
         model.addAttribute("reply",reply);
         model.addAttribute("select", reply_num);
         
         return "/board/freeboard_detail";
      }
      
```
- mapper
```mysql
 <!-- 게시물 목록 보기 -->
   <select id="freeList" resultType="com.gym.domain.FreeBoardVO">
      select 
         b_num, b_title, b_writer, b_date, b_content, view_cnt
      from f_board 
      	<if test='searchType.equals("T")'>
   			where b_title like ('%${keyword}%') //제목필터분류
   		</if>
   		<if test='searchType.equals("C")'>
   			where b_content like ('%${keyword}%') //내용필터분류
   		</if>
   		<if test='searchType.equals("TC")'>
   			where b_title like ('%${keyword}%') 
   				or b_content like ('%${keyword}%') //제목+내용필터분류
   		</if>
      order by b_num desc limit #{displayPost}, #{postNum}
   </select>
```
## 자유게시판 글쓰기, 수정, 삭제
- controller
```java
//게시물 글쓰기 get 메소드
      @GetMapping("/freewrite")
      public String getFreeWrite() throws Exception{
        
         return "/board/freeboard_write";
      }

      //게시물 글작성 post 메소드
      @PostMapping("/freewrite")
      public String postFreeWrite(FreeBoardVO vo) throws Exception{
         service.freeWrite(vo);
         
         return "redirect:/free/freelist?searchType=T&keyword=&num=1";
      }
      
      //게시물 수정 get메소드
      @GetMapping("/freemodify")
      public String getFreeModify(@RequestParam("b_num") int b_num, Model model) throws Exception{
         
         FreeBoardVO vo = service.getFreeDetail(b_num);
         model.addAttribute("freedetail", vo);
         
         return "/board/freeboard_modify";
      }
      
      //게시물 수정 post 메소드
      @PostMapping("/freemodify")
      public String postFreeModify(FreeBoardVO vo) throws Exception{
         service.freeModify(vo);
         int b_num = vo.getB_num();
         return "redirect:/free/freedetail?reply_num=1&b_num="+b_num;
      }
      
      //게시물 삭제
      @PostMapping("/freedelete")
      public String getDelete(int b_num) throws Exception{
         service.freeDelete(b_num);
         return "redirect:/free/freelist?searchType=T&keyword=&num=1";
      }
```
▶️ url로 작성하고 수정하는 일이 발생하지 않게 get, post방식 모두 구현함 <br>

## 자유게시판 댓글 수정
- controller
```java
//댓글 수정 뷰
      @PostMapping("/result")
      public @ResponseBody ReplyVO replyModify(@RequestParam("c_num") int c_num) throws Exception{
//         public @ResponseBody ResponseEntity<ReplyVO> replyModify(@RequestParam("c_num") int c_num) throws Exception{
         ReplyVO result = service.replyDetail(c_num);
//        return new ResponseEntity<ReplyVO>(result,HttpStatus.OK);
         return result; //ajax에 넘겨줄 값
      }
     
      // 댓글 수정 업데이트
      @PostMapping("/replyModify")
      public String replyModify(ReplyVO vo, int reply_num) throws Exception {
         service.replyModify(vo);
         int b_num = vo.getB_num();//b_num은 그 게시물 번호
         return "redirect:/free/freedetail?reply_num="+reply_num+"&b_num="+b_num;         
      }
      
```
- jsp
```javascript
$('.free_reply_modify').on("click",updateviewBtn);
        function updateviewBtn(e){
    	   e.preventDefault();
           let c_num = $(this).attr("href");
           let replyModi = $(".reply"+c_num);
    	   let b_num = $("#b_num").val();
    	   let reply_num = ${select};
           $.ajax({
        	   url: "result",
        	   type: "POST",
        	   data: {"c_num": c_num},
        	   success : function(result){ //controller에서 반환된 값값
        		   replyModi.empty();
        		   var commentsview = "";
        		   commentsview += '<form action="/free/replyModify" name="replymodiform" id="replymodiform" method="post">'; 
                   commentsview += '<ul class="reply_textbox">';
                   commentsview += '<div class="reply_textbox2" style="border:none;">';
                   commentsview += '<div class="reply_wr">';
                   commentsview += '<label class="reply_writer">';
                   commentsview += '<p>'+ result.c_writer;
                   
                   commentsview += '</p>';
                   commentsview += '</div>';
                   commentsview += '<textarea rows="5" cols="50" class="reply_text2" style="resize:none;" id="reply_modify" name="c_contents">';
                   commentsview += 	result.c_contents;
                   commentsview += '</textarea>';
                   commentsview += '<input type="hidden" value="'+ result.c_num + '" name="c_num" />';
                   commentsview += '<input type="hidden" value="'+ reply_num + '" name="reply_num" />';
                   commentsview += '<input type="hidden" value="'+ b_num + '" name="b_num" />';
                   commentsview += '</div>';
                   commentsview += '<div>';
                   commentsview += '<button type="button" class="reply_btn" onclick="replyModiCheck();">';
                   commentsview += '수정완료';
                   commentsview += '</button>';
                   commentsview += '</div>';
                   commentsview += '</div>';
                   commentsview += '</form>';
                   replyModi.append(commentsview);
        	   },
        	   error: function(request, error){
               	console.log("ajax 실패");
               	console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
               }
        })
       } 
        function replyModiCheck(){
        	if($("#reply_modify").val() == "") {
        		alert("댓글을 입력해주세요.");
        		return false;
        	} 
        	$("#replymodiform").submit();
        	
        }
```
