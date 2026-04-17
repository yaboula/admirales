# Admirales Dev - Modern Clothing UI

This is a complete architectural and visual refactor of the `ad-appearance` (formerly `qb-clothing`) NUI. Migrated by **Admirales Dev** from legacy jQuery/Bootstrap to a blazing-fast React + Vite SPA.

## 🚀 Key Features

*   **Modern React SPA:** Built with React, TypeScript, and Vite for optimal performance and rapid development. No more clunky, unmaintainable jQuery.
*   **Immersive Glassmorphism:** Custom tailored transparent UI adhering to the latest design trends. Pure CSS backdrop filters and smooth CSS animations replace the ugly solid black backgrounds of older scripts.
*   **Military Green Aesthetics:** A custom tailored highly professional deep dark-green accent (`#166534`) to represent our premium brand.
*   **UX/UI Overhaul:**
    *   **Smooth Camera Drags:** Mouse-drag rotational controls have been engineered to replace static, slow rotation buttons.
    *   **Direct Model Input:** Replaced exhausting endless click arrows with sleek numeric inputs – players can directly type `84` to instantly skip to dress 84.
    *   **English Localization:** Refactored structure translates legacy and mismatched translations strictly to English for general scaling (Face Mix, Shape Mix, Mother, Father).
*   **Bug Free Architecture:**
    *   Resolved `saveSkin` base character override bugs.
    *   Resolved FiveM Chromium Engine Artifacts (solid black squares caused by improper tailwind rendering in CEF).
    *   Fixed empty generic categorizations.

## 💻 Tech Stack
*   **Core:** React 18, React DOM
*   **Build Tool:** Vite
*   **Styling:** Tailwind CSS (Dark Mode preset, completely transparent body layering)
*   **Icons:** Lucide React

## 📦 How to Build / Maintain

All UI source code is located securely inside the `/ui/` directory.

1.  Navigate to the UI folder:
    ```bash
    cd ui
    ```
2.  Install dependencies (if it's your first time):
    ```bash
    npm install
    ```
3.  Build the project to export to FiveM:
    ```bash
    npm run build
    ```
    *Vite is configured to automatically inject the compiled assets directly into the `/html/` directory, maintaining 100% compatibility with FiveM server asset streams.*

4.  On your FiveM Server:
    ```bash
    ensure ad-appearance
    ```

---
*Developed with ❤️ by Admirales Dev*
