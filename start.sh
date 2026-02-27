#!/bin/bash

echo ""
echo "🫙  Savings Jar — OpNet OP_20"
echo "================================"
echo ""

# Check node
if ! command -v node &> /dev/null; then
  echo "❌  Node.js not found. Install from https://nodejs.org (v18+)"
  exit 1
fi

NODE_VER=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VER" -lt 18 ]; then
  echo "❌  Node.js v18+ required (you have $(node -v))"
  exit 1
fi

echo "✅  Node.js $(node -v) detected"

# Install deps if needed
if [ ! -d "node_modules" ]; then
  echo ""
  echo "📦  Installing dependencies..."
  npm install
fi

echo ""
echo "🚀  Starting dev server at http://localhost:3000"
echo ""
npm run dev
