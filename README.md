# Metro App

A command-line application that calculates your Cairo Metro trip on the El-Marg line (Line 1).

## Features

- **Station lookup** — enter your start and stop stations; input is case-insensitive and ignores spaces, dashes, and underscores (`El-Marg`, `el_marg`, `EL MARG` all work).
- **Station count** — number of stops between the two stations.
- **Direction** — which terminus you're heading toward (Helwan / New El-Marg).
- **Estimated time** — based on the number of stops.
- **Ticket price** — priced by distance tiers.
- **Route** — the full list of stations from start to stop.

## Usage

```bash
dart run bin/metro_app.dart
```

Then enter your starting and stopping stations when prompted.

## Structure

- `bin/metro_app.dart` — entry point
- `bin/data/` — line data and station prompt helper
- `bin/models/` — station, line, and ticket models