import java.math.BigInteger;
String subtract = "22642885489652032568635091504719302845045434311673839979297411255268473822454959603103872634631263367046107177136523373430174524984258769297087115302055414421805831766959160290077107583846748859574524304312930409113822620701125352298253367463911335801034020067014512201640589504027193995242200987670915292581451151109496085041965775156816481997749564162185770259338856780235071148076106761961762764058663151676513472613127493739825480582574026622783061696868856808130533314610073035222712731825859217643501020866291533888837266172501980528719525058567947772154184160247811850";

int numberof = 4;

String SelfReferential = "960939379918958884971672962127852754715004339660129306651505519271702802395266424689642842174350718121267153782770623355993237280874144307891325963941337723487857735749823926629715517173716995165232890538221612403238855866184013235585136048828693337902491454229288667081096184496091705183454067827731551705405381627380967602565625016981482083418783163849115590225610003652351370343874461848378737238198224849863465033159410054974700593138339226497249461751545728366702369745461014655997933798537483143786841806593422227898388722980000748404719";
String OliviaCursive = "1931681276376831465437209585508285965092858165035200605591286908944159760862659379818969781489907400534741104092672569313225065776323414288787815217349277806780464086422569434344616136743670244977342358257372946065032582693243959005377870376129982735789574030102010834982490694486819486328099468018227354158043388950611744085244341969863896529147733014839925648481052371905989925016071992939876078319871657421758124972631825475263691404305369206801651304142760037950132432324759318725210804834636239924293901486129152";
String SevanRules = "23601947876426139793371330309591158745477036528479181994854058663947150604255828285976372288257539690467546117472195632359884918777969197990119241162672127431729769909879871906274043340408338118638650164572776328649340437691589113144181750240208388911208863546226425626060990102684614772660450793390361554807635053149885632031725622517489961680499508178466546182838474924161634178184002075029741695007646512115096327203882035251688432445332040897077877555006645515308435894002833944446100523465238050500029816082792448";
String Medansky = "68490931532180636189783094102193840356144865452550799151672714356208903753624791843623287143781241729473891089343638414796640679056795017823394676913022468037353423732837273296076862037405819523014638624936877827451563002812457707110868265964775637605759541122748191682216072694560051394914159626471381621402413544045092542617282911582172371087221829489124059790597438403047809309152885887468251019022935259621428902074042872034153269842020438332829789146409646762401584512902944790365712548350158025253141567068572970410065809899520";
String EulersIdentity = "1499641116137335524286140670184408861302163034082420898047617202579648118043295179810043470763999288895359226295845107595465610490614958125948821248545692714798984790743373557528045030464309857897344390130069071357926803483592579158800679543294865219312110559928738938748732813858339068130531624188375028629987020139598497691541210255757116008669352587185391886504119441133345706316887030212249676483794992482315859747717986570979138622818497544696725220331465042109500824158142132649984";
String CandyCane = "4322634355863456476730865132199425457099961641735997224663411741800554000676154384699769378951594095465713617074377604016585088882670962106055875411236338848655741375606694642930012203982225535148405786197529806275956052208458594220867238597270692086666776910778189842235288583069480694417229610800010846358830942504913019709357319986689148032452947069467190177755322055027550366329669026263875962090663808250499459834964335202141303952911969867627040634453833531316543485381716879409151336058030835306561422435267097266783697118653236337704959";
String Lines = "4858487702934852963742694019060112181287731303703795686578473774233756613396426133016537625063071240583196290029697650109214543958386147697238367542287625591707876694153906208698368411255322087856469599049338192795071577832477004186236153263834073868605623519314713762494886255618181424819399658811502570644210786233762778846096266913823276420396960838800075853457703331526187663915730512560817480006964987288144911506665832070500810534652302215390808290991528429809817691596456908925272534429337730668100478815764358692283144764772081985388476";

