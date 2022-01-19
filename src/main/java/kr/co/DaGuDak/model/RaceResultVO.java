package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class RaceResultVO {
	private int race_No;
	private Date race_Date;
	private String first_Horse_Name;
	private String second_Horse_Name;
	private String third_Horse_Name;
	private int first_Place;
	private int second_Place;
	private int third_Place;
	
}
