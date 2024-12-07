# SketchyBar Config

This repository is my personal configuration for [SketchyBar](https://github.com/FelixKratz/SketchyBar), a macOS plugin to customize the top menu bar. My configuration is largely derived from [this repository](https://github.com/FelixKratz/dotfiles).

## Notable Enhancements

- **Battery Health** information, displayed when the Battery Widget is clicked.
- Redesigned **Calendar Widget** that takes up less space and opens Google Calendar when clicked.
- **Clipboard Widget** that displays up to five of your last copied items. Clicking an item re-copies it.
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