#!/usr/bin/with-contenv bashio
set -e

# Get configuration values from Home Assistant options
URI=$(bashio::config 'uri')
LOG_LEVEL=$(bashio::config 'log_level')
LANGUAGES=$(bashio::config 'languages | join(" ")')

# STT Configuration
STT_ENABLED=$(bashio::config 'stt.enabled')
STT_OPENAI_KEY=""
STT_OPENAI_URL=""
STT_MODELS=""
STT_STREAMING_MODELS=""
STT_BACKEND=""
STT_TEMPERATURE=""
STT_PROMPT=""

if bashio::var.true "${STT_ENABLED}"; then
    STT_OPENAI_KEY=$(bashio::config 'stt.openai_key')
    STT_OPENAI_URL=$(bashio::config 'stt.openai_url')
    STT_MODELS=$(bashio::config 'stt.models | join(" ")')
    STT_STREAMING_MODELS=$(bashio::config 'stt.streaming_models | join(" ")')
    if bashio::config.exists 'stt.backend'; then
        STT_BACKEND=$(bashio::config 'stt.backend')
    fi
    if bashio::config.exists 'stt.temperature'; then
        STT_TEMPERATURE=$(bashio::config 'stt.temperature')
    fi
    if bashio::config.exists 'stt.prompt'; then
        STT_PROMPT=$(bashio::config 'stt.prompt')
    fi
fi

# TTS Configuration  
TTS_ENABLED=$(bashio::config 'tts.enabled')
TTS_OPENAI_KEY=""
TTS_OPENAI_URL=""
TTS_MODELS=""
TTS_VOICES=""
TTS_BACKEND=""
TTS_SPEED=""
TTS_INSTRUCTIONS=""
TTS_STREAMING_MODELS=""
TTS_STREAMING_MIN_WORDS=""
TTS_STREAMING_MAX_CHARS=""

if bashio::var.true "${TTS_ENABLED}"; then
    TTS_OPENAI_KEY=$(bashio::config 'tts.openai_key')
    TTS_OPENAI_URL=$(bashio::config 'tts.openai_url')
    TTS_MODELS=$(bashio::config 'tts.models | join(" ")')
    TTS_VOICES=$(bashio::config 'tts.voices | join(" ")')
    TTS_STREAMING_MODELS=$(bashio::config 'tts.streaming_models | join(" ")')
    if bashio::config.exists 'tts.backend'; then
        TTS_BACKEND=$(bashio::config 'tts.backend')
    fi
    if bashio::config.exists 'tts.speed'; then
        TTS_SPEED=$(bashio::config 'tts.speed')
    fi
    if bashio::config.exists 'tts.instructions'; then
        TTS_INSTRUCTIONS=$(bashio::config 'tts.instructions')
    fi
    if bashio::config.exists 'tts.streaming_min_words'; then
        TTS_STREAMING_MIN_WORDS=$(bashio::config 'tts.streaming_min_words')
    fi
    if bashio::config.exists 'tts.streaming_max_chars'; then
        TTS_STREAMING_MAX_CHARS=$(bashio::config 'tts.streaming_max_chars')
    fi
fi

# Build command line arguments
ARGS=(
    "--uri" "${URI}"
    "--log-level" "${LOG_LEVEL}"
    "--languages" ${LANGUAGES}
)

# Add STT arguments if enabled
if bashio::var.true "${STT_ENABLED}"; then
    if [[ -n "${STT_OPENAI_KEY}" ]]; then
        ARGS+=("--stt-openai-key" "${STT_OPENAI_KEY}")
    fi
    if [[ -n "${STT_OPENAI_URL}" ]]; then
        ARGS+=("--stt-openai-url" "${STT_OPENAI_URL}")
    fi
    if [[ -n "${STT_MODELS}" ]]; then
        ARGS+=("--stt-models" ${STT_MODELS})
    fi
    if [[ -n "${STT_STREAMING_MODELS}" ]]; then
        ARGS+=("--stt-streaming-models" ${STT_STREAMING_MODELS})
    fi
    if [[ -n "${STT_BACKEND}" ]]; then
        ARGS+=("--stt-backend" "${STT_BACKEND}")
    fi
    if [[ -n "${STT_TEMPERATURE}" ]]; then
        ARGS+=("--stt-temperature" "${STT_TEMPERATURE}")
    fi
    if [[ -n "${STT_PROMPT}" ]]; then
        ARGS+=("--stt-prompt" "${STT_PROMPT}")
    fi
fi

# Add TTS arguments if enabled
if bashio::var.true "${TTS_ENABLED}"; then
    if [[ -n "${TTS_OPENAI_KEY}" ]]; then
        ARGS+=("--tts-openai-key" "${TTS_OPENAI_KEY}")
    fi
    if [[ -n "${TTS_OPENAI_URL}" ]]; then
        ARGS+=("--tts-openai-url" "${TTS_OPENAI_URL}")
    fi
    if [[ -n "${TTS_MODELS}" ]]; then
        ARGS+=("--tts-models" ${TTS_MODELS})
    fi
    if [[ -n "${TTS_VOICES}" ]]; then
        ARGS+=("--tts-voices" ${TTS_VOICES})
    fi
    if [[ -n "${TTS_STREAMING_MODELS}" ]]; then
        ARGS+=("--tts-streaming-models" ${TTS_STREAMING_MODELS})
    fi
    if [[ -n "${TTS_BACKEND}" ]]; then
        ARGS+=("--tts-backend" "${TTS_BACKEND}")
    fi
    if [[ -n "${TTS_SPEED}" ]]; then
        ARGS+=("--tts-speed" "${TTS_SPEED}")
    fi
    if [[ -n "${TTS_INSTRUCTIONS}" ]]; then
        ARGS+=("--tts-instructions" "${TTS_INSTRUCTIONS}")
    fi
    if [[ -n "${TTS_STREAMING_MIN_WORDS}" ]]; then
        ARGS+=("--tts-streaming-min-words" "${TTS_STREAMING_MIN_WORDS}")
    fi
    if [[ -n "${TTS_STREAMING_MAX_CHARS}" ]]; then
        ARGS+=("--tts-streaming-max-chars" "${TTS_STREAMING_MAX_CHARS}")
    fi
fi

bashio::log.info "Starting Wyoming OpenAI Adapter with args: ${ARGS[*]}"

# Run the Wyoming OpenAI adapter
exec python3 -m wyoming_openai_adapter "${ARGS[@]}"