# 🧠 智能备忘盒 — Android APK

**Smart Memo Box** — 一个像真实抽屉一样管理备忘的 Android 应用。

数据全部保存在本地（localStorage），不需要注册账号。

---

## 📦 获取 APK 的方法

### 方法一（推荐）：GitHub Actions 自动构建

1. 将本项目推送到 GitHub
2. 进入 GitHub 仓库 → **Actions** → **Build Android APK** → **Run workflow**
3. 等待几分钟，构建完成后下载 `smart-memo-box-apk` 工件
4. 解压获取 `app-debug.apk` 安装到安卓手机

### 方法二：本地手动构建（需要 Android Studio）

**前置条件：**
- **[JDK 17+](https://adoptium.net/)**
- **[Android Studio](https://developer.android.com/studio)**
  - 安装时勾选 **Android SDK**
  - 确保环境变量 `ANDROID_HOME` 已设置

**构建步骤：**

```bash
# 1. 进入 android 目录
cd android

# 2. Windows 双击 build.bat，或执行：
gradlew assembleDebug

# 3. APK 生成位置：
#    android/app/build/outputs/apk/debug/app-debug.apk
```

或在 **Android Studio** 中：
1. File → Open → 选择 `android/` 目录
2. 等待 Gradle 同步完成
3. Build → Build Bundle(s) / APK(s) → Build APK(s)

### 方法三：在线工具（无需安装）

使用 **[AppMaker.xyz](https://appmaker.xyz)** 或 **[PWABuilder](https://pwabuilder.com)**：
1. 部署 `www/` 目录到任意静态托管（如 [Netlify](https://netlify.com)）
2. 将网址粘贴到上述工具 → 生成 APK

---

## 🔧 项目结构

```
20260527-01/
├── www/                    # Web 前端源码（离线可用的 HTML+CSS+JS）
│   ├── index.html          # 主页面
│   └── tailwind.css        # 本地打包的 Tailwind CSS（离线支持）
├── android/                # Android 原生项目源码
│   ├── build.gradle        # 根构建配置
│   ├── gradlew             # Gradle Wrapper（Linux/macOS）
│   ├── gradlew.bat         # Gradle Wrapper（Windows）
│   ├── build.bat           # 一键构建脚本（Windows）
│   └── app/
│       └── src/main/       # Android 应用源码
└── .github/workflows/      # GitHub Actions 自动构建
```

## 📱 应用功能

- ✅ 新建/编辑/删除备忘抽屉
- ✅ 搜索备忘名称或内容
- ✅ 密码保护（加密抽屉）
- ✅ 本地存储（数据不丢失）
- ✅ 离线使用
- ✅ 暗色主题 / 木纹 UI
- ⌨️ 快捷键：`Ctrl+N` 新建抽屉，`Esc` 关闭弹窗

## 🔄 更新 Web 内容

修改 `www/index.html` 后，运行以下命令同步到 Android 项目：

```bash
npx cap copy android
```

## ℹ️ 技术信息

- **引擎：** Apache Capacitor（Android WebView 原生封装）
- **UI 框架：** Tailwind CSS
- **最低 SDK：** Android 7.0 (API 24)
- **目标 SDK：** Android 16 (API 36)
- **包名：** `com.smartmemo.app`
