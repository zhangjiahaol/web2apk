# APK安装问题解决方案

## 问题描述
在手机上安装APK时可能遇到以下问题：
1. packageinfo is null
2. 无效安装包
3. 与操作系统不兼容

## 解决方案

### 1. 项目配置更新
已对项目进行了以下更新：

#### build.gradle 更新
- 更新 compileSdk 和 targetSdk 到 34
- 添加多架构支持 (armeabi-v7a, arm64-v8a, x86, x86_64)
- 添加签名配置
- 更新依赖库版本
- 添加打包选项避免冲突

#### AndroidManifest.xml 更新
- 添加 Android 13+ 权限支持
- 添加硬件特性声明
- 添加配置变更处理
- 添加 targetApi 声明

#### 网络安全配置更新
- 添加服务器IP支持
- 添加用户证书支持

### 2. 构建步骤

#### 方法一：使用批处理脚本
```bash
# 双击运行
build-apk.bat
```

#### 方法二：手动构建
```bash
# 清理项目
./gradlew clean

# 构建debug版本
./gradlew assembleDebug

# 构建release版本
./gradlew assembleRelease
```

### 3. 安装前检查

#### 手机端设置
1. **开启未知来源应用安装**
   - 设置 → 安全 → 未知来源
   - 或设置 → 应用 → 特殊应用访问 → 安装未知应用

2. **检查Android版本**
   - 确保Android版本 >= 5.0 (API 21)
   - 推荐Android 8.0+

3. **清理缓存**
   - 设置 → 应用 → 包安装器 → 清除数据

#### APK文件检查
1. **文件完整性**
   - 确保APK文件完整下载
   - 检查文件大小是否正常

2. **重新下载**
   - 如果文件损坏，重新下载APK

### 4. 常见问题解决

#### packageinfo is null
- **原因**：AndroidManifest.xml配置问题或签名问题
- **解决**：已更新AndroidManifest.xml和签名配置

#### 无效安装包
- **原因**：APK文件损坏或签名问题
- **解决**：
  1. 重新构建APK
  2. 检查文件传输是否完整
  3. 使用正确的签名配置

#### 与操作系统不兼容
- **原因**：SDK版本不兼容
- **解决**：
  1. 已更新minSdk为21 (Android 5.0)
  2. 已更新targetSdk为34
  3. 添加多架构支持

### 5. 调试建议

#### 使用ADB安装
```bash
# 连接手机并启用USB调试
adb install app-debug.apk

# 查看安装日志
adb logcat | grep -i "package"
```

#### 检查APK信息
```bash
# 查看APK详细信息
aapt dump badging app-debug.apk

# 查看APK权限
aapt dump permissions app-debug.apk
```

### 6. 版本兼容性

#### 支持的Android版本
- **最低版本**：Android 5.0 (API 21)
- **目标版本**：Android 14 (API 34)
- **推荐版本**：Android 8.0+

#### 支持的CPU架构
- armeabi-v7a (32位ARM)
- arm64-v8a (64位ARM)
- x86 (32位Intel)
- x86_64 (64位Intel)

### 7. 联系支持
如果问题仍然存在，请提供：
1. 手机型号和Android版本
2. 具体的错误信息
3. APK构建日志
4. 安装时的详细错误截图 