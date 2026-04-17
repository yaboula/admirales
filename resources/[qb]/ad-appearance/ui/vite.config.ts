import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    outDir: '../html',
    emptyOutDir: true,
  },
  base: './', // Use relative paths for FiveM NUI
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
