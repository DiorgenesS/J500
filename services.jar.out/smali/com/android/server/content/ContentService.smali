.class public final Lcom/android/server/content/ContentService;
.super Landroid/content/IContentService$Stub;
.source "ContentService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/content/ContentService$ObserverCall;,
        Lcom/android/server/content/ContentService$ObserverNode;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ContentService"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mFactoryTest:Z

.field private final mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

.field private mSyncManager:Lcom/android/server/content/SyncManager;

.field private final mSyncManagerLock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .locals 3

    invoke-direct {p0}, Landroid/content/IContentService$Stub;-><init>()V

    new-instance v1, Lcom/android/server/content/ContentService$ObserverNode;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Lcom/android/server/content/ContentService$ObserverNode;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/server/content/ContentService;->mSyncManagerLock:Ljava/lang/Object;

    iput-object p1, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/android/server/content/ContentService;->mFactoryTest:Z

    const-class v1, Landroid/content/pm/PackageManagerInternal;

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageManagerInternal;

    new-instance v1, Lcom/android/server/content/ContentService$2;

    invoke-direct {v1, p0}, Lcom/android/server/content/ContentService$2;-><init>(Lcom/android/server/content/ContentService;)V

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManagerInternal;->setSyncAdapterPackagesprovider(Landroid/content/pm/PackageManagerInternal$SyncAdapterPackagesProvider;)V

    return-void
.end method

.method private enforceCrossUserPermission(ILjava/lang/String;)V
    .locals 3

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    if-eq v0, p1, :cond_0

    iget-object v1, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.INTERACT_ACROSS_USERS_FULL"

    invoke-virtual {v1, v2, p2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private getSyncManager()Lcom/android/server/content/SyncManager;
    .locals 5

    const/4 v3, 0x0

    const-string/jumbo v1, "config.disable_network"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v3

    :cond_0
    iget-object v2, p0, Lcom/android/server/content/ContentService;->mSyncManagerLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;

    if-nez v1, :cond_1

    new-instance v1, Lcom/android/server/content/SyncManager;

    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    iget-boolean v4, p0, Lcom/android/server/content/ContentService;->mFactoryTest:Z

    invoke-direct {v1, v3, v4}, Lcom/android/server/content/SyncManager;-><init>(Landroid/content/Context;Z)V

    iput-object v1, p0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v2

    return-object v1

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v1, "ContentService"

    const-string/jumbo v3, "Can\'t create SyncManager"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static main(Landroid/content/Context;Z)Lcom/android/server/content/ContentService;
    .locals 2

    new-instance v0, Lcom/android/server/content/ContentService;

    invoke-direct {v0, p0, p1}, Lcom/android/server/content/ContentService;-><init>(Landroid/content/Context;Z)V

    const-string/jumbo v1, "content"

    invoke-static {v1, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public addPeriodicSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;J)V
    .locals 10

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Account must not be null"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Authority must not be empty."

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v3, "no permission to write the sync settings"

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v7

    const-wide/16 v2, 0x3c

    cmp-long v0, p4, v2

    if-gez v0, :cond_2

    const-string/jumbo v0, "ContentService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Requested poll frequency of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " seconds being rounded up to 60 seconds."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 p4, 0x3c

    :cond_2
    invoke-static {p4, p5}, Lcom/android/server/content/SyncStorageEngine;->calculateDefaultFlexTime(J)J

    move-result-wide v4

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v8

    :try_start_0
    new-instance v1, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v1, p1, p2, v7}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v0

    move-wide v2, p4

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/content/SyncStorageEngine;->updateOrAddPeriodicSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;JJLandroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v8, v9}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {v8, v9}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v0
.end method

