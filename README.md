# claude reel effects

these are the seven effects from my `/effects` reel, and claude code makes them for you on your own laptop. you pick a few seconds of a clip, tell claude which effect you want, and you get back a 1080x1920 mp4 that you can drop straight into your edit.

made by [@getgitgirl](https://instagram.com/getgitgirl).

| effect | what it does |
|---|---|
| **clothesline** | a twine line with wooden pegs hangs behind you, your things clipped to it and a big word behind the line. reach up and one item comes off in your hand |
| **light trail** | a fine white line with a soft glow traces round your outline |
| **text behind** | one big word sits behind you, so your head covers part of it |
| **reel wall** | frosted glass tiles of your past reels drift up and down behind you |
| **tiny me** | a small, real copy of you perches on your own shoulder and talks along |
| **reel fan** | an open book of your past reels flips its pages above your clip |
| **iphone** | your clip plays in an iphone that shrinks to the side while a hand-drawn wireframe draws itself on |

> heads up, i've only tested this on a mac, so windows and linux are untested for now.

## what you need

- a mac
- [claude code](https://claude.com/claude-code) (a paid claude plan)
- a short clip of you talking to camera. a vertical phone video works best
- about 3 GB of free space, and wifi while it renders (it loads the fonts and animation library from the web)

## install

new to all this? open the **terminal** app and paste these one at a time.

1. homebrew (skip it if you already have it), then ffmpeg and node:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   ```bash
   brew install ffmpeg node
   ```
2. download this repo and run the setup:
   ```bash
   git clone https://github.com/nicolapocock/claude-reel-effects.git ~/claude-reel-effects
   ```
   ```bash
   bash ~/claude-reel-effects/setup.sh
   ```

setup checks your tools, makes a little python environment for the cut-out model, and installs the skill into claude code.

already use claude code? open it and paste:

```
install the reel-effects skill from github.com/nicolapocock/claude-reel-effects and run its setup.sh
```

## use it

1. put your clip in a folder and open claude code in that folder
2. ask for an effect:
   - "give this clip the clothesline effect" (drag the clip in)
   - "text behind me, the word 'launch', from 4 seconds in"
   - "tiny me on my left shoulder"
3. claude picks a good moment if you don't give one, renders it and checks the frames
4. the mp4 lands in the same folder, ready for capcut or wherever you edit

each one takes a couple of minutes, and most of that is claude cutting you out of every single frame.

## make it yours

the first time you run them they use plain placeholder tiles and tags, so you can see how each one looks before you bring your own stuff. then swap in yours:

- reel wall and reel fan: a folder of screenshots of your reels. "use the screenshots in my-reels for the wall"
- clothesline: cut-out pngs of your things (your mic, your lipstick, a sticker of your face). claude can cut them out of photos for you. "cut these out and hang them on the clothesline, and i pull off the third one"
- iphone: draw your own wireframe at [excalidraw.com](https://excalidraw.com). claude knows how the frame needs to be set up, so ask it to walk you through it
- colours and words: "make the glow blue", "the big word should say 'ship it'"

## what's in here

- `skills/reel-effects/SKILL.md` tells claude how to run each effect and what to check
- `skills/reel-effects/scripts/fx.py` does all seven effects
- `skills/reel-effects/scripts/tiny.py` builds the tiny me
- `skills/reel-effects/assets/` holds the peg, the iphone and a sample wireframe

everything runs on your laptop, so your clip never gets uploaded anywhere.

## if you get stuck

- if it says "ffmpeg not found" or "npx not found", run step 1 of the install again
- if the cut-out is messy round your hair, ask for the cleaner model ("use birefnet"). it's slower but really tidy
- if the word covers your face, ask claude to move it up or make it smaller
- for anything else, paste the error into claude code and ask it to fix it

## credits

the cut-out is [rembg](https://github.com/danielgatis/rembg), the animation is [hyperframes](https://github.com/heygen-com/hyperframes) and [gsap](https://gsap.com), and the fonts are urbanist and space mono from google fonts. the wireframe font is excalifont from [excalidraw](https://excalidraw.com).

MIT licence, so use it for your own reels or your clients'.
