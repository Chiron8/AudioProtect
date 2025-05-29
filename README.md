# AudioProtect

![image](https://github.com/Chiron8/AudioProtect/blob/master/image.png)

## Trying to protect your ears <3

A simple program that monitors output devices and the current volume to make sure percieved sound is at a safe volume

#### Requirements:

- PipeWire
- A notifaction daemon (e.g. Dunst or SwayNC)

#### Installation:

Clone the GitHub repo and run the install script:

```
git clone https://github.com/Chiron8/audioprotect
cd audioprotect
./install.sh
```

Make sure to run the command at startup:

e.g. Hyprland:

```
exec-once = audioprotect
```

---

> [!NOTE]
> More features will be coming soon!
