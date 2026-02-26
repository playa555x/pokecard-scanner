# PokéScan — Setup Guide

## Voraussetzungen

- **Flutter** SDK: https://docs.flutter.dev/get-started/install/windows/mobile
- **Bun** (bereits installiert): `C:\Users\emir\.bun\bin\bun.exe`
- **Android Studio** (für Android-Emulator) oder echtes Gerät

---

## 1. Flutter installieren (falls noch nicht vorhanden)

```powershell
# Option A: Via winget
winget install Google.Flutter

# Option B: Manuell herunterladen
# https://docs.flutter.dev/get-started/install/windows/mobile
# ZIP entpacken nach C:\flutter
# PATH hinzufügen: C:\flutter\bin
```

Nach der Installation:
```bash
flutter doctor    # Prüft ob alles korrekt ist
flutter doctor --android-licenses   # Android-Lizenzen akzeptieren
```

---

## 2. Backend starten

```bash
cd C:/Users/emir/Projects/pokecard-scanner/backend

# .env erstellen
cp .env.example .env
# API Key eintragen (kostenlos unter https://pokemontcg.io/)

# Abhängigkeiten installieren
bun install

# Datenbank initialisieren
bun run db:init

# Development-Server starten
bun run dev
# → Backend läuft auf http://localhost:3000
```

---

## 3. Flutter App starten

```bash
cd C:/Users/emir/Projects/pokecard-scanner

# Abhängigkeiten installieren
flutter pub get

# Code generieren (Freezed, Riverpod, etc.)
flutter pub run build_runner build --delete-conflicting-outputs

# Gerät/Emulator wählen
flutter devices

# App starten
flutter run
```

---

## 4. Kostenlosen API-Key holen

1. Gehe zu https://pokemontcg.io/
2. Klicke auf "Get API Key"
3. Kostenlose Registrierung
4. Key in `backend/.env` eintragen: `POKEMON_TCG_API_KEY=dein_key`

**Limits:**
- Ohne Key: 1.000 Requests/Tag
- Mit kostenlosem Key: 20.000 Requests/Tag

---

## Architektur-Übersicht

```
pokecard-scanner/
├── lib/                          # Flutter App
│   ├── main.dart                 # Entry point
│   ├── core/
│   │   ├── theme/app_theme.dart  # Dark theme, Farben
│   │   └── router/app_router.dart
│   ├── features/
│   │   ├── scanner/              # Kamera + Karten-Erkennung
│   │   ├── card_detail/          # Preis-Charts, Trend-Analyse
│   │   ├── collection/           # Eigene Sammlung
│   │   └── market/               # Markt-Übersicht, Trending
│   └── shared/
│       ├── models/               # PokemonCard, Prices, etc.
│       ├── providers/            # Riverpod Providers
│       └── widgets/              # GlassCard, PriceChip, etc.
│
└── backend/                      # Bun + Hono.js
    └── src/
        ├── index.ts              # Server entry point
        ├── db/init.ts            # SQLite Schema
        ├── services/
        │   └── pokemon_api.ts    # pokemontcg.io (kostenlos)
        ├── routes/
        │   ├── cards.ts          # GET /api/cards/:id
        │   ├── scan.ts           # POST /api/scan/phash
        │   ├── collection.ts     # Sammlung verwalten
        │   └── market.ts         # Trending-Karten
        └── cron/
            └── price_tracker.ts  # Tägliche Preis-Snapshots
```

---

## Preis-Vorhersage

Die App baut automatisch eine eigene Preis-Datenbank auf:
- Täglich um 06:00 werden alle gescannten Karten von pokemontcg.io abgefragt
- TCGPlayer-Marktpreis + Cardmarket avg1/avg7/avg30 werden gespeichert
- Nach 7 Tagen: erste 7-Tage-Trends sichtbar
- Nach 30 Tagen: vollständige Trendanalyse

**Trend-Berechnung:**
- `+3%` in 30 Tagen → "Preis steigt" (grün)
- `-3%` in 30 Tagen → "Preis fällt" (rot)
- Dazwischen → "Preis stabil" (grau)
