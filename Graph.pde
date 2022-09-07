public void graph() {
  cursor=false;

  int checkall=0;
  for (int i=0; i<10; i++) {
    if (move[i]=="del") {
      checkall++;
    }
  }
  //println(movecounter);
  if (checkall==10) {
    init=false;
    transition=false;
  } else {
    while (move[movecounter]=="del") {
      movecounter++;
      if (movecounter==10) {
        movecounter=0;
      }
    }
  }

  if (init) {
    mousePressed=false;
    BigInteger goal = new BigInteger(move[movecounter]);
    BigInteger currentpos = new BigInteger(generatedval, 2);
    currentpos = currentpos.multiply(BigInteger.valueOf(17));
    ScrollSpeed = goal.subtract(currentpos);
    ScrollSpeed = ScrollSpeed.multiply(BigInteger.valueOf(170));
    ScrollSpeed = ScrollSpeed.divide(BigInteger.valueOf(17));

    totaldiff = ScrollSpeed;
    
    if (totaldiff.abs().compareTo(BigInteger.valueOf(99999))==-1) {
      init=false;
      transition=false;
    }
    
    ScrollSpeed = BigInteger.valueOf(1);
    gradualcount=1;
    if (totaldiff.compareTo(BigInteger.valueOf(0))==1) {
      BigInteger sub = new BigInteger(subtract);
      totaldiff = totaldiff.subtract(sub);
      bigger=1;
    } else {
      bigger=-1;
      BigInteger sub = new BigInteger(subtract);
      totaldiff = totaldiff.add(sub);
    }

    init=false;
  }
  if (transition) {
    if (gradualcount<=10) {
      ScrollSpeed = BigInteger.valueOf(gradualcount*bigger);
    }
    if (gradualcount>10 && gradualcount<=25) {
      ScrollSpeed = BigInteger.valueOf(10*gradualcount*bigger);
    }
    if (gradualcount>25 && gradualcount<=50) {
      for (int i=0; i<gradualcount; i++) {
        ScrollSpeed=ScrollSpeed.multiply(BigInteger.valueOf(4));
      }
      bigstore=ScrollSpeed;
    }
    if (gradualcount>50 && gradualcount<=150) {
      ScrollSpeed = totaldiff.divide(BigInteger.valueOf(100));
    }
    if (gradualcount==151) {
      ScrollSpeed=bigstore;
    }
    if (gradualcount>150 && gradualcount<=175) {
      for (int i=0; i<(175-gradualcount); i++) {
        ScrollSpeed=ScrollSpeed.divide(BigInteger.valueOf(4));
      }
    }

    if (gradualcount>175 && gradualcount<=190) {
      ScrollSpeed = BigInteger.valueOf(10*(190-gradualcount)*bigger);
    }
    if (gradualcount>190 && gradualcount<=200) {
      ScrollSpeed = BigInteger.valueOf(bigger*(200-gradualcount));
    }

    if (gradualcount>200) {
      movecounter++;
      if(movecounter==10){
        movecounter=0;
      }
      transition=false;
      ScrollSpeed = BigInteger.valueOf(0);
    } else {
      gradualcount++;
    }

    scroll = scroll.add(ScrollSpeed);
  }

  background(back);

  if (scroll.compareTo(BigInteger.valueOf(170))==1) {
    BigInteger howmany =  new BigInteger("0");
    BigInteger remainder = new BigInteger("0");
    howmany = scroll.divide(BigInteger.valueOf(170));
    remainder = scroll.remainder(BigInteger.valueOf(170));
    remainder = remainder.divide(BigInteger.valueOf(170));
    howmany = howmany.subtract(remainder);

    BigInteger temporaryadd = new BigInteger(generatedval, 2);
    temporaryadd = temporaryadd.add(howmany);
    generatedval = temporaryadd.toString(2);

    howmany = howmany.multiply(BigInteger.valueOf(170));
    scroll=scroll.subtract(howmany);
  }
  if (scroll.compareTo(BigInteger.valueOf(-170))==-1) {
    BigInteger howmany =  new BigInteger("0");
    BigInteger remainder = new BigInteger("0");
    howmany = scroll.divide(BigInteger.valueOf(-170));
    remainder = scroll.remainder(BigInteger.valueOf(170));
    remainder = remainder.divide(BigInteger.valueOf(170));
    remainder = remainder.abs();
    howmany = howmany.subtract(remainder);

    BigInteger temporaryadd = new BigInteger(generatedval, 2);
    temporaryadd = temporaryadd.subtract(howmany);
    //if(temporaryadd.compareTo(BigInteger.valueOf(0))==-1){
    //  temporaryadd=BigInteger.valueOf(0);
    //}
    generatedval = temporaryadd.toString(2);

    howmany = howmany.multiply(BigInteger.valueOf(170));
    scroll=scroll.add(howmany);
  }

  for (int count=-4; count<5; count++) {
    BigInteger countadd = new BigInteger(generatedval, 2);
    countadd = countadd.subtract(BigInteger.valueOf(count));
    String countstring = countadd.toString(2);
    for (int i=0; i<1; i++) {
      if (countstring.length()<1802) {
        countstring=0+countstring;
        i--;
      }
    }
    for (int i=0; i<1802; i++) {
      pixel[i]=countstring.charAt(i)-48;
    }

    noStroke();
    for (int i=0; i<106; i++) {
      for (int j=0; j<17; j++) {
        if (pixel[i*17+j]==1) {
          fill(0);
        } else {
          if (selected) {
            if (countadd.compareTo(selectedint)==0) {
              fill(255, 200, 200);
            } else {
              fill(255);
            }
          } else {
            fill(255);
          }
        }
        rect(50+10*i, 418-10*j+170*count+int(scroll.toString()), 10, 10);
      }
    }
    stroke(200, 20, 20);
    strokeWeight(4);
    line(48.5, 428+170*count+int(scroll.toString()), 1111.5, 428+170*count+int(scroll.toString()));
    if (mouseX>48.5 && mouseX<1111.5 && mouseY>428-17*10+170*count+int(scroll.toString()) && mouseY<428+170*count+int(scroll.toString())) {
      cursor=true;
      if (mousePressed) {
        selected=true;
        selectedint=countadd;
      }
    }
  }
}

public void gbox() {
  stroke(0);
  strokeWeight(3);
  line(48.5, 0, 48.5, height);
  line(1111.5, 0, 1111.5, height);
  textAlign(CENTER, CENTER);

  if (selected) {
    fill(255);
    if (mouseX>1250 && mouseX<1361 && mouseY<50 && mouseY>5) {
      fill(122);
      cursor=true;
      if (mousePressed) {
          String countstring = selectedint.abs().toString(2);
          for (int i=0; i<1; i++) {
            if (countstring.length()<1802) {
              countstring=0+countstring;
              i--;
            }
          }
          for (int i=0; i<1802; i++) {
            pixel[i]=countstring.charAt(i)-48;
          }
        gen=false;
      }
    }
  } else {
    fill(200);
    stroke(180);
  }
  stroke(0);
  strokeWeight(2);
  rect(1250, 5, 111, 50);
  textSize(25);
  fill(0);
  text("Draw >", 1250, 5, 111, 50);
  if (cursor) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
