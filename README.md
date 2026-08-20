# Metro App

A command-line application that calculates your Cairo Metro trip across the full network: Line 1 (El-Marg), Line 2 (Shubra El-Kheima), Line 3 (Adly Mansour / Rod El-Farag), and the Line 3 Cairo University branch.

## Features

- **Station lookup** — enter your start and stop stations; input is case-insensitive and ignores spaces, dashes, dots, and underscores (`El-Marg`, `el_marg`, `EL MARG` all work).
- **Shortest route** — finds the fewest-stop route across all lines using breadth-first search (BFS).
- **Transfer markers** — stations where you change lines are marked `(change)` in the route.
- **Station count** — number of stops between the two stations.
- **Direction** — the terminus you're heading toward on the first leg of the trip.
- **Estimated time** — based on the number of stops.
- **Ticket price** — priced by distance tiers.

## Usage

```bash
dart run bin/metro_app.dart
```

Then enter your starting and stopping stations when prompted.

Example:

```
What are your starting station? el-marg
What are your stoping station? dokki

number of stations => 17
direction => Helwan
estimated time => 38.25 min
price => 15, ticket duration => 2 hours
Route => El-Marg => ... => Sadat (change) => Opera => Dokki
```

## Structure

- `bin/metro_app.dart` — entry point
- `bin/data/` — line data files and station prompt helper
- `bin/models/` — station, line, and ticket models
- `bin/services/metro_graph.dart` — graph construction, BFS shortest path, and direction
- `bin/utils/normalize.dart` — input normalization helper
