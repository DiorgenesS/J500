.class public Lcom/android/server/NetPluginDelegate;
.super Ljava/lang/Object;
.source "NetPluginDelegate.java"


# static fields
.field private static final LOGV:Z = false

.field private static final TAG:Ljava/lang/String; = "ConnectivityExtension"

.field private static extensionFailed:Z

.field private static tetherExtensionClass:Ljava/lang/Class;

.field private static tetherExtensionObj:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    sput-object v0, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTetherStats(Landroid/net/NetworkStats;Landroid/net/NetworkStats;Landroid/net/NetworkStats;)V
    .locals 6

    invoke-static {}, Lcom/android/server/NetPluginDelegate;->loadTetherExtJar()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    sget-object v1, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    const-string/jumbo v2, "getTetherStats"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/net/NetworkStats;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Landroid/net/NetworkStats;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-class v4, Landroid/net/NetworkStats;

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sget-object v2, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string/jumbo v1, "ConnectivityExtension"

    const-string/jumbo v2, "error in invoke method"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static loadTetherExtJar()Z
    .locals 8

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string/jumbo v2, "com.qualcomm.qti.tetherstatsextension.TetherStatsReporting"

    const-string/jumbo v3, "/system/framework/ConnectivityExt.jar"

    sget-boolean v6, Lcom/android/server/NetPluginDelegate;->extensionFailed:Z

    if-nez v6, :cond_0

    sget-object v6, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    if-nez v6, :cond_0

    sget-object v6, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    if-nez v6, :cond_0

    :try_start_0
    new-instance v0, Ldalvik/system/PathClassLoader;

    const-string/jumbo v6, "/system/framework/ConnectivityExt.jar"

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    const-string/jumbo v6, "com.qualcomm.qti.tetherstatsextension.TetherStatsReporting"

    invoke-virtual {v0, v6}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    sget-object v6, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    sput-object v6, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    const/4 v6, 0x0

    sput-boolean v6, Lcom/android/server/NetPluginDelegate;->extensionFailed:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    sget-boolean v6, Lcom/android/server/NetPluginDelegate;->extensionFailed:Z

    if-eqz v6, :cond_1

    :goto_1
    return v4

    :catch_0
    move-exception v1

    const-string/jumbo v6, "ConnectivityExtension"

    const-string/jumbo v7, "Connectivity extension is not available"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean v5, Lcom/android/server/NetPluginDelegate;->extensionFailed:Z

    goto :goto_0

    :cond_1
    move v4, v5

    goto :goto_1
.end method

.method public static setQuota(Ljava/lang/String;J)V
    .locals 7

    invoke-static {}, Lcom/android/server/NetPluginDelegate;->loadTetherExtJar()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    sget-object v1, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    const-string/jumbo v2, "setQuota"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sget-object v2, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ConnectivityExtension"

    const-string/jumbo v2, "Error calling setQuota Method on extension jar"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static setUpstream(Landroid/net/Network;)V
    .locals 6

    invoke-static {}, Lcom/android/server/NetPluginDelegate;->loadTetherExtJar()Z

    :try_start_0
    sget-object v1, Lcom/android/server/NetPluginDelegate;->tetherExtensionClass:Ljava/lang/Class;

    const-string/jumbo v2, "setUpstream"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/net/Network;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sget-object v2, Lcom/android/server/NetPluginDelegate;->tetherExtensionObj:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ConnectivityExtension"

    const-string/jumbo v2, "Error calling setUpstream Method on extension jar"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
