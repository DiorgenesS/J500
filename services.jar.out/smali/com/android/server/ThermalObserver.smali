.class public Lcom/android/server/ThermalObserver;
.super Lcom/android/server/SystemService;
.source "ThermalObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ThermalObserver$BinderService;,
        Lcom/android/server/ThermalObserver$1;,
        Lcom/android/server/ThermalObserver$2;
    }
.end annotation


# static fields
.field private static final CALLSTATE_UEVENT_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/switch/thermalstate"

.field private static final MSG_THERMAL_STATE_CHANGED:I = 0x0

.field private static final SWITCH_STATE_EXCEEDED:I = 0x2

.field private static final SWITCH_STATE_NORMAL:I = 0x0

.field private static final SWITCH_STATE_WARNING:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ThermalObserver"


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private mLastState:Ljava/lang/Integer;

.field private final mLock:Ljava/lang/Object;

.field private final mPowerManager:Landroid/os/PowerManager;

.field private final mThermalWarningObserver:Landroid/os/UEventObserver;

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static synthetic -get0(Lcom/android/server/ThermalObserver;)Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/android/server/ThermalObserver;->mLastState:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/ThermalObserver;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/server/ThermalObserver;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/ThermalObserver;)Landroid/os/PowerManager$WakeLock;
    .locals 1

    iget-object v0, p0, Lcom/android/server/ThermalObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/server/ThermalObserver;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/ThermalObserver;->handleThermalStateChange(I)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/server/ThermalObserver;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/ThermalObserver;->updateLocked(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v2, 0x1

    invoke-direct {p0, p1}, Lcom/android/server/SystemService;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/ThermalObserver;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/android/server/ThermalObserver$1;

    invoke-direct {v0, p0}, Lcom/android/server/ThermalObserver$1;-><init>(Lcom/android/server/ThermalObserver;)V

    iput-object v0, p0, Lcom/android/server/ThermalObserver;->mThermalWarningObserver:Landroid/os/UEventObserver;

    new-instance v0, Lcom/android/server/ThermalObserver$2;

    invoke-direct {v0, p0, v2}, Lcom/android/server/ThermalObserver$2;-><init>(Lcom/android/server/ThermalObserver;Z)V

    iput-object v0, p0, Lcom/android/server/ThermalObserver;->mHandler:Landroid/os/Handler;

    const-string/jumbo v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/android/server/ThermalObserver;->mPowerManager:Landroid/os/PowerManager;

    iget-object v0, p0, Lcom/android/server/ThermalObserver;->mPowerManager:Landroid/os/PowerManager;

    const-string/jumbo v1, "ThermalObserver"

    invoke-virtual {v0, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/ThermalObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v0, p0, Lcom/android/server/ThermalObserver;->mThermalWarningObserver:Landroid/os/UEventObserver;

    const-string/jumbo v1, "DEVPATH=/devices/virtual/switch/thermalstate"

    invoke-virtual {v0, v1}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    return-void
.end method

.method private handleThermalStateChange(I)V
    .locals 5

    iget-object v3, p0, Lcom/android/server/ThermalObserver;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/ThermalObserver;->mLastState:Ljava/lang/Integer;

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.THERMAL_EVENT"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x20000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    packed-switch p1, :pswitch_data_0

    const/4 v1, 0x0

    :goto_0
    const-string/jumbo v2, "android.intent.extra.THERMAL_STATE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/android/server/ThermalObserver;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v4, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v2, v0, v4}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    return-void

    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    :pswitch_1
    const/4 v1, 0x2

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private updateLocked(I)V
    .locals 2

    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->what:I

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/server/ThermalObserver;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v1, p0, Lcom/android/server/ThermalObserver;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 3

    const-string/jumbo v0, "ThermalObserver"

    new-instance v1, Lcom/android/server/ThermalObserver$BinderService;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/server/ThermalObserver$BinderService;-><init>(Lcom/android/server/ThermalObserver;Lcom/android/server/ThermalObserver$BinderService;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/server/ThermalObserver;->publishBinderService(Ljava/lang/String;Landroid/os/IBinder;)V

    return-void
.end method
