# HAOS Apps

A collection of Home Assistant OS add-ons by pewingfield.

## Installation

Add this repository to your Home Assistant instance:

[![Open your Home Assistant instance and show the add app repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fpewingfield%2Fhaos-apps)

Or manually go to **Settings** - **Add-ons** - **Add-on Store** - three-dot menu - **Repositories** and add:https://github.com/pewingfield/haos-apps

## Available Apps

### [LubeLogger](lubelogger/)

Self-hosted, open-source, web-based vehicle maintenance and fuel mileage tracker.

Built on [LubeLogger by Hargata Softworks](https://lubelogger.com).

## Notes

- Data persists across restarts and rebuilds via the HAOS backup system
- Port 8080 is accessible on your local network in addition to ingress
- No first-time setup required - just install and open the Web UI