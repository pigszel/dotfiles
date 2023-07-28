# pigszel / dotfiles

## Prerequisite

1. [Homebrew](https://brew.sh) telepítése:
   - `$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Homebrew package-ek telepítése
   - `$ brew install stow nvim tmux tpm tree fzf`
3. fzf hasznos keybindingok telepítése
   - `$ $(brew --prefix)/opt/fzf/install`

## Használat

### 1) Repository lokációja

Klónozzuk a repository-t közvetlenül a home könyvtárunkba, majd navigáljunk bele.

### 2) Symlinkelés stow-val

Itt a stow paranccsal linkeljük be a konfigurációs fájlokat (git, nvim, tmux és zshrc) a home könyvtárba:

```
$ stow git nvim tmux zshr
```

### 3) nvim konfiguráció

Navigáljunk a symlinkelt nvim konfigurációs fájljaihoz:

```
cd ~/.config/nvim
```

Lépjünk be vimmel (`$ vim .`), majd navigáljunk a `lua/benji/setup-plugins.lua` fájlhoz.

Ezután már csak source-olni kell a fájlt (`:so`), majd Packerrel installálni a csomagokat: `:PackerSync`

### 4) tmux konfiguráció

Nyissuk meg vimmel a symlinkelt konfigurációs fájlt (`$ cd ~/.tmux.conf`), majd a default prefix key (Ctrl + b) és nagy I megnyomásával telepítsük a package-eket és alkalmazzuk a beállításokat.

Innentől a prefix a Ctrl + a lesz.

Ahhoz, hogy használni tudjuk az Alt + számmal való ablakváltást tmuxban, iTermben a baloldali Option keyt át kell állítanunk: [iterm-keys.png](/documents/iterm-keys.png)


### 5) tmux-sessionizer shell command

Egész egyszerűen symlinkeljük be `t` néven:

```
ln -s ~/dotfiles/scripts/tmux-sessionizer /usr/local/bin/t
```

Ezután a terminálban elérhetővé válik a tmux-sessionizer a `t` parancsot kiadva.

### 6) tmux-sessionizer shell command alternatíva

Ha valami miatt a fenti `/usr/local/bin` mappa írásvédett és nincs hozzáférésünk, akkor a home mappába készítsünk egy `bin` mappát, és ide symlinkeljük be:

```
ln -s ~/dotfiles/scripts/tmux-sessionizer ~/bin/t
```

## Mi az az nvim.backup?

Ez lényegében az első próbálkozásom a nvim setupolásával. Hibrid megoldás [Josean Martinez](https://github.com/josean-dev/dev-environment-files) és [ThePrimeagen](https://github.com/ThePrimeagen/init.lua) konfigjaiból, szerintem szuper kiindulási alap.

## TODOS

- [ ] automatikus telepítés és fájlok linkelés Ansible-le
- [ ] tmux-sessionizer tmux-on kívül sokszor "Client not found." hibaüzenetet dob
