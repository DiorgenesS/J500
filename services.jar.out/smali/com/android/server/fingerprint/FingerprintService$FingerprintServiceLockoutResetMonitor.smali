.class Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;
.super Ljava/lang/Object;
.source "FingerprintService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/fingerprint/FingerprintService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FingerprintServiceLockoutResetMonitor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor$1;
    }
.end annotation


# instance fields
.field private final mCallback:Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;

.field private final mRemoveCallbackRunnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/android/server/fingerprint/FingerprintService;


# direct methods
.method public constructor <init>(Lcom/android/server/fingerprint/FingerprintService;Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;)V
    .locals 1

    iput-object p1, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor$1;

    invoke-direct {v0, p0}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor$1;-><init>(Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;)V

    iput-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->mRemoveCallbackRunnable:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->mCallback:Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;

    return-void
.end method


# virtual methods
.method public sendLockoutReset()V
    .locals 6

    iget-object v2, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->mCallback:Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;

    if-eqz v2, :cond_0

    :try_start_0
    iget-object v2, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->mCallback:Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;

    iget-object v3, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-static {v3}, Lcom/android/server/fingerprint/FingerprintService;->-get3(Lcom/android/server/fingerprint/FingerprintService;)J

    move-result-wide v4

    invoke-interface {v2, v4, v5}, Landroid/hardware/fingerprint/IFingerprintServiceLockoutResetCallback;->onLockoutReset(J)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v1

    const-string/jumbo v2, "FingerprintService"

    const-string/jumbo v3, "Failed to invoke onLockoutReset: "

    invoke-static {v2, v3, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v2, "FingerprintService"

    const-string/jumbo v3, "Death object while invoking onLockoutReset: "

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v2, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    iget-object v2, v2, Lcom/android/server/fingerprint/FingerprintService;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceLockoutResetMonitor;->mRemoveCallbackRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
