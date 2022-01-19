package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RaceBetVO {
	private int race_No;
	private Date race_Date;
	private String first_Horse_Name;
	private String second_Horse_Name;
	private String third_Horse_Name;
	private String fourth_Horse_Name;
	private String fifth_Horse_Name;
	private int first_Horse;
	private int second_Horse;
	private int third_Horse;
	private int fourth_Horse;
	private int fifth_Horse;
	private int first_Horse_Speed;
	private int second_Horse_Speed;
	private int third_Horse_Speed;
	private int fourth_Horse_Speed;
	private int fifth_Horse_Speed;
	private float first_Horse_WinRate;
	private float second_Horse_WinRate;
	private float third_Horse_WinRate;
	private float fourth_Horse_WinRate;
	private	float fifth_Horse_WinRate;
}
