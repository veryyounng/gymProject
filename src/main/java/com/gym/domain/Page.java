package com.gym.domain;

import lombok.Data;

@Data
public class Page {
	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;

	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 10;

	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 5;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;
	
	private String searchType;
	private String keyword;
	private String date_list;
	private String lecture_list;
	private String datepick;
	private String lecturepick;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	
	public void setNum(int num) {
		this.num = num;
	}

	public void setCount(int count) {
		this.count = count;

		dataCalc();
	}
	private void dataCalc() {
		 
		 // 마지막 번호
		 endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		 
		 // 시작 번호
		 startPageNum = endPageNum - (pageNumCnt - 1);
		 
		 // 마지막 번호 재계산
		 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		 
		 if(endPageNum > endPageNum_tmp) {
		  endPageNum = endPageNum_tmp;
		 }
		 
		 prev = startPageNum == 1 ? false : true;
		 next = endPageNum * postNum < count ? true : false;
		 
		 displayPost = (num - 1) * postNum;
		 
		}
}
