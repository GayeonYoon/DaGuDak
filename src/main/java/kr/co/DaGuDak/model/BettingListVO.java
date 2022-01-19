package kr.co.DaGuDak.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BettingListVO {
	private int race_no;
	private String member_id;
	private int selected_horse;
	private int betting_point;
	private String horse_name;

}
