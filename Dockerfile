FROM node:20-slim AS base
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev
COPY bot.js ./
RUN addgroup --system bot && adduser --system --ingroup bot bot
USER bot
CMD ["node", "bot.js"]
