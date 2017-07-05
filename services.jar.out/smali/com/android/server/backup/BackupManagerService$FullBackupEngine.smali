.class Lcom/android/server/backup/BackupManagerService$FullBackupEngine;
.super Ljava/lang/Object;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/backup/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FullBackupEngine"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/backup/BackupManagerService$FullBackupEngine$FullBackupRunner;
    }
.end annotation


# instance fields
.field mFilesDir:Ljava/io/File;

.field mIncludeApks:Z

.field mManifestFile:Ljava/io/File;

.field mMetadataFile:Ljava/io/File;

.field mObserver:Landroid/app/backup/IFullBackupRestoreObserver;

.field mOutput:Ljava/io/OutputStream;

.field mPreflightHook:Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;

.field final synthetic this$0:Lcom/android/server/backup/BackupManagerService;


# direct methods
.method static synthetic -wrap0(Lcom/android/server/backup/BackupManagerService$FullBackupEngine;Landroid/content/pm/PackageInfo;Landroid/app/backup/FullBackupDataOutput;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->writeApkToBackup(Landroid/content/pm/PackageInfo;Landroid/app/backup/FullBackupDataOutput;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/server/backup/BackupManagerService$FullBackupEngine;Landroid/content/pm/PackageInfo;Ljava/io/File;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->writeAppManifest(Landroid/content/pm/PackageInfo;Ljava/io/File;ZZ)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/server/backup/BackupManagerService$FullBackupEngine;Landroid/content/pm/PackageInfo;Ljava/io/File;[B)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->writeMetadata(Landroid/content/pm/PackageInfo;Ljava/io/File;[B)V

    return-void
.end method

.method constructor <init>(Lcom/android/server/backup/BackupManagerService;Ljava/io/OutputStream;Ljava/lang/String;Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;Z)V
    .locals 3

    iput-object p1, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutput:Ljava/io/OutputStream;

    iput-object p4, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mPreflightHook:Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;

    iput-boolean p5, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mIncludeApks:Z

    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/data/system"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mFilesDir:Ljava/io/File;

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mFilesDir:Ljava/io/File;

    const-string/jumbo v2, "_manifest"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mManifestFile:Ljava/io/File;

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mFilesDir:Ljava/io/File;

    const-string/jumbo v2, "_meta"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mMetadataFile:Ljava/io/File;

    return-void
.end method

.method private tearDown(Landroid/content/pm/PackageInfo;)V
    .locals 3

    .prologue
    if-eqz p1, :cond_0

    iget-object v0, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .local v0, "app":Landroid/content/pm/ApplicationInfo;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    # getter for: Lcom/android/server/backup/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v1}, Lcom/android/server/backup/BackupManagerService;->access_mActivityManager(Lcom/android/server/backup/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v2

    invoke-static {v1, v0, v2}, Lcom/android/server/backup/BackupManagerServiceInjector;->tearDownAgentAndKill(Landroid/app/IActivityManager;Landroid/content/pm/ApplicationInfo;I)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v1, v0}, Lcom/android/server/backup/BackupManagerService;->tearDownAgentAndKill(Landroid/content/pm/ApplicationInfo;)V

    :cond_0
    return-void
.end method

.method private writeApkToBackup(Landroid/content/pm/PackageInfo;Landroid/app/backup/FullBackupDataOutput;)V
    .locals 16

    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v1}, Landroid/content/pm/ApplicationInfo;->getBaseCodePath()Ljava/lang/String;

    move-result-object v5

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string/jumbo v2, "a"

    const/4 v3, 0x0

    move-object/from16 v6, p2

    invoke-static/range {v1 .. v6}, Landroid/app/backup/FullBackup;->backupToTar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;)I

    new-instance v15, Landroid/os/Environment$UserEnvironment;

    const/4 v1, 0x0

    invoke-direct {v15, v1}, Landroid/os/Environment$UserEnvironment;-><init>(I)V

    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v15, v1}, Landroid/os/Environment$UserEnvironment;->buildExternalStorageAppObbDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v13, v1, v2

    if-eqz v13, :cond_0

    invoke-virtual {v13}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v14

    if-eqz v14, :cond_0

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    const/4 v1, 0x0

    array-length v2, v14

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v12, v14, v1

    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string/jumbo v7, "obb"

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    const/4 v8, 0x0

    move-object/from16 v11, p2

    invoke-static/range {v6 .. v11}, Landroid/app/backup/FullBackup;->backupToTar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private writeAppManifest(Landroid/content/pm/PackageInfo;Ljava/io/File;ZZ)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v5, 0x1000

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v3, Landroid/util/StringBuilderPrinter;

    invoke-direct {v3, v0}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget v5, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-static {v5}, Lcom/android/server/backup/BackupManagerService;->-get2(Lcom/android/server/backup/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    :goto_0
    invoke-virtual {v3, v1}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    if-eqz p3, :cond_2

    const-string/jumbo v5, "1"

    :goto_1
    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-nez v5, :cond_3

    const-string/jumbo v5, "0"

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    :cond_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    const-wide/16 v6, 0x0

    invoke-virtual {p2, v6, v7}, Ljava/io/File;->setLastModified(J)Z

    return-void

    :cond_1
    const-string/jumbo v1, ""

    goto :goto_0

    :cond_2
    const-string/jumbo v5, "0"

    goto :goto_1

    :cond_3
    iget-object v5, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget-object v6, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v5, 0x0

    array-length v7, v6

    :goto_2
    if-ge v5, v7, :cond_0

    aget-object v4, v6, v5

    invoke-virtual {v4}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method

.method private writeMetadata(Landroid/content/pm/PackageInfo;Ljava/io/File;[B)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v5, 0x200

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v4, Landroid/util/StringBuilderPrinter;

    invoke-direct {v4, v0}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    iget-object v5, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/util/StringBuilderPrinter;->println(Ljava/lang/String;)V

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/BufferedOutputStream;->write([B)V

    if-eqz p3, :cond_0

    array-length v5, p3

    if-lez v5, :cond_0

    const v5, 0x1ffed01

    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    array-length v5, p3

    invoke-virtual {v3, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v3, p3}, Ljava/io/DataOutputStream;->write([B)V

    :cond_0
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    invoke-virtual {v3}, Ljava/io/DataOutputStream;->close()V

    const-wide/16 v6, 0x0

    invoke-virtual {p2, v6, v7}, Ljava/io/File;->setLastModified(J)Z

    return-void
.end method


# virtual methods
.method public backupOnePackage(Landroid/content/pm/PackageInfo;)I
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v14, 0x0

    const-string/jumbo v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Binding to full backup agent : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v5}, Lcom/android/server/backup/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v4

    if-eqz v4, :cond_c

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v2

    invoke-static {v4, v2}, Lcom/android/server/backup/BackupManagerServiceInjector;->linkToDeath(Landroid/app/IBackupAgent;I)V

    const/4 v13, 0x0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mPreflightHook:Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mPreflightHook:Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;

    move-object/from16 v0, p1

    invoke-interface {v2, v0, v4}, Lcom/android/server/backup/BackupManagerService$FullBackupPreflight;->preflightFullBackup(Landroid/content/pm/PackageInfo;Landroid/app/IBackupAgent;)I

    move-result v14

    :cond_0
    if-nez v14, :cond_2

    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v10, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string/jumbo v3, "com.android.sharedstoragebackup"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mIncludeApks:Z

    if-eqz v2, :cond_1

    if-eqz v12, :cond_5

    :cond_1
    const/4 v7, 0x0

    :goto_0
    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/server/AppWidgetBackupBridge;->getWidgetState(Ljava/lang/String;I)[B

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v2}, Lcom/android/server/backup/BackupManagerService;->generateToken()I

    move-result v6

    new-instance v1, Lcom/android/server/backup/BackupManagerService$FullBackupEngine$FullBackupRunner;

    const/4 v2, 0x1

    aget-object v5, v13, v2

    if-eqz v12, :cond_8

    const/4 v8, 0x0

    :goto_1
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v1 .. v9}, Lcom/android/server/backup/BackupManagerService$FullBackupEngine$FullBackupRunner;-><init>(Lcom/android/server/backup/BackupManagerService$FullBackupEngine;Landroid/content/pm/PackageInfo;Landroid/app/IBackupAgent;Landroid/os/ParcelFileDescriptor;IZZ[B)V

    const/4 v2, 0x1

    aget-object v2, v13, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    const/4 v2, 0x0

    const/4 v3, 0x1

    aput-object v2, v13, v3

    new-instance v15, Ljava/lang/Thread;

    const-string/jumbo v2, "app-data-runner"

    invoke-direct {v15, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    const/4 v3, 0x0

    aget-object v3, v13, v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutput:Ljava/io/OutputStream;

    iget-object v0, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutputFile:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v0

    invoke-static {v2, v3, v5, v0}, Lcom/android/server/backup/BackupManagerServiceInjector;->routeSocketDataToOutput(Lcom/android/server/backup/BackupManagerService;Landroid/os/ParcelFileDescriptor;Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_2
    :try_start_2
    invoke-static {v4, v6}, Lcom/android/server/backup/BackupManagerServiceInjector;->needUpdateToken(Landroid/app/IBackupAgent;I)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->this$0:Lcom/android/server/backup/BackupManagerService;

    invoke-virtual {v2, v6}, Lcom/android/server/backup/BackupManagerService;->waitUntilOperationComplete(I)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Full backup failed on package "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/16 v14, -0x3eb

    :cond_2
    :try_start_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    if-eqz v13, :cond_4

    const/4 v2, 0x0

    aget-object v2, v13, v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    aget-object v2, v13, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_3
    const/4 v2, 0x1

    aget-object v2, v13, v2

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    aget-object v2, v13, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    :cond_4
    :goto_3
    invoke-static {v4}, Lcom/android/server/backup/BackupManagerServiceInjector;->unlinkToDeath(Landroid/app/IBackupAgent;)V

    :goto_miui_0
    invoke-direct/range {p0 .. p1}, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->tearDown(Landroid/content/pm/PackageInfo;)V

    return v14

    :cond_5
    :try_start_4
    iget v2, v10, Landroid/content/pm/ApplicationInfo;->privateFlags:I

    and-int/lit8 v2, v2, 0x4

    if-nez v2, :cond_1

    iget v2, v10, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_6

    iget v2, v10, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_7

    const/4 v7, 0x1

    goto/16 :goto_0

    :cond_6
    const/4 v7, 0x1

    goto/16 :goto_0

    :cond_7
    const/4 v7, 0x0

    goto/16 :goto_0

    :cond_8
    const/4 v8, 0x1

    goto/16 :goto_1

    :catch_0
    move-exception v11

    const-string/jumbo v2, "BackupManagerService"

    const-string/jumbo v3, "Caught exception reading from agent"

    invoke-static {v2, v3, v11}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/16 v14, -0x3eb

    goto :goto_2

    :catch_1
    move-exception v11

    const-string/jumbo v2, "BackupManagerService"

    const-string/jumbo v3, "Error bringing down backup stack"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    const/16 v14, -0x3e8

    goto :goto_3

    :catch_2
    move-exception v11

    :try_start_5
    const-string/jumbo v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Error backing up "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v11}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const/16 v14, -0x3eb

    :try_start_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    if-eqz v13, :cond_4

    const/4 v2, 0x0

    aget-object v2, v13, v2

    if-eqz v2, :cond_9

    const/4 v2, 0x0

    aget-object v2, v13, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_9
    const/4 v2, 0x1

    aget-object v2, v13, v2

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    aget-object v2, v13, v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_3

    :catch_3
    move-exception v11

    const-string/jumbo v2, "BackupManagerService"

    const-string/jumbo v3, "Error bringing down backup stack"

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :catchall_0
    move-exception v2

    :try_start_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/backup/BackupManagerService$FullBackupEngine;->mOutput:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    if-eqz v13, :cond_b

    const/4 v3, 0x0

    aget-object v3, v13, v3

    if-eqz v3, :cond_a

    const/4 v3, 0x0

    aget-object v3, v13, v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_a
    const/4 v3, 0x1

    aget-object v3, v13, v3

    if-eqz v3, :cond_b

    const/4 v3, 0x1

    aget-object v3, v13, v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    :cond_b
    :goto_5
    throw v2

    :catch_4
    move-exception v11

    const-string/jumbo v3, "BackupManagerService"

    const-string/jumbo v5, "Error bringing down backup stack"

    invoke-static {v3, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v14, -0x3e8

    goto :goto_5

    :cond_c
    const-string/jumbo v2, "BackupManagerService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to bind to full agent for "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v14, -0x3eb

    goto/16 :goto_miui_0
.end method
