.class Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;
.super Landroid/database/ContentObserver;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/backup/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ProvisionedObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/backup/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/backup/BackupManagerService;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 6

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-boolean v1, v2, Lcom/android/server/backup/BackupManagerService;->mProvisioned:Z

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v2}, Lcom/android/server/backup/BackupManagerService;->deviceIsProvisioned()Z

    move-result v0

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    if-nez v1, :cond_1

    :goto_0
    iput-boolean v0, v2, Lcom/android/server/backup/BackupManagerService;->mProvisioned:Z

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v2, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-boolean v2, v2, Lcom/android/server/backup/BackupManagerService;->mProvisioned:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    if-eqz v1, :cond_2

    :cond_0
    :goto_1
    monitor-exit v3

    return-void

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-boolean v2, v2, Lcom/android/server/backup/BackupManagerService;->mEnabled:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v2, v2, Lcom/android/server/backup/BackupManagerService;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/server/backup/KeyValueBackupJob;->schedule(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$ProvisionedObserver;->this$0:Lcom/android/server/backup/BackupManagerService;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Lcom/android/server/backup/BackupManagerService;->scheduleNextFullBackupJob(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method