.method public addStatusChangeListener(ILandroid/content/ISyncStatusObserver;)V
    .locals 4

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Lcom/android/server/content/SyncStorageEngine;->addStatusChangeListener(ILandroid/content/ISyncStatusObserver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public cancelRequest(Landroid/content/SyncRequest;)V
    .locals 11

    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v6

    if-nez v6, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v7

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/content/SyncRequest;->getBundle()Landroid/os/Bundle;

    move-result-object v8

    invoke-direct {v1, v8}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {p1}, Landroid/content/SyncRequest;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/SyncRequest;->getProvider()Ljava/lang/String;

    move-result-object v5

    new-instance v4, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v4, v0, v5, v7}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {p1}, Landroid/content/SyncRequest;->isPeriodic()Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v9, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v10, "no permission to write the sync settings"

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v8

    invoke-virtual {v8, v4, v1}, Lcom/android/server/content/SyncStorageEngine;->removePeriodicSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;Landroid/os/Bundle;)V

    :cond_1
    invoke-virtual {v6, v4, v1}, Lcom/android/server/content/SyncManager;->cancelScheduledSyncOperation(Lcom/android/server/content/SyncStorageEngine$EndPoint;Landroid/os/Bundle;)V

    invoke-virtual {v6, v4, v1}, Lcom/android/server/content/SyncManager;->cancelActiveSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v8

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v8
.end method

.method public cancelSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;)V
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/content/ContentService;->cancelSyncAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)V

    return-void
.end method

.method public cancelSyncAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)V
    .locals 6

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "Authority must be non-empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "no permission to modify the sync settings for user "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, p4, v4}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v3

    if-eqz v3, :cond_1

    if-nez p3, :cond_2

    new-instance v2, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v2, p1, p2, p4}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    :goto_0
    invoke-virtual {v3, v2}, Lcom/android/server/content/SyncManager;->clearScheduledSyncOperations(Lcom/android/server/content/SyncStorageEngine$EndPoint;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lcom/android/server/content/SyncManager;->cancelActiveSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :cond_2
    :try_start_1
    new-instance v2, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v2, p3, p4}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/content/ComponentName;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v4

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v4
.end method

