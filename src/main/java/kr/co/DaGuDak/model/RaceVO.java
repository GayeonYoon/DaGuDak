package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RaceVO {
	
	private int race_No;
	private Date race_Date;
	private int first_Horse;
	private int second_Horse;
	private int third_Horse;
	private int fourth_Horse;
	private int fifth_Horse;
	private int first_Place;
	private int second_Place;
	private int third_Place;
	private String isEnd;
	
}
