package com.kh.spring.market.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Rating {
	
	private int rIdx;
    private int pIdx;
    private int userIDx;
    private int grade;
    private String content;
    private Date regDate;
    private String isDel;
}
