public void drawing() {
  background(back);
  strokeWeight(1);
  stroke(0);
  fill(255);
  for (int i=0; i<106; i++) {
    for (int j=0; j<17; j++) {
      if (pixel[i*17+j]==1) {
        fill(0);
      } else {
        fill(255);
      }
      if (mouseX>47+12*i-stroke && mouseX<59+12*i+stroke && mouseY>254-12*j-stroke && mouseY<266-12*j+stroke) {
        fill(122);
        if (mousePressed) {
          pixel[i*17+j]=mouse;
        }
      }
      rect(47+12*i, 254-12*j, 12, 12);
    }
  }
  temps = "";
  for (int i=0; i<1802; i++) {
    temps+=pixel[i];
    if (selected && i<400) {
      //println(i + " " + pixel[i]);
    }
  }
  fill(0);
  big = new BigInteger(temps, 2);
  big = big.multiply(BigInteger.valueOf(17));
  String test = big.toString();
  if (kval) {
    if (binary) {
      textSize(18);
      textAlign(CENTER, TOP);
      text(temps, 47, 275, 1272, 768);
    } else {
      textSize(32.5);
      textAlign(CENTER, TOP);
      text(test, 47, 300, 1272, 768);
    }
  }
  textSize(25);
  textAlign(CENTER, CENTER);
  text("Space-Switch Color, C-Clear Screen, S-Switch Display, I-Invert, B-Binary, -/= Change Stroke Size", 160, 0, width-160, 50);
}

public void dbox() {
  cursor=false;
  fill(255);
  if (mouseX>5 && mouseX<150 && mouseY<50 && mouseY>5) {
    fill(122);
    cursor=true;
    if (mousePressed) {
      init=true;
      gen=true;
      generatedval = temps;
      //println(tempbig.toString());
      count=BigInteger.valueOf(0);
    }
  }
  stroke(0);
  strokeWeight(2);
  rect(5, 5, 150, 50);
  textSize(25);
  fill(0);
  text("< Generate", 5, 5, 155, 50);
  stroke(0);
  strokeWeight(3);
  if (mouse==0) {
    fill(255);
  } else {
    fill(0);
  }
  rect(5, 70, 35, 35);
  fill(0);
  textSize(15);
  text(str(stroke), 5, 110, 35, 25);
  textSize(15);
  text("-/+", 5, 135, 35, 25);
}

void saves() {
  if (!kval) {
    for (int t=0; t<numberof; t++) {
      fill(255);
      stroke(0);
      strokeWeight(1);
      rect((1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t, 600, 127.2, 60);
      if (mouseX>(1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t && mouseX<(1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t+127.2 && mouseY>660 && mouseY<690) {
        cursor=true;
        fill(200);
        if (mousePressed) {
          BigInteger savednumber = new BigInteger(pregen[t]);
          savednumber = savednumber.divide(BigInteger.valueOf(17));
          String genpixels = savednumber.toString(2);
          for (int i=0; i<1; i++) {
            if (genpixels.length()<1802) {
              genpixels=0+genpixels;
              i--;
            }
          }
          for (int i=0; i<1802; i++) {
            pixel[i]=genpixels.charAt(i)-48;
          }
        }
      } else {
        fill(255);
      }
      rect((1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t, 660, 127.2, 30);
      fill(0);
      textSize(15);
      text("Load", (1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t, 660, 127.2, 30);
      textSize(25);
      text(pregenname[t], (1366-127.2*numberof-8.55*(numberof-1))/2+135.75*t, 600, 127.2, 60);
    }

    for (int t=0; t<10; t++) {
      if (move[t]!="del") {
        fill(150, 255, 150);
      } else {
        fill(255);
      }
      stroke(0);
      strokeWeight(1);
      rect(8.54+135.75*t, 440, 127.2, 60);
      if (mouseX>8.54+135.75*t && mouseX<8.54+135.75*t+127.2 && mouseY>500 && mouseY<520) {
        cursor=true;
        fill(200);
        if (mousePressed) {
          BigInteger savednumber = new BigInteger(temps, 2);
          savednumber = savednumber.multiply(BigInteger.valueOf(17));
          move[t] = savednumber.toString();
        }
      } else {
        fill(255);
      }
      rect(8.54+135.75*t, 500, 127.2, 20);
      if (mouseX>8.54+135.75*t && mouseX<8.54+135.75*t+127.2 && mouseY>520 && mouseY<540 && move[t]!="del") {
        cursor=true;
        fill(200);
        if (mousePressed) {
          BigInteger savednumber = new BigInteger(move[t]);
          savednumber = savednumber.divide(BigInteger.valueOf(17));
          String genpixels = savednumber.toString(2);
          for (int i=0; i<1; i++) {
            if (genpixels.length()<1802) {
              genpixels=0+genpixels;
              i--;
            }
          }
          for (int i=0; i<1802; i++) {
            pixel[i]=genpixels.charAt(i)-48;
          }
        }
      } else {
        fill(255);
      }
      rect(8.54+135.75*t, 520, 127.2, 20);
      if (mouseX>8.54+135.75*t && mouseX<8.54+135.75*t+127.2 && mouseY>540 && mouseY<560) {
        cursor=true;
        fill(200);
        if (mousePressed) {
          move[t]="del";
        }
      } else {
        fill(255);
      }
      rect(8.54+135.75*t, 540, 127.2, 20);
      fill(0);
      textSize(40);
      text(str(t+1), 8.54+135.75*t, 440, 127.2, 60);
      textSize(10);
      text("Save", 8.54+135.75*t, 500, 127.2, 20);
      if (move[t]=="del") {
        fill(100);
      } else {
        fill(0);
      }
      text("Load", 8.54+135.75*t, 520, 127.2, 20);
      fill(0);
      text("Clear", 8.54+135.75*t, 540, 127.2, 20);
    }
  }
  if (cursor) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void savestring() {
  String[] allsaves = new String[10];
  for (int i=0; i<10; i++) {
    if (move[i]=="del") {
      allsaves[i]="-1";
    } else {
      allsaves[i]=move[i];
    }
  }
  saveStrings(dataPath("saves.txt"), allsaves);
  //println("saved");
}
