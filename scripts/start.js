#!/usr/bin/env node
const fs = require("fs");
const { spawn } = require("child_process");

const ENVFILE = `${__dirname}/../.env`;

if (!fs.existsSync(ENVFILE)) {
  console.error("🛠️  Please run 'pnpm setup' before running 'pnpm start'");
  process.exit(1);
}

spawn("pnpm", ["dev"], {
  stdio: "inherit",
  env: {
    ...process.env,
    npm_config_loglevel: "silent",
  },
  shell: true,
});
