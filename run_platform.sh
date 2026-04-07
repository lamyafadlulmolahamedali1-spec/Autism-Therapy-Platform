#!/bin/bash
# Suppress ALSA noise
export ALSA_CONFIG_PATH=/dev/null 2>/dev/null || true
export PYTHONWARNINGS=ignore
# Suppress Jack/ALSA to /dev/null
exec 2> >(grep -v "ALSA\|jack\|JackShm\|Cannot connect\|pcm_\|aplay\|Cannot open" >&2)
python3 autism_therapy_platform.py "$@"
