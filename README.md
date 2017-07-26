# Youlikium

Youlikium is a script that automates clicking like button on given set of Youtube videos using selenium.

## Usage

```sh
youlikium <file>
```

This will open Youtube website in Firefox, where you should log in.
`file` should contain video entries, one per line. Supported formats are:
- `youtube-dl` generated file name in form `<title>-<video-id>.<ext>`
- youtube video url `https://www.youtube.com/watch?v=<video-id>`

For each video from `file` `Youlikium` will open video url in browser and ask whether you want to like this video.
