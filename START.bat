@echo off
title PokeScan - Setup und Start
color 0A
echo.
echo  ██████╗  ██████╗ ██╗  ██╗███████╗███████╗ ██████╗ █████╗ ███╗   ██╗
echo  ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝██╔════╝██╔════╝██╔══██╗████╗  ██║
echo  ██████╔╝██║   ██║█████╔╝ █████╗  ███████╗██║     ███████║██╔██╗ ██║
echo  ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ╚════██║██║     ██╔══██║██║╚██╗██║
echo  ██║     ╚██████╔╝██║  ██╗███████╗███████║╚██████╗██║  ██║██║ ╚████║
echo  ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝
echo.
echo  Pokemon Karten Scanner - Setup und Start
echo  ==========================================
echo.

:: Check if .env exists
if not exist "backend\.env" (
    echo [1/4] .env Datei erstellen...
    copy "backend\.env.example" "backend\.env" >nul
    echo.
    echo  WICHTIG: Bitte deinen kostenlosen API Key eintragen!
    echo  Kostenlos holen unter: https://pokemontcg.io/
    echo  Datei: backend\.env
    echo  Zeile: POKEMON_TCG_API_KEY=DEIN_KEY_HIER
    echo.
    pause
)

:: Check Bun
where bun >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Bun nicht gefunden!
    echo Installiere Bun: https://bun.sh
    pause
    exit /b 1
)

:: Install backend deps
echo [2/4] Backend-Abhaengigkeiten installieren...
cd backend
call bun install
if %errorlevel% neq 0 (
    echo [ERROR] bun install fehlgeschlagen!
    pause
    exit /b 1
)

:: Init database
echo [3/4] Datenbank initialisieren...
call bun run db:init
cd ..

:: Check Flutter
where flutter >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  Flutter nicht gefunden!
    echo  Installiere Flutter: https://docs.flutter.dev/get-started/install/windows/mobile
    echo.
    echo  Danach ausfuehren:
    echo    flutter pub get
    echo    flutter run
    echo.
) else (
    echo [4/4] Flutter-Abhaengigkeiten installieren...
    call flutter pub get
)

:: Start backend
echo.
echo  Backend wird gestartet auf http://localhost:3000
echo  Zum Beenden: Strg+C
echo.
cd backend
call bun run dev
