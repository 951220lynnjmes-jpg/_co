// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.// 本程式屬於 www.nand2tetris.org 專案
// 以及 Nisan 與 Schocken 所著《The Elements of Computing Systems》（MIT Press）一書。
// 檔名：projects/04/Mult.asm

// 計算 R0 * R1，並將結果存入 R2。
// （R0、R1、R2 分別代表 RAM[0]、RAM[1] 與 RAM[2]。）

// 初始化累加結果：R2 = 0
    @R2
    M=0

// 讀取乘數 R1 的值，存入計數變數 i
    @R1
    D=M
    @i
    M=D

(LOOP)
// 檢查計數器 i：若 i == 0，表示加法已完成，跳轉至 END
    @i
    D=M
    @END
    D;JEQ

// 將被乘數 R0 的值累加至 R2（R2 = R2 + R0）
    @R0
    D=M
    @R2
    M=D+M

// 將計數器 i 減 1（i = i - 1）
    @i
    M=M-1

// 跳回 LOOP 繼續執行下一輪迴圈
    @LOOP
    0;JMP

(END)
// 無限迴圈，用於安全結束程式執行（防止 PC 繼續執行下方未知記憶體區域）
    @END
    0;JMP