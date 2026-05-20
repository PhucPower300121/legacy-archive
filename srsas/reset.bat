@echo off
color 0a
title SRS Audio Sandbox - Trial Tool v1.0.0 by Phuc Power
set "target_dir=C:\ProgramData\SRS Labs\SAS"
set "target_file=%target_dir%\sas0822.bin"

echo ==================================================
echo  (o)  SRS AUDIO SANDBOX - TRIAL TOOL v1.0.0
echo ==================================================
echo [?] App nay hien tai khong the mua ban quyen chinh thuc.
echo [!] Day la cach de ban su dung app vinh vien.
echo.
set /p "choice=Ban co muon tiep tuc "dong bang" thoi gian khong? (Y/N): " [cite: 3]

if /i "%choice%" neq "Y" (
    echo [X] Da huy thao tac. Hen gap lai!
    timeout /t 2 /nobreak >nul
    exit
)

echo.

cls

echo ==================================================
echo  (o)  SRS AUDIO SANDBOX - TRIAL TOOL v1.0.0
echo ==================================================
echo [?] Chon che do ban muon:
echo 1. Reset Trial (Chi xoa file de reset ve 14 ngay)
echo 2. Freeze Trial (Xoa va khoa file vinh vien - Khuyen dung)
echo 0. Exit
set /p "opt=Nhap lua chon (1/2/0): "

if "%opt%"=="0" (
     echo Exiting...
     timeout /t 1 /nobreak >nul
     goto 0
)

cls
echo ==================================================
echo  (o)  SRS AUDIO SANDBOX - TRIAL TOOL v1.0.0
echo ==================================================
echo [+] Dang chuan bi "ma tran" thoi gian...

:: Kiem tra xem thu muc co ton tai khong
if not exist "%target_dir%" (
    echo [ERROR] Khong tim thay thu muc C:\ProgramData\SRS Labs\SAS. Co ve app chua duoc cai dat hoac da doi cho o.
    goto :end
)

timeout /t 1 /nobreak >nul

echo [OK] Da tim thay folder chua thong tin "mat"... [cite: 4]

:: Mo khoa file neu dang bi Read-only de thao tac
attrib -r "%target_file%" >nul 2>&1

echo [OK] Thong bao nay la de ban chu y den thong bao nay, khi ban da chu y den thong bao nay, ban da duoc thong bao...

timeout /t 1 /nobreak >nul

:: Buoc 2: Xoa file .bin hien tai
del /f /q "%target_file%" >nul 2>&1

echo [OK] Da xoa file... 100%

timeout /t 1 /nobreak >nul

:: Xu ly theo Option
if "%opt%"=="2" (
    :: Buoc 3: Tao mot file .bin moi hoan toan trong (0 byte)
    type break > "%target_file%" 
    echo [OK] Da tao lai file...

    timeout /t 1 /nobreak >nul

    :: Buoc 4: Khoa chat file bang thuoc tinh Read-only (+r)
    attrib +r "%target_file%" >nul 2>&1
    echo [OK] Permission changed...
    
    timeout /t 1 /nobreak >nul
    echo [!] Da "dong bang" file .bin thanh cong. [cite: 6]
    echo [!] App se khong the ghi de ngay thang nua! [cite: 6]
) else (
    echo [!] Da Reset trial! SRS se tu tao file moi khi ban khoi dong lai app.
)

:end
pause