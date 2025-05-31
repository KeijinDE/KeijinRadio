# KeijinRadio

![MIT License](https://img.shields.io/badge/license-MIT-green)

🎧 Radio-Streaming for Turtle WoW (1.12.x)

---

## 📻 About / Über das Addon

**EN:**  
KeijinRadio is a lightweight, in-game radio player for **Turtle WoW Classic (v1.12.x)**.  
It allows you to stream curated **HTTP MP3 radio stations** directly from within the game.  
Perfect for background music while roleplaying, questing, or relaxing in Stormwind.

**DE:**  
KeijinRadio ist ein schlankes Ingame-Radio für **Turtle WoW Classic (v1.12.x)**.  
Es ermöglicht das direkte Abspielen ausgewählter **HTTP MP3-Radiosender** im Spiel.  
Ideal für Hintergrundmusik beim Questen, Rollenspielen oder beim Entspannen in Ironforge.

---

## 🎵 Features / Funktionen

- Works with direct **HTTP MP3 streams** (⚠️ no HTTPS)
- Simple UI with dropdown station selector
- Toggle button to **Play / Stop**
- **Mute checkbox** to stop audio without changing stations
- Fully compatible with Turtle WoW's 1.12 engine limitations

---

## ⚠ Limitations / Einschränkungen

- ❌ No HTTPS support  
- ❌ No playlist files or local directory scanning  
- ✅ Only direct `.mp3` stream URLs supported (via `PlayMusic()`)

---

## 📦 Installation

1. Download the latest ZIP from the [Releases](https://github.com/KeijinDE/KeijinRadio/releases) tab.
2. Extract it so the folder path looks exactly like this:

```
World of Warcraft\_classic_\Interface\AddOns\KeijinRadio\
├── main.lua
├── ui.lua
├── streams.lua
├── KeijinRadio.toc
├── LICENSE
└── Docs\
    ├── changelog.txt
    ├── devnotes.txt
    └── readme.md
```

> ⚠️ Make sure **no additional folder levels** are created during extraction (e.g. `KeijinRadio-main/KeijinRadio/` is invalid!)

---

## 🧪 Usage

- Use the slash command `/radio` in-game to toggle the radio interface.
- Select a station from the dropdown to start playback.
- Use **Stop** to pause or **Mute** to silence temporarily.

---

## 🧑‍💻 License

**MIT License**  
Developed with 💚 by **Keijin**  
Not affiliated with Blizzard Entertainment or the Turtle WoW team.
