package kr.co.DaGuDak.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardPager {

	// 페이지당 게시물 수
	public static final int PAGE_SCALE = 7;
	// 화면당 페이지 수
	public static final int BLOCK_SCALE = 3;

	private int curPage;
	private int prevPage;
	private int nextPage;
	private int totPage;
	private int totBlock;
	private int curBlock;
	private int prevBlock;
	private int nextBlock;

	private int pageBegin;
	private int pageEnd;

	private int blockBegin;
	private int blockEnd;

	public BoardPager(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotPage(count);
		setPageRange();
		setTotBlock();
		setBlockRange();
	}

	private void setBlockRange() {
		curBlock = (int) (Math.ceil((curPage - 1) / BLOCK_SCALE) + 1);
		blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;
		blockEnd = blockBegin + BLOCK_SCALE - 1;
		if (blockEnd > totPage)
			blockEnd = totPage;
		prevPage = (curPage == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;

		nextPage = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;

		if (nextPage >= totPage)
			nextPage = totPage;
	}

	private void setPageRange() {
		pageBegin = (curPage - 1) * PAGE_SCALE + 1;
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}
	
	public void setTotBlock() {
		totBlock = (int) Math.ceil(totPage/BLOCK_SCALE);
	}
	public void setTotPage(int count) {
		totPage = (int) Math.ceil(count*1.0/PAGE_SCALE);
	}

}
