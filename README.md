# 💪🏻 헬스장 웹 페이지 만들기!(팀 프로젝트) 🥇🥈🥉
헬스장 소개 및 예약, 스케줄 관리, 쪽지기능, 게시판 기능을 포함한 웹 페이지 입니다.  
[우리동네 올림픽으로 이동!](http://ourtownolympic.kro.kr/)
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
