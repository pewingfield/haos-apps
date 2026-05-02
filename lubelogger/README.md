# LubeLogger for Home Assistant OS

Self-hosted, open-source, web-based vehicle maintenance and fuel mileage tracker, packaged as a Home Assistant OS add-on.

[![Open your Home Assistant instance and show the dashboard of an add-on.](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=lubelogger&repository_url=https%3A%2F%2Fgithub.com%2Fpewingfield%2Fhaos-apps)

## Features

- Track vehicle maintenance, fuel mileage, and expenses
- Multi-vehicle support
- Reminder system for upcoming maintenance
- Backup and restore support
- Full Home Assistant ingress support - no port forwarding required
- Data persists across restarts, rebuilds, and HAOS backups

## Installation

1. Add the HAOS Apps repository to your Home Assistant instance:

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fpewingfield%2Fhaos-apps)

2. Find LubeLogger in the add-on store under **HAOS Apps**
3. Click **Install**
4. Click **Start**
5. Click **Open Web UI**

## Notes

- Port 8080 is exposed on your local network in addition to the ingress panel
- Data is stored in the HAOS addon data directory and included in HAOS backups
- LubeLogger also has a built-in backup feature that downloads to your local computer
- First build takes several minutes as it compiles LubeLogger from source
- After enabling authentication in LubeLogger settings, the add-on must be restarted before login credentials will be accepted

## Credits

LubeLogger is developed by [Hargata Softworks](https://lubelogger.com) and licensed under the MIT License.

- Website: https://lubelogger.com
- Documentation: https://docs.lubelogger.com
- GitHub: https://github.com/hargata/lubelog

This add-on is an unofficial HAOS packaging of LubeLogger and is not affiliated with or endorsed by Hargata Softworks.
