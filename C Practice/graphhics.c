#include<conio.h>
#include<graphics.h>
int main()
{
int gd = DETECT, gm;
clrscr();
initgraph(&gd, &gm, "C:\\TC\\BGI");
moveto(10, 10);
lineto(10, 100);
lineto(100, 100);
getch();
closegraph();
return 0;
}
