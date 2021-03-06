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

### Usage ###

First, build the Docker image:

```
% docker build -t steamcmd .
[ lots of output ]
```

You can now use the commandline interface as normal:

```
% docker run -it -v /where/you/want/to/stash/stuff:/opt/data --name steam --rm steamcmd
[ lots of output ]
Steam> [enter commands]
```

`steamcmd` also allows you to one-line everything, like so (the AppID I used is
for the GoTY Morrowind game):

```
% docker run -it -v /where/you/want/to/stash/stuff:/opt/data --name steam --rm steamcmd +login username password +force_install_dir /opt/data +@sSteamCmdForcePlatformType windows +app_update 22320 validate +quit
[ lots of output ]
% # everything is now in /opt/data/...
```

I won't be publishing this on the Docker hub because I'm not going to
explicitly support proprietary software. This is just a convenience for people
who want to get their game data without needing to worry about how to set up
and then purge steam. To purge everything:

```
% docker rm -f steam
% docker rmi steamcmd:latest
```

### License ###

This project (if it can even be called that since it's basically a shell
script) is licensed under the MIT/X11 License:

```
Copyright (c) 2016 Aleksa Sarai

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

* The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
