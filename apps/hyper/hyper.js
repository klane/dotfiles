// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"MesloLGS Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: '#000',

    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',

    // border color (window, tabs)
    borderColor: '#333',

    // custom CSS to embed in the main window
    css: '',

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '/usr/local/bin/fish',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: false,

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    quickEdit: true,

    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: 'vertical',

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    // for advanced config flags please refer to https://hyper.is/#cfg

    // plugin settings

    hyperWindowSize: {
      width: 900,
      height: 700,
      startX: 50,
      startY: 50
    },

    opacity: {
      focus: 0.85,
      blur: 0.5
    },

    hypercwd: {
      initialWorkingDirectory: '~'
    },

    hyperStatusLine: {
      dirtyColor: 'salmon',
      aheadColor: 'ivory',
      footerTransparent: false,
    },

    hyperSearchUI: {
      inputBorderRadius: 15,
      buttonBorderRadius: 15
    },

    hyperTabs: {
      activityPulse: true,
      activityColor: 'salmon',
      border: true,
      closeAlign: 'left',
      tabIcons: false,
      tabIconsColored: false,
      trafficButtons: false,
    },

    tabIcons: {
      activeStyle: {
        display: 'inline-block',
        marginRight: '0.25rem',
        transition: 'opacity 200ms ease-in',
        verticalAlign: 'middle',
        width: '1rem'
      },
      inactiveStyle: {
        display: 'inline-block',
        marginRight: '0.25rem',
        transition: 'opacity 200ms ease-in',
        verticalAlign: 'middle',
        width: '1rem',
        opacity: 0.5,
      },
      mapIcons: {
        ruby: ['brew']
      },
      mapColors: {
        brew: '#D8494F'
      },
      disableColors: false
    },

    paneNavigation: {
      debug: false,
      hotkeys: {
        navigation: {
          up: 'ctrl+alt+up',
          down: 'ctrl+alt+down',
          left: 'ctrl+alt+left',
          right: 'ctrl+alt+right'
        },
        jump_prefix: 'ctrl+alt', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'meta+enter'
      },
      showIndicators: true, // Show pane number
      indicatorPrefix: '^⌥', // Will be completed with pane number
      indicatorStyle: { // Added to indicator <div>
        position: 'absolute',
        top: 0,
        left: 0,
        fontSize: '10px'
      },
      focusOnMouseHover: true,
      inactivePaneOpacity: 0.2 // Set to 1 to disable inactive panes dimming
    },

    hyperCustomTouchbar: [
      // if you just need a single button then don't add options array
      { command: 'exit', label: 'exit', backgroundColor: '#d13232' },
      { command: 'clear', label: 'clear', backgroundColor: '#d13232' },
      { command: 'cd ~', icon: '/Users/klane/Pictures/icons8-home.png' },
      { command: 'cd ~/Desktop', icon: '/Users/klane/Pictures/icons8-computer.png' },
      { command: 'cd ~/Documents', icon: '/Users/klane/Pictures/icons8-documents.png' },
      { command: 'cd ~/Downloads', icon: '/Users/klane/Pictures/icons8-download.png' },
      {
        icon: '/Users/klane/Pictures/icons8-beer.png',
        options: [
          { label: 'cellar', command: 'cd /usr/local/Cellar', icon: '/Users/klane/Pictures/icons8-beer.png' },
          { label: 'caskroom', command: 'cd /usr/local/Caskroom', icon: '/Users/klane/Pictures/icons8-wooden_beer_keg.png' }
        ]
      },
      {
        icon: '/Users/klane/Pictures/icons8-git.png',
        options: [
          { label: 'status', command: 'git status' },
          { label: 'diff', command: 'git diff', icon: '/Users/klane/Pictures/icons8-diff_files.png' },
          { label: 'log', command: 'git log -n 5', icon: '/Users/klane/Pictures/icons8-note.png' },
          { label: 'add', command: 'git add .', icon: '/Users/klane/Pictures/icons8-add_list.png' },
          { label: 'push', command: 'git push', icon: '/Users/klane/Pictures/icons8-upload.png' },
          { label: 'pull', command: 'git pull', icon: '/Users/klane/Pictures/icons8-download.png' },
          { label: 'clone', command: 'git clone ', prompt: true },
        ]
      }
    ],
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // theme
    'hyper-chesterish',

    // display
    'hyper-dark-scrollbar',
    'hyper-opacity',
    'hyper-window-size',

    // behavior
    'hypercwd',
    'hyper-pane',
    'hyper-quit',

    // tabs
    'hyper-tabs-enhanced',
    'hyper-tab-icons-plus',

    // extensions
    'hyper-custom-touchbar',
    'hyper-search',
    'hyper-statusline',

    // fun
    'hyperpower'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
