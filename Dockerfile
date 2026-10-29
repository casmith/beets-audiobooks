# Rebuild of gtronset/beets-audiobooks (MIT, see LICENSE) on a current
# linuxserver/beets base. Upstream's last release (2.2.0-ba12, 2025-05) is
# frozen on beets 2.2.0; its main branch is ahead but unreleased.
FROM lscr.io/linuxserver/beets:2.14.1-ls357

# beets-audible pins a single beets minor (1.7.x needs beets 2.14.x), so bump
# it together with the base image.
COPY requirements.txt .
# Fail the build if satisfying the plugin pins would change the base image's
# beets version (pip would otherwise quietly downgrade it).
RUN before="$(pip3 show beets | sed -n 's/^Version: //p')" \
    && pip3 install -U --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine/ \
       -r requirements.txt \
    && after="$(pip3 show beets | sed -n 's/^Version: //p')" \
    && if [ "$before" != "$after" ]; then \
         echo "beets changed from $before to $after: align requirements.txt with the base image" >&2; exit 1; \
       fi

# Default config, as upstream ships it.
COPY defaults/ defaults
