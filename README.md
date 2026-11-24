# shorts-video-host

Public host for daily YouTube Shorts (kids brain games). Videos pushed here get a
public raw URL that the Windsor.ai YouTube `upload_video` action uses to upload to the channel.

## Layout
- `videos/YYYY-MM-DD/*.mp4` - rendered 1080x1920 shorts (each under 100 MB)
- `scripts/publish.sh` - copy, commit, push and print raw URLs
- Metadata (title/description/tags) lives in the Claude project doc `upload-metadata.md`

## Daily flow
1. Brainstorm, render, check frames (3 videos).
2. `scripts/publish.sh 2026-11-25 short_*.mp4` -> prints public URLs.
3. Windsor `upload_video` per URL: made_for_kids=true, privacy private (or scheduled via publish_at) first, then public.
4. Log the run in the project's `daily-log.md`.

## Notes
- Repo must stay public so raw URLs are reachable.
- Never commit secrets or tokens here.
