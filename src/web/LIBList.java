package web;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;

public class LIBList{

  private ArrayList<Integer> idList = new ArrayList<Integer>();
  private ArrayList<String> titleList = new ArrayList<String>();
  private ArrayList<String> writerList = new ArrayList<String>();
  private ArrayList<Integer> priceList = new ArrayList<Integer>();
  private ArrayList<String> rentalList = new ArrayList<String>();
  private ArrayList<Integer> countList = new ArrayList<Integer>();
  private ArrayList<Integer> pageList = new ArrayList<Integer>();
  private int lastSize = 0;
  private boolean lastPage = false;
  public LIBList() {
  }
  public void setId(int index, Integer id){
    this.idList.add(index,id);
  }
  public void setTitle(int index, String title){
    this.titleList.add(index, title);
  }
  public void setWriter(int index, String writer){
    this.writerList.add(index, writer);
  }
  public void setPrice(int index, Integer price){
	    this.priceList.add(index, price);
  }
  public void setRental(int index, String rental){
	    this.rentalList.add(index, rental);
  }
  public void setCount(int index, Integer count){
	    this.countList.add(index, count);
  }
  public void setLastPage(boolean lastPage){
    this.lastPage = lastPage;
  }
  public void setPageIndex(int index, Integer page) {
	  this.pageList.add(index,page);
  }
  public void setLastSize(int last) {
	  this.lastSize = last;
  }
  
  public Integer[] getId() {
    return idList.toArray(new Integer[idList.size()]);
  }
  public  String[] getTitle() {
    return titleList.toArray(new String[titleList.size()]);
  }
  public String[] getWriter() {
    return writerList.toArray(new String[writerList.size()]);
  }
  public Integer[] getPrice() {
	    return priceList.toArray(new Integer[priceList.size()]);
  }
  public String[] getRental() {
	    return rentalList.toArray(new String[rentalList.size()]);
  }
  public Integer[] getCount() {
	    return countList.toArray(new Integer[countList.size()]);
  }
  public Integer[] getPageIndex() {
	  	return pageList.toArray(new Integer[pageList.size()]);
  }
  public boolean isLastPage() {
    return lastPage;
  }
  public int getLastSize() {
	    return lastSize;
  }
  public int getListSize() {
    return idList.size();
  }
  
}