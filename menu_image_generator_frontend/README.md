# menu_image_generator_frontend

Flutter app that captures a menu image, extracts text using OpenAI Vision, generates dish images, and displays them.

## Setup

1) Install Flutter and platform toolchains.
2) Install dependencies:
   flutter pub get

3) Environment variables:
   - Copy `.env.example` to `.env`
   - Edit `.env` and set your OpenAI API key:

   OPENAI_API_KEY=sk-...

   The app uses `flutter_dotenv` to load this at startup. Do not commit real secrets.

4) Run the app:
   flutter run

If you change `.env`, restart the running app so variables reload.

## Notes

- The app no longer asks end users to input an API key. Keys are read from `.env`.
- Both image-to-text and image generation calls automatically include the Authorization header using the env key.
- If OPENAI_API_KEY is missing, the app shows a developer-friendly message; no input field will appear.
- Theme: Electric Orange — dark background with orange accents for a bold look.
