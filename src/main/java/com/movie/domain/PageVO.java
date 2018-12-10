package com.movie.domain;

public class PageVO {
    private int count; // 전체글개수
    private int pageNum;
    private int pageCount;
    private int pageBlock;
    private int startPage;
    private int endPage;
    
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public int getPageBlock() {
        return pageBlock;
    }
    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
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
}
