#!/bin/sh

# Inject Formatic keys
node 2>&1 << 'EOF'
const fs=require('fs');
const file = './src/config.js';
try {
  const before = fs.readFileSync(file, 'utf8');
  const after = before
   .replace(/\{\{MAINNET_FORTMATIC_KEY\}\}/g, `${process.env.MAINNET_FORTMATIC_KEY}`)
   .replace(/\{\{TESTNET_FORTMATIC_KEY\}\}/g, `${process.env.TESTNET_FORTMATIC_KEY}`);
  fs.writeFileSync(file, after, 'utf8')
} catch(e) { console.error(e); }
EOF

# Run the server
exec node ./node_modules/.bin/http-server -a 0.0.0.0 -p 5000 src
