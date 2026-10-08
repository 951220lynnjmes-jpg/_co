// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    // 1. 檢查鍵盤輸入
    @KBD
    D=M
    @KEY_PRESSED
    D;JGT       // 若 KBD > 0，跳轉至 KEY_PRESSED

    // 2. 無鍵盤輸入時：設定顏色為白色 (0)
    @color
    M=0
    @DRAW
    0;JMP       // 跳轉至繪圖流程

(KEY_PRESSED)
    // 3. 有鍵盤輸入時：設定顏色為黑色 (-1 / 0xFFFF)
    @color
    M=-1

(DRAW)
    // 4. 初始化繪圖指標 (addr = SCREEN) 與 計數器 (i = 8192)
    @SCREEN
    D=A
    @addr
    M=D         // addr 指向 SCREEN 開頭位置 (16384)

    @8192
    D=A
    @n
    M=D         // n = 8192 (螢幕總共佔用 8192 個 words)

(DRAW_LOOP)
    // 5. 檢查是否已塗滿整個螢幕 (n == 0)
    @n
    D=M
    @LOOP
    D;JEQ       // 若 n == 0，結束繪製，回到主迴圈繼續監聽鍵盤

    // 6. 將當前顏色寫入指定的螢幕記憶體位置
    @color
    D=M
    @addr
    A=M
    M=D         // *addr = color

    // 7. 更新指標與計數器
    @addr
    M=M+1       // addr = addr + 1
    @n
    M=M-1       // n = n - 1

    @DRAW_LOOP
    0;JMP       // 繼續下一個 word 的著色