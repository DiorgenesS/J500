.class public abstract Lcom/android/server/pm/UserContentObserver;
.super Landroid/database/ContentObserver;
.source "UserContentObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/UserContentObserver$1;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UserContentObserver"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mUpdateRunnable:Ljava/lang/Runnable;

.field private mUserSwitchObserver:Landroid/app/IUserSwitchObserver;


# direct methods
.method static synthetic -get0(Lcom/android/server/pm/UserContentObserver;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/android/server/pm/UserContentObserver;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/pm/UserContentObserver;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/android/server/pm/UserContentObserver;->mUpdateRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    new-instance v0, Lcom/android/server/pm/UserContentObserver$1;

    invoke-direct {v0, p0}, Lcom/android/server/pm/UserContentObserver$1;-><init>(Lcom/android/server/pm/UserContentObserver;)V

    iput-object v0, p0, Lcom/android/server/pm/UserContentObserver;->mUserSwitchObserver:Landroid/app/IUserSwitchObserver;

    iput-object p1, p0, Lcom/android/server/pm/UserContentObserver;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/server/pm/UserContentObserver$2;

    invoke-direct {v0, p0}, Lcom/android/server/pm/UserContentObserver$2;-><init>(Lcom/android/server/pm/UserContentObserver;)V

    iput-object v0, p0, Lcom/android/server/pm/UserContentObserver;->mUpdateRunnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method protected observe()V
    .locals 3

    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/pm/UserContentObserver;->mUserSwitchObserver:Landroid/app/IUserSwitchObserver;

    invoke-interface {v1, v2}, Landroid/app/IActivityManager;->registerUserSwitchObserver(Landroid/app/IUserSwitchObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "UserContentObserver"

    const-string/jumbo v2, "Unable to register user switch observer!"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .locals 0

    invoke-virtual {p0}, Lcom/android/server/pm/UserContentObserver;->update()V

    return-void
.end method

.method protected unobserve()V
    .locals 3

    :try_start_0
    iget-object v1, p0, Lcom/android/server/pm/UserContentObserver;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/server/pm/UserContentObserver;->mUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/pm/UserContentObserver;->mUserSwitchObserver:Landroid/app/IUserSwitchObserver;

    invoke-interface {v1, v2}, Landroid/app/IActivityManager;->unregisterUserSwitchObserver(Landroid/app/IUserSwitchObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "UserContentObserver"

    const-string/jumbo v2, "Unable to unregister user switch observer!"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected abstract update()V
.end method
