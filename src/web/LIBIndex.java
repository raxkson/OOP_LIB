package web;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;

public class LIBIndex{

  private int id = 0;
  private String title = null;
  private String writer = null;
  private int price = 0;
  private String rental = null;
  private int count = 0;
  public LIBIndex() {
  }
  public void setId(Integer id){
    this.id = id;
  }
  public void setTitle(String title){
    this.title = title;
  }
  public void setWriter(String writer){
    this.writer = writer;
  }
  public void setPrice(Integer price){
	    this.price = price;
  }
  public void setRental(String rental){
	    this.rental = rental;
  }
  public void setCount(Integer count){
	    this.count = count;
  }
  
  
  public Integer getId() {
    return id;
  }
  public  String getTitle() {
    return title;
  }
  public String getWriter() {
    return writer;
  }
  public Integer getPrice() {
	    return price;
  }
  public String getRental() {
	    return rental;
  }
  public Integer getCount() {
	    return count;
  }
  
}