# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# WebView相关
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# 保持WebView相关类
-keep class android.webkit.** { *; }

# 保持应用主类
-keep class com.app.adtu.MainActivity { *; }

# 保持Activity相关
-keep class * extends android.app.Activity { *; }

# 保持Fragment相关
-keep class * extends android.app.Fragment { *; }

# 保持View相关
-keep class * extends android.view.View { *; }

# 保持网络相关
-keep class * implements java.io.Serializable { *; }

# 保持JSON相关
-keep class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# 保持枚举
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 保持native方法
-keepclasseswithmembernames class * {
    native <methods>;
}

# 保持自定义控件
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# 保持Parcelable
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

# 保持R文件
-keep class **.R$* {
    public static <fields>;
}