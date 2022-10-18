@echo off
chcp 1255>nul
MODE CON: COLS=80 lines=30
color b
set VER=6.5
title ���� ������� %VER%

:start
cls
echo.
echo.
echo                                  %VER% ������� ����
echo                               ======================
echo.
echo         2 ��� ����� ������� 1 ��� ������� ������ �� ���� ������� ��� ��
echo.
echo.
echo.
choice /c 12
if errorlevel 2 goto choice
if errorlevel 1 goto default

:choice
cls
echo.
echo.
echo ����� ���� ����� ����� ����
set/p source=">>>"
cd /d %source%
goto :go

:default
cd /d "%userprofile%\downloads"
goto :go

:go
cls
::������
for %%i in (*.epub,*.chm,*.cpp,*.pub,*.pubx,*.csv,*.cxx,*.doc,*.docm,*.docx,*.dot,*.dotm,*.dotx,*.h,*.hpp,*.htm,*.html,*.hxx,*.ini,*.java,*.lua,*.mht,*.hteml,*.mhtml,*.odt,*.pdf,*.potx,*.potm,*.ppam,*.ppsm,*.ppsx,*.pps,*.ppt,*.pptm,*.pptx,*.rtf,*.sldm,*.sldx,*.thmx,*.txt,*.vsd,*.wpd,*.wps,*.wri,*.xlam,*.xls,*.xlsb,*.xlsm,*.xlsx,*.xltm,*.xltx,*.xml) do if exist %%i md "������" & move "%%i" "������">>����� & cls

::������
for %%i in (*.fon,*.ttf,*.ttc,*.fnt,*.otf) do md "���� ����/������" & move "%%i" "���� ����/������">>����� & cls

::�����
for %%i in (*.3dxml,*.prc,*.u3d,*.dwg,*.jt,*.xvl,*.stl,*.dxf,*.indd,*.ai,*.psd,*.indd) do md "������\���� ����" & move "%%i" "������\���� ����">>����� & cls

::������
for %%i in (*.aia,*.aix,*.ais) do md "������\������" & move "%%i" "������\������">>����� & cls

::���� �����
for %%i in (*.3g2,*.3gp,*.3gp2,*.3gpp,*.amr,*.amv,*.asf,*.avi,*.bdmv,*.bik,*.d2v,*.divx,*.drc,*.dsa,*.dsm,*.dss,*.dsv,*.evo,*.f4v,*.flc,*.fli,*.flic,*.flv,*.hdmov,*.ifo,*.ivf,*.m1v,*.m2p,*.m2t,*.m2ts,*.m2v,*.m4b,*.m4p,*.m4v,*.mkv,*.mp2v,*.mp4,*.mp4v,*.mpe,*.mpeg,*.mpg,*.mpls,*.mpv2,*.mpv4,*.mov,*.mts,*.ogm,*.ogv,*.pss,*.pva,*.qt,*.ram,*.ratdvd,*.rm,*.rmm,*.rmvb,*.roq,*.rpm,*.smil,*.smk,*.swf,*.tp,*.tpr,*.ts,*.vob,*.vp6,*.webm,*.wm,*.wmp,*.wmv) do if exist %%i md "�����" & move "%%i" "�����">>����� & cls

::���� ���
for %%i in (*.aac,*.ac3,*.aif,*.aifc,*.aiff,*.au,*.cda,*.dts,*.fla,*.flac,it,*.m1a,*.m2a,*.m3u,*.m4a,*.mid,*.midi,*.mka,*.mod,*.mp2,*.mp3,*.mpa,*.ogg,*.ra,*.rmi,*.spc,*.rmi,*.snd,*.umx,*.voc,*.wav,*.wma) do if exist %%i md "�����" & move "%%i" "�����">>����� & cls

::���� ������
for %%i in (*.7z,*.ace,*.arj,*.bz2,*.cab,*.gz,*.gzip,*.jar,*.r00,*.r01,*.r02,*.r03,*.r04,*.r05,*.r06,*.r07,*.r08,*.r09,*.r10,*.r11,*.r12,*.r13,*.r14,*.r15,*.r16,*.r17,*.r18,*.r19,*.r20,*.r21,*.r22,*.r23,*.r24,*.r25,*.r26,*.r27,*.r28,*.r29,*.rar,*.tar,*.tgz,*.z,*.zip) do if exist %%i md "���� ������" & move "%%i" "���� ������" >>����� & cls

::���� ����
for %%i in (*.exe,*.msi,*.msp,*.scr) do md "���� ����" & move "%%i" "���� ����">>����� & cls

::���������
for %%i in (*.apk,*.xapk) do md "���� ����/���������" & move "%%i" "���� ����\���������">>����� & cls

::��������
for %%i in (*.cmd,*.ps1,*.reg) do md "���� ����/��������" & move "%%i" "���� ����/��������">>����� & cls

::������ ������ ������ ��� ������ ������ �� ����� ��� �� �� ������
for %%i in (*.bat) do md "���� ����/��������" & if not "%%i"=="%~nx0" move "%%i" "���� ����/��������">>����� & cls

::���� ����
for %%i in (*.img,*.iso) do md "���� ����/���� ISO" & move "%%i" "���� ����/���� ISO">>����� & cls

::������
for %%i in (*.webp,*.svg,*.bmp,*.gif,*.ico,*.jpe,*.jpeg,*.jpg,*.pcx,*.png,*.psd,*.tga,*.tif,*.tiff,*.wmf)  do md "������" & move "%%i" "������">>����� & cls

