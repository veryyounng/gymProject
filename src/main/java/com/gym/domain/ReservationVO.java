package com.gym.domain;

import lombok.Data;

@Data
public class ReservationVO {
	private int rv_num;
	private String rv_date;
	private String rv_time;
	private String rv_title;
}
