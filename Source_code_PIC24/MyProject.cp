#line 1 "C:/Users/nikki_moscow/Desktop/Курсовая/Kurs/Source_code1/MyProject.c"

sbit LCD_RS at LATD0_bit;
sbit LCD_EN at LATD1_bit;
sbit LCD_D4 at LATB0_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D7 at LATB3_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


char txt1[] = "mikroElektronika";
char txt2[] = "EasydsPIC4A";
char txt3[] = "Lcd4bit";
char txt4[] = "example";

char i;

void Move_Delay() {
 Delay_ms(500);
}

char uart_rd;

void main(){
 ADPCFG = 0xFFFF;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,txt3);

 Lcd_Out(2,6,txt4);
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt1);
 Lcd_Out(2,5,txt2);

 Delay_ms(2000);


 for(i=0; i<4; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Move_Delay();
 }

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }
 }

 UART1_Init(9600);
 Delay_ms(100);




 UART_Write_Text("Start");
 UART_Write(10);
 UART_Write(13);

 while (1) {
 if (UART_Data_Ready()) {
 uart_rd = UART_Read();
 UART_Write(uart_rd);
 }
 }


}
