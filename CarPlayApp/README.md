# Kawwa CarPlay (Swift / iOS)

Minimale CarPlay-App mit Tab-Leiste: **Ziele** (Liste + Alert) und **Aktionen** (Raster).

## Einrichten
1. In Xcode: *File → New → Project → iOS App* (Swift, UIKit), Name `KawwaCarPlay`.
2. Den Inhalt von `Sources/` ins Projekt kopieren (die Standard-`AppDelegate`/`SceneDelegate` ersetzen).
3. Die Einträge aus `Info-Scenes.plist` in die `Info.plist` übernehmen.
4. `App.entitlements` als Entitlements-Datei zuweisen.

## CarPlay-Entitlement (wichtig)
Apple erlaubt CarPlay nur mit genehmigtem Entitlement: <https://developer.apple.com/carplay/> beantragen.
Je nach App-Typ den Schlüssel in `App.entitlements` ändern:
`carplay-audio`, `carplay-communication`, `carplay-navigation`, `carplay-parking`,
`carplay-charging`, `carplay-fueling`, `carplay-quick-ordering`, `carplay-driving-task`.
Die erlaubten Templates hängen vom Typ ab (z. B. Grid/List für Quick-Ordering).

## Testen
Xcode → Simulator starten → *I/O → External Displays → CarPlay*.
