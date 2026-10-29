# beets-audiobooks

[beets](https://beets.io) with the
[beets-audible](https://github.com/Neurrone/beets-audible) plugin for tagging
audiobooks, built on [linuxserver/beets](https://github.com/linuxserver/docker-beets).

A rebuild of [gtronset/beets-audiobooks](https://github.com/gtronset/beets-audiobooks)
(MIT, see `LICENSE`), whose last release is frozen on beets 2.2.0. Same recipe:
the linuxserver base, the plugins in `requirements.txt`, and upstream's
`defaults/config.yaml`.

## Image
`ghcr.io/casmith/beets-audiobooks:<version>` for amd64 and arm64.

## Updating
- The base image and pip pins are proposed by Dependabot.
- `beets-audible` pins a single beets minor (1.7.x needs 2.14.x). The build
  fails if the plugin pins would change the base image's beets version, so
  bump them together.
- Versions come from conventional commits (`feat:` → minor, `fix:` → patch)
  and are tagged by CI. Pull requests build and smoke-test without publishing.
