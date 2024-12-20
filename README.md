# SketchyBar Config

This repository is my personal configuration for [SketchyBar](https://github.com/FelixKratz/SketchyBar), a macOS plugin to customize the top menu bar. My configuration is largely derived from and built upon [this repository](https://github.com/FelixKratz/dotfiles).

![SketchyBar Config Appearance](demo.png)

## Notable Enhancements

In addition to possessing all the features of the aforementioned configuration, this also offers the following improvements:

- **Battery Health** information, displayed when the Battery Widget is clicked.
- Redesigned **Calendar Widget** that takes up less space and opens Google Calendar when clicked.
- **Clipboard Widget** that displays up to five of your last copied items. Clicking an item re-copies it.
- Improved **Media Widget**, with superior play/pause functionality.
- **Restart Widget** to refresh SketchyBar; useful for development.
- **RAM Widget** that displays the current RAM utilization, along with a graph.
- **Weather Widget** that displays current temperature and conditions, with a pop-up menu displaying semi-hourly forecast for the next two days.

## Installation

1. Install [Homebrew](https://brew.sh/).

2. Run the following script, sourced from [this repository](https://github.com/FelixKratz/dotfiles):

```bash
curl -L https://raw.githubusercontent.com/FelixKratz/dotfiles/master/install_sketchybar.sh | sh
```

3. Run the following command to clone this repository and have it overwrite the SketchyBar configuration:

```
git clone https://github.com/TheGoldenPatrik1/sketchybar-config $HOME/.config/sketchybar
```

4. Restart SketchyBar:

```
brew services restart sketchybar
```

## Weather Data

The Weather Widget draws from [wttr.in](https://github.com/chubin/wttr.in), which automatically determines your location based on IP address. However, their IP-to-location mapping mechanism is unreliable, especially when using a VPN. To recieve accurate location-based weather data, set up one or both of the following:

- Install [this simple shortcut](https://www.icloud.com/shortcuts/6d1018c04fe2490cb241425d8f133e0c) to get your location. This will be used as the default location-finding service to pass to wttr.in. Currently, the Weather Widget only supports locations in the United States. Additionally, beware that the shortcut does not always work, resulting in annoying notifications that cannot be disabled.
- Set up a `data/weather.txt` file containing a location to pass to wttr.in as a fallback for when the Shortcut doesn't work or isn't installed. You can use any data that wttr.in accepts, but, in the United States, best results are usually achieved with `City+State` where `State` is the full name of the state and not an abbrevation (e.g., `Chicago+Illinois`).
