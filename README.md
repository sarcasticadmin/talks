# Sarcasticadmin's Talks

Repo contains all source and scripts for my talks. Talks are generated using the [latex beamer class](https://www.overleaf.com/learn/latex/Beamer)
and [nix](https://nixos.org/).

Docs are presented using [pdfpc](https://pdfpc.github.io/)

## Talks

- 2022-07-30 - [SCaLE 19x - Building SCaLE's OpenWrt Conference WiFi](https://www.socallinuxexpo.org/scale/19x/presentations/building-scales-openwrt-conference-wifi) - [Slides](https://github.com/sarcasticadmin/talks/releases/download/2023.01.01/openwrt-at-scale-slides.pdf) + [Video](https://youtu.be/lsdlp8jMFiY?t=1608)

## Build

To build all the slides:

```
nix build .#all-slides
```
> The `result` will include all the slides generated from this repo
