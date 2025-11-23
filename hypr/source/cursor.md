#### Fix Cursor Theme for Qt Applications
-   create a directory ```~/.local/share/icons/default```
-   create `index.theme` file and add the following to it:
```
[icon theme]
Inherits = Bibata-Modern-Ice
```

-   copy the `default` directory to `~/.icons`   
```
[Appearance]
icon_theme=Bibata-Modern-Ice
```
-   write the above config to `~/.config/qt5ct/qt5ct.conf` and `~/.config/qt6ct/qt6ct.conf` files.
