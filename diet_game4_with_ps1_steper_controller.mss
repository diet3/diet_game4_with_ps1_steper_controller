#include "lambda.h"

#define	SPR_W	640
#define	SPR_H	480
#define	ADD_X	1
#define	ADD_Y	2

/*
Å@âÊñ ì‡ÇîΩéÀÇµÇ»Ç™ÇÁìÆÇ≠ÉTÉìÉvÉã
*/
main()
{
	var back, move, sz[2], x, y, x1, y1, a1, addx, addy, txt;
	var flag1, c1, c2, c3, x2, y2, x3, y3, score1;
	var ani1,ani2,ani3;
	var c4,x4,y4,score2;
	var v1;
	var j1;
	sprSetLevel(66);
	timeSetFPS(30);
	txt = imgCreate(640,16,4,0);
	back = imgLoad("bg.bmp", 1, 0);
	imgSetCurrent(back);
	x1=180;y1=400;
	x2=200;y2=60;
	x3=460;y3=160;
	x4=100;y4=300;
	score1=0;
	score2=0.1;
	ani3=3;
	v1=-10;
	a1=1;
	c1 = imgLoad("bar.bmp", 2, 0);
	c2 = imgLoad("otedama.bmp", 4, 0);
	imgSetCurrent(c1);
	imgSetTrans(true, 31, 0, 31);
	imgSetPos(x1, y1);
	imgSetCurrent(c2);
	imgSetTrans(true, 31, 0, 31);
	imgSetPos(x2, y2);
		imgSetCurrent(txt);
		txtSetColor(255, 255, 255);
		txtSetPos(300, 0);
		txtOut("SCORE:"+score1);
	inpSetCurrent(inpGetDevice(1));
	sprRenderScreen();

	while(true)
	{
		imgSetCurrent(c1);
		inpClear();
		if(inpGetState(INP_RIGHT) == INP_PUSH)
		{
				if(flag1==1){
				flag1=0;
	imgSetCurrent(c1);
	x1+=20;
	imgSetPos(x1, y1);
				}
			
		}
		if(inpGetState(INP_LEFT) == INP_PUSH)
		{
				if(flag1==0){
				flag1=1;
	imgSetCurrent(c1);
	x1+=20;
	imgSetPos(x1, y1);
				}
		}
	imgSetCurrent(c1);
		x1-=1;
	imgSetPos(x1, y1);
	imgSetCurrent(c2);
		y2+=v1;
		v1+=a1;
		imgSetPos(x2, y2);
		if((x2 < (x1 + 200)) && (x1 < (x2 + 100)) && (y2 < (y1 + 60)) && (y1 < (y2 + 100))){
			v1 = -30;
			score1+=10;
		}
		if(y2>480){
	imgSetCurrent(c2);
			score1-=100;
			v1 = -10;
			x2=200;y2=60;
		imgSetPos(x2, y2);
		}
		score2+=0.1;
		imgSetCurrent(txt);
		imgFill(0, 0, 0);
		txtSetPos(0, 0);
		txtOut("You play with Step controller.");
		txtSetPos(300, 0);
		txtOut("SCORE:"+score1);
		sprRenderWait();
	}
}
