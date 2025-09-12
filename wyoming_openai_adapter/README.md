# Wyoming OpenAI Adapter - Home Assistant Add-on

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

OpenAI-Compatible Proxy Middleware for the Wyoming Protocol as a Home Assistant add-on.

## About

This add-on provides a Wyoming protocol server that connects to OpenAI-compatible endpoints for Speech-to-Text (STT) and Text-to-Speech (TTS) services. It enables Home Assistant's Wyoming integration to use various OpenAI-compatible projects for voice processing.

This is a Home Assistant add-on version of the [Wyoming OpenAI project](https://github.com/roryeckel/wyoming-openai) by Rory Eckel.

## Features

- **STT (Speech-to-Text)**: Support for OpenAI's Whisper and compatible models
- **TTS (Text-to-Speech)**: Support for OpenAI's TTS models and compatible services
- **Multiple Backends**: OpenAI, Speaches, LocalAI, Kokoro-FastAPI
- **Streaming Support**: Both streaming and non-streaming transcription/synthesis
- **Flexible Configuration**: Support for custom API endpoints and model configurations

## Configuration

### Basic Configuration

```yaml
uri: tcp://0.0.0.0:10300
log_level: INFO
languages:
  - en
```

### STT Configuration

```yaml
stt:
  enabled: true
  openai_key: "your-api-key-here"
  openai_url: "https://api.openai.com/v1"
  models:
    - whisper-1
  streaming_models: []
  backend: OPENAI
  temperature: null
  prompt: ""
```

### TTS Configuration

```yaml
tts:
  enabled: true
  openai_key: "your-api-key-here"
  openai_url: "https://api.openai.com/v1"
  models:
    - tts-1
  voices:
    - alloy
    - echo
    - fable
    - onyx
    - nova
    - shimmer
  backend: OPENAI
  speed: null
  instructions: ""
  streaming_models: []
  streaming_min_words: null
  streaming_max_chars: null
```

## Usage

1. Install the add-on from the add-on store
2. Configure STT and/or TTS settings with your API keys and preferred models
3. Start the add-on
4. In Home Assistant, go to Settings > Devices & Services
5. Add the Wyoming Protocol integration
6. Configure it to use `tcp://addon_wyoming_openai_adapter:10300`
7. Set up your voice assistant pipeline to use the new STT/TTS services

## Supported Backends

- **OPENAI**: Official OpenAI API
- **SPEACHES**: Local Speaches service
- **LOCALAI**: LocalAI service for local deployment
- **KOKORO_FASTAPI**: Kokoro TTS service

## Authors & Contributors

Original Wyoming OpenAI project by Rory Eckel.
Home Assistant add-on adaptation.

## License

Apache License 2.0

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
