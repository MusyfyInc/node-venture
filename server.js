import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = Number(process.env.PORT || 8080);

// Serve the built Vite output
const distDir = path.join(__dirname, 'dist');
app.use(express.static(distDir));

// SPA fallback (React Router / client-side routes)
app.get('*', (_req, res) => {
  res.sendFile(path.join(distDir, 'index.html'));
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