String str = "0";
BigInteger big, convert;
PImage back;
int pixel[] = new int [1802]; //pixel 0 is bottom left, pixel 1 is (0, 1) and so on.
int mouse=1;
String temps;
boolean gen = false;
BigInteger scroll = new BigInteger("0");
int temp=0;
String generatedval = "0";
BigInteger ScrollSpeed = new BigInteger("0");
BigInteger count = new BigInteger("0");
BigInteger divisions = new BigInteger("20");
boolean init = true;
BigInteger totaldiff;
int gradualcount=0;
int bigger=1;
boolean transition=false;
int movecounter=1;
BigInteger bigstore;
boolean selected=false;
boolean cursor;
BigInteger selectedint;
boolean binary=false;
int stroke = 1;
boolean kval=false;
boolean saved [] = new boolean [10];
String[] move;
String pregen[] = new String[10];
String pregenname[] = new String[10];

void setup() {
  move = loadStrings("saves.txt");
  for(int i=0; i<move.length; i++){
    if(int(move[i])<0){
      move[i]="del";
    }
  }
  pregen[0]=SelfReferential;
  pregen[1]=EulersIdentity;
  pregen[2]=CandyCane;
  pregen[3]=Lines;
  pregen[4]=OliviaCursive;
  
  pregen[5]=Medansky;
  pregen[6]=SevanRules;
  
  pregenname[0]="Tupper";
  pregenname[1]="Euler";
  pregenname[2]="Stripes";
  pregenname[3]="Lines";
  pregenname[4]="Olivia";
  pregenname[5]="Medansky";
  pregenname[6]="Sevan";
  pregenname[7]="Shivam";
  pregenname[8]="Caleb";
  pregenname[9]="Dad";

  //size(1366, 768);
  //frameRate(1);
  for (int i=0; i<10; i++) {
    saved[i]=false;
  }
  back = loadImage("background.jpg");
  back.resize(1366, 768);
  big = new BigInteger(str);
  big = big.divide(BigInteger.valueOf(17));
  str = big.toString(2);
  for (int i=0; i<1; i++) {
    if (str.length()<1802) {
      str=0+str;
      i--;
    }
  }
  //fullScreen();
  size(1366, 768);
  background(255);
  for (int i=0; i<1802; i++) {
    pixel[i]=str.charAt(i)-48;
  }
  textAlign(CENTER, TOP);
}

void draw() {
  if (!gen) {
    drawing();
    dbox();
    saves();
    savestring();
  } else {
    graph();
    gbox();
  }
}

void keyReleased() {
  if (gen) {
    if (key==' ') {
      transition=true;
      init=true;
    }
    if (key=='c') {
      selected=false;
    }
    if (key=='s') {
      transition=false;
    }
  } else {
    if (key==' ') { //switch drawing mode
      if (mouse==1) {
        mouse=0;
      } else {
        mouse=1;
      }
    }
    if (key=='c') { //clear entirely
      for (int i=0; i<1802; i++) {
        pixel[i]=0;
      }
    }
    //if (key=='r') { //reset to default
    //  for (int i=0; i<1802; i++) {
    //    pixel[i]=str.charAt(i)-48;
    //  }
    //}
    if (key=='s') { //generate k value (save) //Switch mode
      kval=!kval;
      //big = new BigInteger(temps, 2);
      //big = big.multiply(BigInteger.valueOf(17));
      //String test = big.toString();
      //println(test);
    }
    //if (key=='d') { //make default
    //  str = temps;
    //}
    if (key=='b') { //switch binary and decimal
      binary = !binary;
    }
    if (key=='=') { //increase stroke
      stroke+=5;
      if (stroke>999) {
        stroke=999;
      }
      if (stroke==994) {
        stroke=995;
      }
    }
    if (key=='-') { //decrease stroke
      stroke-=5;
      if (stroke<0) {
        stroke=0;
      }
    }
    if (key=='i') { //invert
      for (int i=0; i<1802; i++) {
        if (pixel[i]==1) {
          pixel[i]=0;
        } else {
          pixel[i]=1;
        }
      }
    }
  }
}

void mouseWheel(MouseEvent event) {
  if (gen) {
    float e = event.getCount();
    scroll=scroll.add(BigInteger.valueOf(int(e*10)));
  }
}
