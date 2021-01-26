package studycafe.model.vo;

public class PageInfo {
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int cafeLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {}

	public PageInfo(int currentPage, int listCount, int pageLimit, int cafeLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.cafeLimit = cafeLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	

	public PageInfo(int currentPage, int listCount, int pageLimit, int cafeLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.cafeLimit = cafeLimit;
		
		
		this.maxPage = (int)Math.ceil((double)listCount/cafeLimit);
		this.startPage = (currentPage -1)/ pageLimit * pageLimit+1;
		this.endPage = startPage + pageLimit -1;
		
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getCafeLimit() {
		return cafeLimit;
	}

	public void setCafeLimit(int cafeLimit) {
		this.cafeLimit = cafeLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", cafeLimit=" + cafeLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
	
}
