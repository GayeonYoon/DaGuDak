package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommentVO {
	private int cmtno;
	private int bid;
	private int bno;
	private String cmt_writer;
	private String cmt_password;
	private String cmt_content;
	private Date cmt_regdate;
}
