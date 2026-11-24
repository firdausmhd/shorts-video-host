# shorts-video-host

# YouTube auto-upload: findings (updated 2026-11-24)

- Windsor.ai connector is linked to the channel (youtube account 115880) and offers `upload_video` (needs a PUBLIC video_url, max 100 MB, supports made_for_kids, privacy private/unlisted/public, publish_at scheduling for private videos).
- Windsor `upload_files` does NOT work for upload_video (it only serves actions with requires_files=true).
- Sandbox files have no public URL, so videos must be hosted somewhere public first.
- GitHub MCP `create_or_update_file` only writes text and would corrupt .mp4 files. Use `gh`/git instead.
- GitHub reconnect done by user (gh token works as firdausmhd), BUT scheduled runs are bound to a fixed repository set: creating/pushing to a new repo (firdausmhd/shorts-temp-host) was refused by the git proxy. No repo was created.
- To unblock: in a new chat on claude.ai, create a public repo for the videos, add it (and every repo the task needs) to the task, and replace this scheduled task with a new one made in that chat. Alternative: a public storage bucket the sandbox can write to.
- When unblocked: push videos, upload as PRIVATE (or scheduled) first, made_for_kids=true, title/description/tags from upload-metadata.md. Until then: deliver files + metadata for manual upload.