if exist ����� (
cls
echo.
echo.
echo                                :������� ������ ���� & find /c "1" ����� & del �����
) else (
echo.
echo.
echo                                  !����� ����� ��
)
echo.
echo.
echo.
echo                    1 ��� ����� ���� ��� ����� ������ ���� ���
echo                        2 ��� ����� ������ ����� �����
echo. 
echo.
choice /c 12
if errorlevel 2 goto :start
if errorlevel 1 goto :folder-scanner

::���� ������� ������

:folder-scanner
for /d %%a in (*) do (set drive="%%a" & set d_name="%%~na" & call :scanner)
echo.
goto :end

:scanner
::����� ������ ������
::������� ��� ������
cd /d %drive%

::����� ���� ������ ������ �������
set num_all=0
for %%f in (*) do @(set /a num_all+=1 > nul)

::����� ������ ������ ���� ������ ��� ��� ���
set num_fol=0
for /d %%f in (*) do @(set /a num_fol+=1 > nul)
if %num_fol% gtr 0 cd.. & exit /b 0

set num_doc=0
for %%f in (*.epub,*.chm,*.cpp,*.pub,*.csv,*.cxx,*.doc,*.dot,*.dotm,*.dotx,*.h,*.hpp,*.htm,*.html,*.hxx,*.ini,*.java,*.lua,*.mht,*.mhtml,*.odt,*.pdf,*.potx,*.potm,*.ppam,*.ppsm,*.ppsx,*.pps,*.ppt,*.rtf,*.sldm,*.sldx,*.thmx,*.txt,*.vsd,*.wpd,*.wps,*.wri,*.xlam,*.xls,*.xltm,*.xltx,*.xml) do @(set /a num_doc+=1 > nul)
set num_prog=0
for %%f in (*.bat,*.cmd,*.exe,*.msi,*.msp,*.scr) do @(set /a num_prog+=1 > nul)
set num_vid=0
for %%f in (*.3g2,*.3gp,*.3gp2,*.3gpp,*.amr,*.amv,*.asf,*.avi,*.bdmv,*.bik,*.d2v,*.divx,*.drc,*.dsa,*.dsm,*.dss,*.dsv,*.evo,*.f4v,*.flc,*.fli,*.flic,*.flv,*.hdmov,*.ifo,*.ivf,*.m1v,*.m2p,*.m2t,*.m2ts,*.m2v,*.m4b,*.m4p,*.m4v,*.mkv,*.mp2v,*.mp4,*.mp4v,*.mpe,*.mpeg,*.mpg,*.mpls,*.mpv2,*.mpv4,*.mov,*.mts,*.ogm,*.ogv,*.pss,*.pva,*.qt,*.ram,*.ratdvd,*.rm,*.rmm,*.rmvb,*.roq,*.rpm,*.smil,*.smk,*.swf,*.tp,*.tpr,*.ts,*.vob,*.vp6,*.webm,*.wm,*.wmp,*.wmv) do @(set /a num_vid+=1 > nul)
set num_aud=0
for %%f in (*.mp3,*.wav,*.wma) do @(set /a num_aud+=1 > nul)
set num_pic=0
for %%f in (*.bmp,*.gif,*.ico,*.jpe,*.jpeg,*.jpg,*.pcx,*.png,*.psd,*.tga,*.tif,*.tiff,*.wmf) do @(set /a num_pic+=1 > nul)
set num_zip=0
for %%f in (*.7z,*.ace,*.arj,*.bz2,*.cab,*.gz,*.gzip,*.jar,*.r00,*.r01,*.r02,*.r03,*.r04,*.r05,*.r06,*.r07,*.r08,*.r09,*.r10,*.r11,*.r12,*.r13,*.r14,*.r15,*.r16,*.r17,*.r18,*.r19,*.r20,*.r21,*.r22,*.r23,*.r24,*.r25,*.r26,*.r27,*.r28,*.r29,*.rar,*.tar,*.tgz,*.z,*.zip) do @(set /a num_zip+=1 > nul)
set num_apk=0
for %%f in (*.apk) do @(set /a num_apk+=1 > nul)


::���� ���� ������ ������ ��� ���
echo.
echo %drive%
echo %num_all% = ������ ���
echo %num_doc% = ������
echo %num_prog% = ���� ����
echo %num_vid% = �����
echo %num_aud% = �����
echo %num_pic% = ������
echo %num_zip% = ������
echo %num_apk% = ���������
cd..
::��� ������ ����� �� �� ������ ������ �� ����� ����
::��� ����� ������ ������ ������� ������ �������
if %num_all%==%num_doc% if %num_all% gtr 0 if not %d_name% == "������" (md "������" & move %drive% "������")

if %num_all%==%num_prog% if %num_all% gtr 0 if not %d_name% == "���� ����" (md "���� ����" move %drive% "���� ����")

if %num_all%==%num_vid% if %num_all% gtr 0 if not %d_name% == "�����" (md "�����" & move %drive% "�����")

if %num_all%==%num_aud% if %num_all% gtr 0 if not %d_name% == "�����" (md "�����" & move %d_name% "�����")

if %num_all%==%num_pic% if %num_all% gtr 0 if not %d_name% == "������" (md "������" & move %drive% "������")

if %num_all%==%num_zip% if %num_all% gtr 0 if not %d_name% == "���� ������" (md "���� ������" & move %drive% "���� ������")

if %num_all%==%num_apk% if %num_all% gtr 0 if not %d_name% == "���� ����/���������" (md "���� ����/���������" & move %drive% "���� ����/���������")

exit /b 0


:end
echo.
echo.
echo.
echo                         !��� ������ ����� ����� ��� �� ���
pause>nul
cls
goto :start

::�����: nh.local11@gmail.com
