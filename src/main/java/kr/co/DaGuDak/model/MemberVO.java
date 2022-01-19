package kr.co.DaGuDak.model;
 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	 private String member_id;
	 private String password;
	 private String name;
	 private String birth;                                  
	 private String email;
	 private String phone;
	 private int point;
	 private float win_rate;
	 private int win_count;
	 private int total_games;

}