.method protected declared-synchronized dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 16

    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "android.permission.DUMP"

    const-string/jumbo v4, "caller doesn\'t have the DUMP permission"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-wide v12

    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;

    if-nez v2, :cond_0

    const-string/jumbo v2, "No SyncManager created!  (Disk full?)"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/PrintWriter;->println()V

    const-string/jumbo v2, "Observer tree:"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    monitor-enter v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v2, 0x2

    :try_start_2
    new-array v8, v2, [I

    new-instance v9, Landroid/util/SparseIntArray;

    invoke-direct {v9}, Landroid/util/SparseIntArray;-><init>()V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    const-string/jumbo v6, ""

    const-string/jumbo v7, "  "

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-virtual/range {v2 .. v9}, Lcom/android/server/content/ContentService$ObserverNode;->dumpLocked(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[ILandroid/util/SparseIntArray;)V

    invoke-virtual/range {p2 .. p2}, Ljava/io/PrintWriter;->println()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const/4 v10, 0x0

    :goto_1
    invoke-virtual {v9}, Landroid/util/SparseIntArray;->size()I

    move-result v2

    if-ge v10, v2, :cond_1

    invoke-virtual {v9, v10}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_0
    :try_start_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/ContentService;->mSyncManager:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v2, v0, v1}, Lcom/android/server/content/SyncManager;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    :try_start_4
    invoke-static {v12, v13}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    :cond_1
    :try_start_5
    new-instance v2, Lcom/android/server/content/ContentService$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v9}, Lcom/android/server/content/ContentService$1;-><init>(Lcom/android/server/content/ContentService;Landroid/util/SparseIntArray;)V

    invoke-static {v14, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v10, 0x0

    :goto_2
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v10, v2, :cond_2

    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const-string/jumbo v2, "  pid "

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v2, ": "

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v9, v11}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v2, " observers"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual/range {p2 .. p2}, Ljava/io/PrintWriter;->println()V

    const-string/jumbo v2, " Total number of nodes: "

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/4 v2, 0x0

    aget v2, v8, v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(I)V

    const-string/jumbo v2, " Total number of observers: "

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/4 v2, 0x1

    aget v2, v8, v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/PrintWriter;->println(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    monitor-exit v15
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    invoke-static {v12, v13}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    monitor-exit p0

    return-void

    :catchall_2
    move-exception v2

    :try_start_8
    monitor-exit v15

    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
.end method

.method public getCurrentSyncs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/SyncInfo;",
            ">;"
        }
    .end annotation

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/content/ContentService;->getCurrentSyncsAsUser(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentSyncsAsUser(I)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/content/SyncInfo;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read the sync settings for user "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.READ_SYNC_STATS"

    const-string/jumbo v5, "no permission to read the sync stats"

    invoke-virtual {v1, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.GET_ACCOUNTS"

    invoke-virtual {v1, v4}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/android/server/content/SyncStorageEngine;->getCurrentSyncsCopy(IZ)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v1
.end method

.method public getIsSyncable(Landroid/accounts/Account;Ljava/lang/String;)I
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/content/ContentService;->getIsSyncableAsUser(Landroid/accounts/Account;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getIsSyncableAsUser(Landroid/accounts/Account;Ljava/lang/String;I)I
    .locals 6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read the sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p3, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.READ_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to read the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2, p1, p3, p2}, Lcom/android/server/content/SyncManager;->getIsSyncable(Landroid/accounts/Account;ILjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v3

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    const/4 v3, -0x1

    return v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getMasterSyncAutomatically()Z
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/content/ContentService;->getMasterSyncAutomaticallyAsUser(I)Z

    move-result v0

    return v0
.end method

.method public getMasterSyncAutomaticallyAsUser(I)Z
    .locals 6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read the sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.READ_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to read the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/server/content/SyncStorageEngine;->getMasterSyncAutomatically(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v3

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    const/4 v3, 0x0

    return v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getPeriodicSyncs(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Ljava/lang/String;",
            "Landroid/content/ComponentName;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/content/PeriodicSync;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Account must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Authority must not be empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.READ_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to read the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    new-instance v4, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v4, p1, p2, v2}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Lcom/android/server/content/SyncStorageEngine;->getPeriodicSyncs(Lcom/android/server/content/SyncStorageEngine$EndPoint;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getSyncAdapterPackagesForAuthorityAsUser(Ljava/lang/String;I)[Ljava/lang/String;
    .locals 5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p2, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/android/server/content/SyncManager;->getSyncAdapterPackagesForAuthorityAsUser(Ljava/lang/String;I)[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getSyncAdapterTypes()[Landroid/content/SyncAdapterType;
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/content/ContentService;->getSyncAdapterTypesAsUser(I)[Landroid/content/SyncAdapterType;

    move-result-object v0

    return-object v0
.end method

.method public getSyncAdapterTypesAsUser(I)[Landroid/content/SyncAdapterType;
    .locals 5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/server/content/SyncManager;->getSyncAdapterTypes(I)[Landroid/content/SyncAdapterType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/content/ContentService;->getSyncAutomaticallyAsUser(Landroid/accounts/Account;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public getSyncAutomaticallyAsUser(Landroid/accounts/Account;Ljava/lang/String;I)Z
    .locals 6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to read the sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p3, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.READ_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to read the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1, p3, p2}, Lcom/android/server/content/SyncStorageEngine;->getSyncAutomatically(Landroid/accounts/Account;ILjava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v3

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    const/4 v3, 0x0

    return v3

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public getSyncStatus(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;)Landroid/content/SyncStatusInfo;
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/content/ContentService;->getSyncStatusAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)Landroid/content/SyncStatusInfo;

    move-result-object v0

    return-object v0
.end method

.method public getSyncStatusAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)Landroid/content/SyncStatusInfo;
    .locals 9

    const/4 v8, 0x0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "Authority must not be empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "no permission to read the sync stats for user "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p4, v5}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v5, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v6, "android.permission.READ_SYNC_STATS"

    const-string/jumbo v7, "no permission to read the sync stats"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    if-nez v4, :cond_1

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v8

    :cond_1
    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    :try_start_1
    new-instance v1, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v1, p1, p2, p4}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {v4}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/android/server/content/SyncStorageEngine;->getStatusByAuthority(Lcom/android/server/content/SyncStorageEngine$EndPoint;)Landroid/content/SyncStatusInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-object v5

    :cond_2
    :try_start_2
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "Must call sync status with valid authority"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public isSyncActive(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;)Z
    .locals 8

    iget-object v5, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v6, "android.permission.READ_SYNC_STATS"

    const-string/jumbo v7, "no permission to read the sync stats"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v4

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v2

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v5, 0x0

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v5

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v5

    new-instance v6, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v6, p1, p2, v4}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {v5, v6}, Lcom/android/server/content/SyncStorageEngine;->isSyncActive(Lcom/android/server/content/SyncStorageEngine$EndPoint;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v5

    :catchall_0
    move-exception v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public isSyncPending(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;)Z
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/content/ContentService;->isSyncPendingAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)Z

    move-result v0

    return v0
.end method

.method public isSyncPendingAsUser(Landroid/accounts/Account;Ljava/lang/String;Landroid/content/ComponentName;I)Z
    .locals 8

    iget-object v5, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v6, "android.permission.READ_SYNC_STATS"

    const-string/jumbo v7, "no permission to read the sync stats"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "no permission to retrieve the sync settings for user "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p4, v5}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v2

    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v4

    if-nez v4, :cond_0

    const/4 v5, 0x0

    return v5

    :cond_0
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    :try_start_0
    new-instance v1, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v1, p1, p2, p4}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {v4}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/android/server/content/SyncStorageEngine;->isSyncPending(Lcom/android/server/content/SyncStorageEngine$EndPoint;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return v5

    :cond_1
    :try_start_1
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "Invalid authority specified"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v5

    invoke-static {v2, v3}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public notifyChange(Landroid/net/Uri;Landroid/database/IContentObserver;ZZ)V
    .locals 6

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/content/ContentService;->notifyChange(Landroid/net/Uri;Landroid/database/IContentObserver;ZZI)V

    return-void
.end method

.method public notifyChange(Landroid/net/Uri;Landroid/database/IContentObserver;ZZI)V
    .locals 27

    const-string/jumbo v4, "ContentService"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "ContentService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Notifying update of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " for user "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " from observer "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ", syncToNetwork "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p4

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v25

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v23

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v12

    move/from16 v0, p5

    if-eq v12, v0, :cond_1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const/4 v5, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v25

    invoke-virtual {v4, v0, v1, v2, v5}, Landroid/content/Context;->checkUriPermission(Landroid/net/Uri;III)I

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v4, "no permission to notify other users"

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v1, v4}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    :cond_1
    if-gez p5, :cond_2

    const/4 v4, -0x2

    move/from16 v0, p5

    if-ne v0, v4, :cond_4

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result p5

    :cond_2
    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v16

    :try_start_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    move-object/from16 v26, v0

    monitor-enter v26
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    const/4 v6, 0x0

    move-object/from16 v5, p1

    move-object/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p5

    invoke-virtual/range {v4 .. v10}, Lcom/android/server/content/ContentService$ObserverNode;->collectObserversLocked(Landroid/net/Uri;ILandroid/database/IContentObserver;ZILjava/util/ArrayList;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v26

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v19

    const/4 v14, 0x0

    :goto_0
    move/from16 v0, v19

    if-ge v14, v0, :cond_7

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/server/content/ContentService$ObserverCall;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/android/server/content/ContentService$ObserverCall;->mObserver:Landroid/database/IContentObserver;

    move-object/from16 v0, v21

    iget-boolean v5, v0, Lcom/android/server/content/ContentService$ObserverCall;->mSelfChange:Z

    move-object/from16 v0, p1

    move/from16 v1, p5

    invoke-interface {v4, v5, v0, v1}, Landroid/database/IContentObserver;->onChange(ZLandroid/net/Uri;I)V

    const-string/jumbo v4, "ContentService"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, "ContentService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Notified "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v21

    iget-object v6, v0, Lcom/android/server/content/ContentService$ObserverCall;->mObserver:Landroid/database/IContentObserver;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "update at "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_3
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    :cond_4
    const/4 v4, -0x1

    move/from16 v0, p5

    if-eq v0, v4, :cond_2

    new-instance v4, Ljava/security/InvalidParameterException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Bad user handle for notifyChange: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v4

    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v26

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v4

    invoke-static/range {v16 .. v17}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v4

    :catch_0
    move-exception v13

    :try_start_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    monitor-enter v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    const-string/jumbo v4, "ContentService"

    const-string/jumbo v6, "Found dead observer, removing"

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/android/server/content/ContentService$ObserverCall;->mObserver:Landroid/database/IContentObserver;

    invoke-interface {v4}, Landroid/database/IContentObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v11

    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/android/server/content/ContentService$ObserverCall;->mNode:Lcom/android/server/content/ContentService$ObserverNode;

    invoke-static {v4}, Lcom/android/server/content/ContentService$ObserverNode;->-get0(Lcom/android/server/content/ContentService$ObserverNode;)Ljava/util/ArrayList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v20

    const/4 v15, 0x0

    :goto_2
    move/from16 v0, v20

    if-ge v15, v0, :cond_6

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/android/server/content/ContentService$ObserverNode$ObserverEntry;

    move-object/from16 v0, v22

    iget-object v4, v0, Lcom/android/server/content/ContentService$ObserverNode$ObserverEntry;->observer:Landroid/database/IContentObserver;

    invoke-interface {v4}, Landroid/database/IContentObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v11, :cond_5

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    add-int/lit8 v15, v15, -0x1

    add-int/lit8 v20, v20, -0x1

    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    :cond_6
    :try_start_7
    monitor-exit v5

    goto :goto_1

    :catchall_2
    move-exception v4

    monitor-exit v5

    throw v4

    :cond_7
    if-eqz p4, :cond_8

    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v24

    if-eqz v24, :cond_8

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v0, v5, v12, v1, v4}, Lcom/android/server/content/SyncManager;->scheduleLocalSync(Landroid/accounts/Account;IILjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :cond_8
    invoke-static/range {v16 .. v17}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/content/IContentService$Stub;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    :catch_0
    move-exception v0

    instance-of v1, v0, Ljava/lang/SecurityException;

    if-nez v1, :cond_0

    const-string/jumbo v1, "ContentService"

    const-string/jumbo v2, "Content Service Crash"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    throw v0
.end method

.method public registerContentObserver(Landroid/net/Uri;ZLandroid/database/IContentObserver;)V
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/content/ContentService;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/IContentObserver;I)V

    return-void
.end method

.method public registerContentObserver(Landroid/net/Uri;ZLandroid/database/IContentObserver;I)V
    .locals 10

    if-eqz p3, :cond_0

    if-nez p1, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You must pass a valid uri and observer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v6

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v8

    if-eq v8, p4, :cond_2

    iget-object v0, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v6, v5, v1}, Landroid/content/Context;->checkUriPermission(Landroid/net/Uri;III)I

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "no permission to observe other users\' provider view"

    invoke-direct {p0, p4, v0}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    :cond_2
    if-gez p4, :cond_3

    const/4 v0, -0x2

    if-ne p4, v0, :cond_4

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result p4

    :cond_3
    iget-object v9, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    monitor-enter v9

    :try_start_0
    iget-object v0, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    iget-object v4, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    move-object v1, p1

    move-object v2, p3

    move v3, p2

    move v7, p4

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/content/ContentService$ObserverNode;->addObserverLocked(Landroid/net/Uri;Landroid/database/IContentObserver;ZLjava/lang/Object;III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v9

    return-void

    :cond_4
    const/4 v0, -0x1

    if-eq p4, v0, :cond_3

    new-instance v0, Ljava/security/InvalidParameterException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Bad user handle for registerContentObserver: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v9

    throw v0
.end method

.method public removePeriodicSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6

    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Account must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Authority must not be empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to write the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    new-instance v4, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-direct {v4, p1, p2, v2}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    invoke-virtual {v3, v4, p3}, Lcom/android/server/content/SyncStorageEngine;->removePeriodicSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public removeStatusChangeListener(Landroid/content/ISyncStatusObserver;)V
    .locals 4

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/server/content/SyncStorageEngine;->removeStatusChangeListener(Landroid/content/ISyncStatusObserver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public requestSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 14

    invoke-static/range {p3 .. p3}, Landroid/content/ContentResolver;->validateSyncExtrasBundle(Landroid/os/Bundle;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v12

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    move-object v1, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v10}, Lcom/android/server/content/SyncManager;->scheduleSync(Landroid/accounts/Account;IILjava/lang/String;Landroid/os/Bundle;JJZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-static {v12, v13}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v1

    invoke-static {v12, v13}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v1
.end method

.method public setIsSyncable(Landroid/accounts/Account;Ljava/lang/String;I)V
    .locals 7

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "Authority must not be empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_0
    iget-object v4, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v5, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v6, "no permission to write the sync settings"

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v3

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    invoke-virtual {v4, p1, v3, p2, p3}, Lcom/android/server/content/SyncStorageEngine;->setIsSyncable(Landroid/accounts/Account;ILjava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v4

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v4
.end method

.method public setMasterSyncAutomatically(Z)V
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/server/content/ContentService;->setMasterSyncAutomaticallyAsUser(ZI)V

    return-void
.end method

.method public setMasterSyncAutomaticallyAsUser(ZI)V
    .locals 6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to set the sync status for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p2, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to write the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Lcom/android/server/content/SyncStorageEngine;->setMasterSyncAutomatically(ZI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public setSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;Z)V
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/server/content/ContentService;->setSyncAutomaticallyAsUser(Landroid/accounts/Account;Ljava/lang/String;ZI)V

    return-void
.end method

.method public setSyncAutomaticallyAsUser(Landroid/accounts/Account;Ljava/lang/String;ZI)V
    .locals 6

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Authority must be non-empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    iget-object v3, p0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v5, "no permission to write the sync settings"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no permission to modify the sync settings for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p4, v3}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v3

    invoke-virtual {v3, p1, p4, p2, p3}, Lcom/android/server/content/SyncStorageEngine;->setSyncAutomatically(Landroid/accounts/Account;ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception v3

    invoke-static {v0, v1}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v3
.end method

.method public sync(Landroid/content/SyncRequest;)V
    .locals 1

    invoke-static {}, Landroid/os/UserHandle;->getCallingUserId()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/server/content/ContentService;->syncAsUser(Landroid/content/SyncRequest;I)V

    return-void
.end method

.method public syncAsUser(Landroid/content/SyncRequest;I)V
    .locals 24

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "no permission to request sync as user: "

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/android/server/content/ContentService;->enforceCrossUserPermission(ILjava/lang/String;)V

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v13

    invoke-static {}, Lcom/android/server/content/ContentService;->clearCallingIdentity()J

    move-result-wide v22

    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    if-nez v10, :cond_0

    invoke-static/range {v22 .. v23}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :cond_0
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getBundle()Landroid/os/Bundle;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getSyncFlexTime()J

    move-result-wide v6

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getSyncRunTime()J

    move-result-wide v4

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->isPeriodic()Z

    move-result v2

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/ContentService;->mContext:Landroid/content/Context;

    const-string/jumbo v9, "android.permission.WRITE_SYNC_SETTINGS"

    const-string/jumbo v11, "no permission to write the sync settings"

    invoke-virtual {v2, v9, v11}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/android/server/content/SyncStorageEngine$EndPoint;

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getProvider()Ljava/lang/String;

    move-result-object v9

    move/from16 v0, p2

    invoke-direct {v3, v2, v9, v0}, Lcom/android/server/content/SyncStorageEngine$EndPoint;-><init>(Landroid/accounts/Account;Ljava/lang/String;I)V

    const-wide/16 v14, 0x3c

    cmp-long v2, v4, v14

    if-gez v2, :cond_1

    const-string/jumbo v2, "ContentService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Requested poll frequency of "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v11, " seconds being rounded up to 60 seconds."

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v4, 0x3c

    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/content/SyncManager;->getSyncStorageEngine()Lcom/android/server/content/SyncStorageEngine;

    move-result-object v2

    invoke-virtual/range {v2 .. v8}, Lcom/android/server/content/SyncStorageEngine;->updateOrAddPeriodicSync(Lcom/android/server/content/SyncStorageEngine$EndPoint;JJLandroid/os/Bundle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-static/range {v22 .. v23}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    return-void

    :cond_2
    const-wide/16 v14, 0x3e8

    mul-long v16, v6, v14

    const-wide/16 v14, 0x3e8

    mul-long v18, v4, v14

    :try_start_2
    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getAccount()Landroid/accounts/Account;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncRequest;->getProvider()Ljava/lang/String;

    move-result-object v14

    const/16 v20, 0x0

    move/from16 v12, p2

    move-object v15, v8

    invoke-virtual/range {v10 .. v20}, Lcom/android/server/content/SyncManager;->scheduleSync(Landroid/accounts/Account;IILjava/lang/String;Landroid/os/Bundle;JJZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-static/range {v22 .. v23}, Lcom/android/server/content/ContentService;->restoreCallingIdentity(J)V

    throw v2
.end method

.method public systemReady()V
    .locals 0

    invoke-direct {p0}, Lcom/android/server/content/ContentService;->getSyncManager()Lcom/android/server/content/SyncManager;

    return-void
.end method

.method public unregisterContentObserver(Landroid/database/IContentObserver;)V
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You must pass a valid observer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v1, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/content/ContentService;->mRootNode:Lcom/android/server/content/ContentService$ObserverNode;

    invoke-virtual {v0, p1}, Lcom/android/server/content/ContentService$ObserverNode;->removeObserverLocked(Landroid/database/IContentObserver;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
