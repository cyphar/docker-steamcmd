## `docker-steamcmd` ##

`docker-steamcmd` is a Docker image that contains [`steamcmd`][steamcmd] which
is a proprietary tool for downloading SteamApps. The reason I've written this
is so that you can download your game assets from steam, and hopefully use them
in free software engines. In my case, I needed to download the Morrowind (Elder
Scrolls) game assets so I could use them with the [free software implementation
of the Morrowind engine called OpenMW][openmw].

In general, I urge people to not use proprietary software (and this downloader
**is proprietary**), but as there is no current free software downloader for
Steam (and you only need to download the game assets **once** in the case of
Morrowind) I decided to just make this anyway. At least this is somewhat better
than allowing Steam to carpet-bomb your filesystem with crap.

[steamcmd]: https://developer.valvesoftware.com/wiki/SteamCMD
[openmw]: https://openmw.org/en/
