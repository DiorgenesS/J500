.class Lcom/android/server/backup/BackupManagerService$BackupHandler;
.super Landroid/os/Handler;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/backup/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackupHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/backup/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/backup/BackupManagerService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 43

    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    iput-wide v12, v3, Lcom/android/server/backup/BackupManagerService;->mLastBackupPass:J

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/backup/BackupManagerService;->mCurrentTransport:Ljava/lang/String;

    invoke-static {v3, v9}, Lcom/android/server/backup/BackupManagerService;->-wrap4(Lcom/android/server/backup/BackupManagerService;Ljava/lang/String;)Lcom/android/internal/backup/IBackupTransport;

    move-result-object v4

    if-nez v4, :cond_1

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Backup requested but no transport available"

    invoke-static {v3, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    const/4 v12, 0x0

    iput-boolean v12, v3, Lcom/android/server/backup/BackupManagerService;->mBackupRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v9

    throw v3

    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v7, v3, Lcom/android/server/backup/BackupManagerService;->mJournal:Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    if-lez v3, :cond_3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_1
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/backup/BackupManagerService$BackupRequest;

    move-object/from16 v0, v23

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    monitor-exit v9

    throw v3

    :cond_2
    :try_start_2
    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v12, "clearing pending backups"

    invoke-static {v3, v12}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    const/4 v12, 0x0

    iput-object v12, v3, Lcom/android/server/backup/BackupManagerService;->mJournal:Ljava/io/File;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_3
    monitor-exit v9

    const/16 v41, 0x1

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    :try_start_3
    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v5

    new-instance v2, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-direct/range {v2 .. v7}, Lcom/android/server/backup/BackupManagerService$PerformBackupTask;-><init>(Lcom/android/server/backup/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/lang/String;Ljava/util/ArrayList;Ljava/io/File;)V

    const/16 v3, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v2}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    :goto_2
    if-nez v41, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    const/4 v12, 0x0

    iput-boolean v12, v3, Lcom/android/server/backup/BackupManagerService;->mBackupRunning:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    monitor-exit v9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    :catch_0
    move-exception v25

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Transport became unavailable attempting backup"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v41, 0x0

    goto :goto_2

    :cond_4
    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Backup requested but nothing pending"

    invoke-static {v3, v9}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v41, 0x0

    goto :goto_2

    :catchall_2
    move-exception v3

    monitor-exit v9

    throw v3

    :pswitch_2
    :try_start_5
    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Lcom/android/server/backup/BackupManagerService$BackupRestoreTask;

    invoke-interface {v10}, Lcom/android/server/backup/BackupManagerService$BackupRestoreTask;->execute()V
    :try_end_5
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v26

    const-string/jumbo v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Invalid backup task in flight, obj="

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :pswitch_3
    :try_start_6
    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Lcom/android/server/backup/BackupManagerService$BackupRestoreTask;

    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->arg1:I

    invoke-interface {v10, v3}, Lcom/android/server/backup/BackupManagerService$BackupRestoreTask;->operationComplete(I)V
    :try_end_6
    .catch Ljava/lang/ClassCastException; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v26

    const-string/jumbo v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Invalid completion in flight, obj="

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :pswitch_4
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v31, v0

    check-cast v31, Lcom/android/server/backup/BackupManagerService$FullBackupParams;

    new-instance v8, Lcom/android/server/backup/BackupManagerService$PerformAdbBackupTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v31

    iget-object v10, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v0, v31

    iget-boolean v12, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->includeApks:Z

    move-object/from16 v0, v31

    iget-boolean v13, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->includeObbs:Z

    move-object/from16 v0, v31

    iget-boolean v14, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->includeShared:Z

    move-object/from16 v0, v31

    iget-boolean v15, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->doWidgets:Z

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->curPassword:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->allApps:Z

    move/from16 v18, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->includeSystem:Z

    move/from16 v19, v0

    move-object/from16 v0, v31

    iget-boolean v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->doCompress:Z

    move/from16 v20, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->packages:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v22, v0

    invoke-direct/range {v8 .. v22}, Lcom/android/server/backup/BackupManagerService$PerformAdbBackupTask;-><init>(Lcom/android/server/backup/BackupManagerService;Landroid/os/ParcelFileDescriptor;Landroid/app/backup/IFullBackupRestoreObserver;ZZZZLjava/lang/String;Ljava/lang/String;ZZZ[Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    new-instance v3, Ljava/lang/Thread;

    const-string/jumbo v9, "adb-backup"

    invoke-direct {v3, v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    :pswitch_5
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/server/backup/BackupManagerService$PerformFullTransportBackupTask;

    new-instance v3, Ljava/lang/Thread;

    const-string/jumbo v9, "transport-backup"

    move-object/from16 v0, v42

    invoke-direct {v3, v0, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    :pswitch_6
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v35, v0

    check-cast v35, Lcom/android/server/backup/BackupManagerService$RestoreParams;

    const-string/jumbo v3, "BackupManagerService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "MSG_RUN_RESTORE observer="

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v35

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v10, Lcom/android/server/backup/BackupManagerService$PerformUnifiedRestoreTask;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v35

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v35

    iget-object v13, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v35

    iget-wide v14, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->token:J

    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->pkgInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v16, v0

    move-object/from16 v0, v35

    iget v0, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->pmToken:I

    move/from16 v17, v0

    move-object/from16 v0, v35

    iget-boolean v0, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->isSystemRestore:Z

    move/from16 v18, v0

    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$RestoreParams;->filterSet:[Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-direct/range {v10 .. v19}, Lcom/android/server/backup/BackupManagerService$PerformUnifiedRestoreTask;-><init>(Lcom/android/server/backup/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/app/backup/IRestoreObserver;JLandroid/content/pm/PackageInfo;IZ[Ljava/lang/String;)V

    const/16 v3, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v10}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v39

    move-object/from16 v0, p0

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :pswitch_7
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v33, v0

    check-cast v33, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;

    new-instance v11, Lcom/android/server/backup/BackupManagerService$PerformAdbRestoreTask;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v33

    iget-object v13, v0, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v33

    iget-object v14, v0, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;->curPassword:Ljava/lang/String;

    move-object/from16 v0, v33

    iget-object v15, v0, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v16, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullRestoreParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v17, v0

    invoke-direct/range {v11 .. v17}, Lcom/android/server/backup/BackupManagerService$PerformAdbRestoreTask;-><init>(Lcom/android/server/backup/BackupManagerService;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/IFullBackupRestoreObserver;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    new-instance v3, Ljava/lang/Thread;

    const-string/jumbo v9, "adb-restore"

    invoke-direct {v3, v11, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    :pswitch_8
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v29, v0

    check-cast v29, Lcom/android/server/backup/BackupManagerService$ClearParams;

    new-instance v3, Lcom/android/server/backup/BackupManagerService$PerformClearTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v29

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$ClearParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v29

    iget-object v13, v0, Lcom/android/server/backup/BackupManagerService$ClearParams;->packageInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {v3, v9, v12, v13}, Lcom/android/server/backup/BackupManagerService$PerformClearTask;-><init>(Lcom/android/server/backup/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/content/pm/PackageInfo;)V

    invoke-virtual {v3}, Lcom/android/server/backup/BackupManagerService$PerformClearTask;->run()V

    goto/16 :goto_0

    :pswitch_9
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v30, v0

    check-cast v30, Lcom/android/server/backup/BackupManagerService$ClearRetryParams;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v30

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$ClearRetryParams;->transportName:Ljava/lang/String;

    move-object/from16 v0, v30

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$ClearRetryParams;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v9, v12}, Lcom/android/server/backup/BackupManagerService;->clearBackupData(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_7
    new-instance v37, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    move-object/from16 v0, v37

    invoke-direct {v0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    monitor-exit v9

    new-instance v3, Lcom/android/server/backup/BackupManagerService$PerformInitializeTask;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v37

    invoke-direct {v3, v9, v0}, Lcom/android/server/backup/BackupManagerService$PerformInitializeTask;-><init>(Lcom/android/server/backup/BackupManagerService;Ljava/util/HashSet;)V

    invoke-virtual {v3}, Lcom/android/server/backup/BackupManagerService$PerformInitializeTask;->run()V

    goto/16 :goto_0

    :catchall_3
    move-exception v3

    monitor-exit v9

    throw v3

    :pswitch_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v12, v3, Lcom/android/server/backup/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v12

    :try_start_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->arg1:I

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    move v9, v3

    :goto_3
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v13, v9, v3}, Lcom/android/server/backup/BackupManagerService;->recordInitPendingLocked(ZLjava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-static {v3}, Lcom/android/server/backup/BackupManagerService;->-get1(Lcom/android/server/backup/BackupManagerService;)Landroid/app/AlarmManager;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/backup/BackupManagerService;->mRunInitIntent:Landroid/app/PendingIntent;

    const/4 v13, 0x0

    invoke-virtual {v3, v13, v14, v15, v9}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    monitor-exit v12

    goto/16 :goto_0

    :cond_5
    const/4 v3, 0x0

    move v9, v3

    goto :goto_3

    :catchall_4
    move-exception v3

    monitor-exit v12

    throw v3

    :pswitch_c
    const/16 v40, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;

    :try_start_9
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v3}, Lcom/android/internal/backup/IBackupTransport;->getAvailableRestoreSets()[Landroid/app/backup/RestoreSet;

    move-result-object v40

    move-object/from16 v0, v34

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    monitor-enter v9
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    :try_start_a
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    move-object/from16 v0, v40

    iput-object v0, v3, Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;->mRestoreSets:[Landroid/app/backup/RestoreSet;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    :try_start_b
    monitor-exit v9

    if-nez v40, :cond_6

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    const/16 v9, 0xb0f

    invoke-static {v9, v3}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    :cond_6
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v3, :cond_7

    :try_start_c
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v40

    invoke-interface {v3, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_c
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_c} :catch_5
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4

    :cond_7
    :goto_4
    const/16 v3, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    const/16 v3, 0x8

    const-wide/32 v12, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v12, v13}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    :catchall_5
    move-exception v3

    :try_start_d
    monitor-exit v9

    throw v3
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    :catch_3
    move-exception v27

    :try_start_e
    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Error from transport getting set list"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v3, :cond_8

    :try_start_f
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v40

    invoke-interface {v3, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_f} :catch_7
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_6

    :cond_8
    :goto_5
    const/16 v3, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    const/16 v3, 0x8

    const-wide/32 v12, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v12, v13}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    :catch_4
    move-exception v27

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Restore observer threw"

    move-object/from16 v0, v27

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    :catch_5
    move-exception v38

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Unable to report listing to observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :catch_6
    move-exception v27

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Restore observer threw"

    move-object/from16 v0, v27

    invoke-static {v3, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    :catch_7
    move-exception v38

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v9, "Unable to report listing to observer"

    invoke-static {v3, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :catchall_6
    move-exception v3

    move-object/from16 v0, v34

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v9, :cond_9

    :try_start_10
    move-object/from16 v0, v34

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v40

    invoke-interface {v9, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_10} :catch_9
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_8

    :cond_9
    :goto_6
    const/16 v9, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->removeMessages(I)V

    const/16 v9, 0x8

    const-wide/32 v12, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12, v13}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/backup/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v9}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v3

    :catch_8
    move-exception v27

    const-string/jumbo v9, "BackupManagerService"

    const-string/jumbo v12, "Restore observer threw"

    move-object/from16 v0, v27

    invoke-static {v9, v12, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :catch_9
    move-exception v38

    const-string/jumbo v9, "BackupManagerService"

    const-string/jumbo v12, "Unable to report listing to observer"

    invoke-static {v9, v12}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :pswitch_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, p1

    iget v9, v0, Landroid/os/Message;->arg1:I

    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v9, v12}, Lcom/android/server/backup/BackupManagerService;->handleTimeout(ILjava/lang/Object;)V

    goto/16 :goto_0

    :pswitch_e
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    monitor-enter v9

    :try_start_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    if-eqz v3, :cond_a

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v12, "Restore session timed out; aborting"

    invoke-static {v3, v12}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    invoke-virtual {v3}, Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;->markTimedOut()V

    new-instance v3, Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v12, v12, Lcom/android/server/backup/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v14, v14, Lcom/android/server/backup/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;

    invoke-direct {v3, v12, v13, v14}, Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;-><init>(Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;Lcom/android/server/backup/BackupManagerService;Lcom/android/server/backup/BackupManagerService$ActiveRestoreSession;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/server/backup/BackupManagerService$BackupHandler;->post(Ljava/lang/Runnable;)Z
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    :cond_a
    monitor-exit v9

    goto/16 :goto_0

    :catchall_7
    move-exception v3

    monitor-exit v9

    throw v3

    :pswitch_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v9, v3, Lcom/android/server/backup/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    monitor-enter v9

    :try_start_12
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v12, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lcom/android/server/backup/BackupManagerService$FullParams;

    if-eqz v32, :cond_c

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v12, "Full backup/restore timed out waiting for user confirmation"

    invoke-static {v3, v12}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, v32

    invoke-virtual {v3, v0}, Lcom/android/server/backup/BackupManagerService;->signalFullBackupRestoreCompletion(Lcom/android/server/backup/BackupManagerService$FullParams;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v12, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v12}, Landroid/util/SparseArray;->delete(I)V

    move-object/from16 v0, v32

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    if-eqz v3, :cond_b

    :try_start_13
    move-object/from16 v0, v32

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v3}, Landroid/app/backup/IFullBackupRestoreObserver;->onTimeout()V
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_13} :catch_a
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    :cond_b
    :goto_7
    monitor-exit v9

    goto/16 :goto_0

    :cond_c
    :try_start_14
    const-string/jumbo v3, "BackupManagerService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "couldn\'t find params for token "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v3, v12}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    goto :goto_7

    :catchall_8
    move-exception v3

    monitor-exit v9

    throw v3

    :pswitch_10
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v28, v0

    check-cast v28, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/backup/BackupManagerService;

    iget-object v3, v3, Lcom/android/server/backup/BackupManagerService;->mContext:Landroid/content/Context;

    sget-object v9, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    move-object/from16 v0, v28

    invoke-virtual {v3, v0, v9}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    goto/16 :goto_0

    :catch_a
    move-exception v25

    goto :goto_7

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_4
        :pswitch_6
        :pswitch_8
        :pswitch_a
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_7
        :pswitch_b
        :pswitch_9
        :pswitch_10
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
