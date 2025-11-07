package com.hmb.service;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

public class GameService {
  private static final String SECRET="hmb.secret";
  private static final String TRIES="hmb.tries";

  public void start(HttpSession s){
    s.setAttribute(SECRET, new Random().nextInt(100)+1); // 1..100
    s.setAttribute(TRIES, 0);
  }
  public String guess(HttpSession s, int n){
    int secret=(Integer)s.getAttribute(SECRET);
    int tries=(Integer)s.getAttribute(TRIES)+1; s.setAttribute(TRIES, tries);
    if(n==secret) return "OK";
    return n<secret? "MAYOR" : "MENOR";
  }
  public int tries(HttpSession s){ return (Integer)s.getAttribute(TRIES); }
}
