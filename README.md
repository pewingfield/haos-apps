# HAOS Apps

A collection of Home Assistant OS apps by pewingfield.

Each app here is packaged to run as a native Home Assistant OS App, with ingress, persistent storage, and supervisor integration handled, so it installs and behaves like any official app from the App Store rather than a bolted-on container.

## Installation

Add this repository to your Home Assistant instance:

[![Open your Home Assistant instance and show the add app repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fpewingfield%2Fhaos-apps)

Or manually go to **Settings → Apps → App Store → three-dot menu → Repositories** and add:

```
https://github.com/pewingfield/haos-apps
```

The apps below will then appear in the App Store. Install the one you want, then start it.

## Available Apps

### LubeLogger

Self-hosted, open-source, web-based vehicle maintenance and fuel mileage tracker. Built on [LubeLogger by Hargata Softworks](https://lubelogger.com).

Packaged for Home Assistant OS, currently pinning **LubeLogger 1.6.4**:

* Compiled from upstream source on first build
* Full Home Assistant ingress (sidebar panel), no port forwarding required; also reachable on local port 8080
* Data persists across restarts, rebuilds, and HAOS backups

See the [LubeLogger app README](https://github.com/pewingfield/haos-apps/blob/main/lubelogger/README.md) for the full feature list and install steps.

### Bambuddy

Self-hosted print archive and management system for Bambu Lab 3D printers. Built on [Bambuddy by maziggy](https://github.com/maziggy/bambuddy).

Packaged for Home Assistant OS. The full upstream feature set (zero-config HA integration, auto-discovered MQTT, companion Slicer API apps, optional AI failure detection) is inherited from the upstream project and its HA wrapper. On top of that, this packaging adds external folder mounting so Bambuddy can reach NAS, USB, or network shares through Home Assistant (`media:rw` plus configurable `BAMBUDDY_EXTERNAL_ROOTS`).

See the [Bambuddy app README](https://github.com/pewingfield/haos-apps/blob/main/bambuddy/README.md) and [DOCS.md](https://github.com/pewingfield/haos-apps/blob/main/bambuddy/DOCS.md) for the full feature list, ports, and configuration.

> **Note:** Bambuddy runs in host network mode and is accessed directly at `http://<your-ha-ip>:8000` (no ingress). The frontend's fixed root-context paths and WebSocket connections are incompatible with HA's ingress iframe proxy.

## Repository structure

```
haos-apps/
├── lubelogger/     LubeLogger app
└── bambuddy/       Bambuddy app (see README.md and DOCS.md)
```

## Credits

This repository packages excellent upstream projects for Home Assistant OS:

* [LubeLogger](https://lubelogger.com) by Hargata Softworks
* [Bambuddy](https://github.com/maziggy/bambuddy) by maziggy

These are unofficial Home Assistant OS packagings and are not affiliated with or endorsed by the upstream projects.

## Licenses

Each app follows its upstream project's license:

* **LubeLogger** — MIT (Hargata Softworks)
* **Bambuddy** — AGPL-3.0 (maziggy); see [bambuddy/LICENSE](https://github.com/pewingfield/haos-apps/blob/main/bambuddy/LICENSE)

<!-- TODO: decide on and add a license for the packaging/wrapper code in this repo. Note that Bambuddy's AGPL-3.0 is copyleft. -->
