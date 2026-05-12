@echo off
chcp 65001 >nul
title OtthonTér Árelemző
color 0A

echo ============================================================
echo   OtthonTér Árelemző — Lokális indítás
echo ============================================================
echo.

REM Ellenőrizzük, hogy a Python elérhető-e
python --version >nul 2>&1
if errorlevel 1 (
    echo [HIBA] A Python nincs telepítve vagy nincs a PATH-on.
    echo.
    echo Telepítsd innen: https://www.python.org/downloads/
    echo Telepítéskor pipáld be: "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

REM Virtual environment létrehozása, ha még nincs
if not exist .venv (
    echo [1/3] Virtuális környezet létrehozása...
    python -m venv .venv
    if errorlevel 1 (
        echo [HIBA] A venv létrehozása nem sikerült.
        pause
        exit /b 1
    )
)

REM Aktiválás
echo [2/3] Virtuális környezet aktiválása...
call .venv\Scripts\activate.bat

REM Függőségek telepítése (csak ha még nincs telepítve a streamlit)
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo [3/3] Függőségek telepítése... (csak első indításkor, kb. 1-2 perc^)
    pip install -r requirements.txt --quiet --disable-pip-version-check
) else (
    echo [3/3] Függőségek már telepítve.
)

echo.
echo ============================================================
echo   Az alkalmazás indul...
echo   A böngésző automatikusan megnyílik a http://localhost:8501 címen.
echo   Leállításhoz nyomd meg a Ctrl+C billentyűkombinációt.
echo ============================================================
echo.

streamlit run app.py

pause
