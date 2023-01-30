package com.gym.ex_board.vo;

import lombok.Data;

@Data
public class Ex_Page {
	
	// 현재 페이지 번호
	private int num;
	
	// 게시물 총 갯수
	private int count;
	
	// 한 페이지에 표시될 게시물 갯수
	private int postNum = 10;
	
	// 하단 페이징
	private int pageNum;
	
	// 출력할 게시물
	private int displayPost;
	
	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 5;
	
	// 표시되는 페이지의 마지막 번호
	private int endPageNum;
	
	// 표시되는 페이지의 첫번째 번호
	private int startPageNum;
	
	// 다음 / 이전 표시여부
	private boolean prev;
	private boolean next;
	
	public boolean getPrev() {
		return prev;
	}
	
	public boolean getNext() {
		return next;
	}
	
	public void setCount(int count) {
		this.count = count;
		
		dataCalc();
	}
	
	public void dataCalc() {
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		
		startPageNum = endPageNum - (pageNumCnt - 1);

		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;
		
		displayPost = (num - 1) * postNum;
		
	}
	
	// 검색 타입과 검색어
	/*
	private String searchTypeKey;
	
	public void setSearchTypeKey(String searchType, String keyword) {
		
		if(searchType.equals("") || keyword.equals("")) {
			searchTypeKey = "";
		} else {
			searchTypeKey = "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	
	public String getSearchTypeKey() {
		return searchTypeKey;
	}
	*/
	
	
	public String getSearchTypeKey() {
		
		if(searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
		
	}
	
	private String searchType;
	private String keyword;
	
}
