package kr.co.DaGuDak.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HorseVO {
   private int horse_no;
   private String horse_name;
   private String kind;
   private int age;
   private int weight;
   private String gender;
   private String speed;
   private int speed1;
   private int speed2;
   private int speed3;
   private int speed4;
   private float win_rate;
   private int win_count;
	 private int total_games;
}