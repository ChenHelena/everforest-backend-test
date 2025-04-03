# 使用完整的 Node.js 基礎映像檔（Debian 基礎）
FROM node:20.11.1

# 設定容器內的工作目錄 /app
WORKDIR /app

# 複製 package 檔案並安裝依賴 (提高快取命中率)
COPY package*.json ./

# 安裝所有依賴（包括開發依賴）
RUN npm install

# 安裝 hot reload 工具，方便開發過程中熱重載
RUN npm install -g nodemon

# 複製所有原始碼進容器
COPY . .

# 開放容器內的 port 供外部訪問
EXPOSE ${PORT}

# 使用 nodemon 來啟動應用程式（支援熱重載）
CMD ["nodemon", "./bin/www.js"]
