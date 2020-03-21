package com.common;
import java.io.Serializable;
public class Page implements Serializable{
	private static final long serialVersionUID = 1L;
	private int currentPage;
	private int pageSize =8;
	private int totalPage;
	private int totalRows;
	private int startIndex;
	private int endIndex;
	public int getStartIndex() {
		return startIndex <0 ? 0:startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if(currentPage<1) this.currentPage = 1;
		else if(currentPage>getTotalPage())  this.currentPage = this.totalPage;
		else this.currentPage = currentPage;
		this.startIndex = (this.currentPage-1)*this.pageSize;
		this.endIndex = this.currentPage*this.pageSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		if(this.totalRows%this.pageSize == 0){
			this.totalPage = this.totalRows/this.pageSize;
		}else{
			this.totalPage = this.totalRows/this.pageSize+1;
		}
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(Integer totalRows) {
		this.totalRows = totalRows;
	}
}
