.class public Lcom/android/server/notification/ZenModeHelper;
.super Ljava/lang/Object;
.source "ZenModeHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;,
        Lcom/android/server/notification/ZenModeHelper$SettingsObserver;,
        Lcom/android/server/notification/ZenModeHelper$Metrics;,
        Lcom/android/server/notification/ZenModeHelper$H;,
        Lcom/android/server/notification/ZenModeHelper$Callback;,
        Lcom/android/server/notification/ZenModeHelper$1;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field static final TAG:Ljava/lang/String; = "ZenModeHelper"


# instance fields
.field private mAllowLights:Z

.field private final mAppOps:Landroid/app/AppOpsManager;

.field private mAudioManager:Landroid/media/AudioManagerInternal;

.field private final mCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/notification/ZenModeHelper$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private final mConditions:Lcom/android/server/notification/ZenModeConditions;

.field private mConfig:Landroid/service/notification/ZenModeConfig;

.field private final mConfigMigration:Landroid/service/notification/ZenModeConfig$Migration;

.field private final mConfigs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/service/notification/ZenModeConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mDefaultConfig:Landroid/service/notification/ZenModeConfig;

.field private mEffectsSuppressed:Z

.field private final mFiltering:Lcom/android/server/notification/ZenModeFiltering;

.field private final mHandler:Lcom/android/server/notification/ZenModeHelper$H;

.field private final mMetrics:Lcom/android/server/notification/ZenModeHelper$Metrics;

.field private final mRingerModeDelegate:Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;

.field private final mSettingsObserver:Lcom/android/server/notification/ZenModeHelper$SettingsObserver;

.field private mUser:I

.field private mZenMode:I


# direct methods
.method static synthetic -get0(Lcom/android/server/notification/ZenModeHelper;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/notification/ZenModeHelper;)Lcom/android/server/notification/ZenModeHelper$H;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/notification/ZenModeHelper;)Lcom/android/server/notification/ZenModeHelper$Metrics;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mMetrics:Lcom/android/server/notification/ZenModeHelper$Metrics;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/server/notification/ZenModeHelper;)I
    .locals 1

    iget v0, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    return v0
.end method

.method static synthetic -wrap0(Lcom/android/server/notification/ZenModeHelper;)I
    .locals 1

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->getZenModeSetting()I

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/server/notification/ZenModeHelper;Landroid/service/notification/ZenModeConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/notification/ZenModeHelper;->appendDefaultEventRules(Landroid/service/notification/ZenModeConfig;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/server/notification/ZenModeHelper;Landroid/service/notification/ZenModeConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/notification/ZenModeHelper;->appendDefaultScheduleRules(Landroid/service/notification/ZenModeConfig;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/server/notification/ZenModeHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->dispatchOnZenModeChanged()V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/server/notification/ZenModeHelper;ILandroid/net/Uri;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/notification/ZenModeHelper;->setManualZenMode(ILandroid/net/Uri;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/server/notification/ZenModeHelper;Ljava/lang/Integer;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/notification/ZenModeHelper;->setPreviousRingerModeSetting(Ljava/lang/Integer;)V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/server/notification/ZenModeHelper;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/notification/ZenModeHelper;->setZenModeSetting(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    const-string/jumbo v0, "ZenModeHelper"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/android/server/notification/ConditionProviders;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;

    invoke-direct {v0, p0, v1}, Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;-><init>(Lcom/android/server/notification/ZenModeHelper;Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mRingerModeDelegate:Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    new-instance v0, Lcom/android/server/notification/ZenModeHelper$Metrics;

    invoke-direct {v0, p0, v1}, Lcom/android/server/notification/ZenModeHelper$Metrics;-><init>(Lcom/android/server/notification/ZenModeHelper;Lcom/android/server/notification/ZenModeHelper$Metrics;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mMetrics:Lcom/android/server/notification/ZenModeHelper$Metrics;

    iput v2, p0, Lcom/android/server/notification/ZenModeHelper;->mUser:I

    new-instance v0, Lcom/android/server/notification/ZenModeHelper$1;

    invoke-direct {v0, p0}, Lcom/android/server/notification/ZenModeHelper$1;-><init>(Lcom/android/server/notification/ZenModeHelper;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigMigration:Landroid/service/notification/ZenModeConfig$Migration;

    iput-object p1, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/android/server/notification/ZenModeHelper$H;

    invoke-direct {v0, p0, p2, v1}, Lcom/android/server/notification/ZenModeHelper$H;-><init>(Lcom/android/server/notification/ZenModeHelper;Landroid/os/Looper;Lcom/android/server/notification/ZenModeHelper$H;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mMetrics:Lcom/android/server/notification/ZenModeHelper$Metrics;

    invoke-virtual {p0, v0}, Lcom/android/server/notification/ZenModeHelper;->addCallback(Lcom/android/server/notification/ZenModeHelper$Callback;)V

    const-string/jumbo v0, "appops"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAppOps:Landroid/app/AppOpsManager;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/server/notification/ZenModeHelper;->readDefaultConfig(Landroid/content/res/Resources;)Landroid/service/notification/ZenModeConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    invoke-direct {p0, v0}, Lcom/android/server/notification/ZenModeHelper;->appendDefaultScheduleRules(Landroid/service/notification/ZenModeConfig;)V

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    invoke-direct {p0, v0}, Lcom/android/server/notification/ZenModeHelper;->appendDefaultEventRules(Landroid/service/notification/ZenModeConfig;)V

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    new-instance v0, Lcom/android/server/notification/ZenModeHelper$SettingsObserver;

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    invoke-direct {v0, p0, v1}, Lcom/android/server/notification/ZenModeHelper$SettingsObserver;-><init>(Lcom/android/server/notification/ZenModeHelper;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mSettingsObserver:Lcom/android/server/notification/ZenModeHelper$SettingsObserver;

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mSettingsObserver:Lcom/android/server/notification/ZenModeHelper$SettingsObserver;

    invoke-virtual {v0}, Lcom/android/server/notification/ZenModeHelper$SettingsObserver;->observe()V

    new-instance v0, Lcom/android/server/notification/ZenModeFiltering;

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/server/notification/ZenModeFiltering;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mFiltering:Lcom/android/server/notification/ZenModeFiltering;

    new-instance v0, Lcom/android/server/notification/ZenModeConditions;

    invoke-direct {v0, p0, p3}, Lcom/android/server/notification/ZenModeConditions;-><init>(Lcom/android/server/notification/ZenModeHelper;Lcom/android/server/notification/ConditionProviders;)V

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConditions:Lcom/android/server/notification/ZenModeConditions;

    return-void
.end method

.method private appendDefaultEventRules(Landroid/service/notification/ZenModeConfig;)V
    .locals 4

    const/4 v2, 0x0

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/service/notification/ZenModeConfig$EventInfo;

    invoke-direct {v0}, Landroid/service/notification/ZenModeConfig$EventInfo;-><init>()V

    iput-object v2, v0, Landroid/service/notification/ZenModeConfig$EventInfo;->calendar:Ljava/lang/String;

    const/4 v2, 0x1

    iput v2, v0, Landroid/service/notification/ZenModeConfig$EventInfo;->reply:I

    new-instance v1, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-direct {v1}, Landroid/service/notification/ZenModeConfig$ZenRule;-><init>()V

    const/4 v2, 0x0

    iput-boolean v2, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->enabled:Z

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040602

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/service/notification/ZenModeConfig;->toEventConditionId(Landroid/service/notification/ZenModeConfig$EventInfo;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->conditionId:Landroid/net/Uri;

    const/4 v2, 0x3

    iput v2, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    iget-object v2, p1, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {p1}, Landroid/service/notification/ZenModeConfig;->newRuleId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private appendDefaultScheduleRules(Landroid/service/notification/ZenModeConfig;)V
    .locals 8

    const/4 v7, 0x3

    const/4 v6, 0x0

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;

    invoke-direct {v3}, Landroid/service/notification/ZenModeConfig$ScheduleInfo;-><init>()V

    sget-object v4, Landroid/service/notification/ZenModeConfig;->WEEKNIGHT_DAYS:[I

    iput-object v4, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->days:[I

    const/16 v4, 0x16

    iput v4, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->startHour:I

    const/4 v4, 0x7

    iput v4, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->endHour:I

    new-instance v0, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-direct {v0}, Landroid/service/notification/ZenModeConfig$ZenRule;-><init>()V

    iput-boolean v6, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->enabled:Z

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1040600

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->name:Ljava/lang/String;

    invoke-static {v3}, Landroid/service/notification/ZenModeConfig;->toScheduleConditionId(Landroid/service/notification/ZenModeConfig$ScheduleInfo;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->conditionId:Landroid/net/Uri;

    iput v7, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    iget-object v4, p1, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {p1}, Landroid/service/notification/ZenModeConfig;->newRuleId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroid/service/notification/ZenModeConfig$ScheduleInfo;

    invoke-direct {v2}, Landroid/service/notification/ZenModeConfig$ScheduleInfo;-><init>()V

    sget-object v4, Landroid/service/notification/ZenModeConfig;->WEEKEND_DAYS:[I

    iput-object v4, v2, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->days:[I

    const/16 v4, 0x17

    iput v4, v2, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->startHour:I

    const/16 v4, 0x1e

    iput v4, v2, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->startMinute:I

    const/16 v4, 0xa

    iput v4, v2, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->endHour:I

    new-instance v1, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-direct {v1}, Landroid/service/notification/ZenModeConfig$ZenRule;-><init>()V

    iput-boolean v6, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->enabled:Z

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1040601

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->name:Ljava/lang/String;

    invoke-static {v2}, Landroid/service/notification/ZenModeConfig;->toScheduleConditionId(Landroid/service/notification/ZenModeConfig$ScheduleInfo;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->conditionId:Landroid/net/Uri;

    iput v7, v1, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    iget-object v4, p1, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {p1}, Landroid/service/notification/ZenModeConfig;->newRuleId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private applyRestrictions()V
    .locals 6

    iget v4, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    if-eqz v4, :cond_1

    const/4 v3, 0x1

    :goto_0
    iget-boolean v2, p0, Lcom/android/server/notification/ZenModeHelper;->mEffectsSuppressed:Z

    const/4 v4, 0x5

    invoke-direct {p0, v2, v4}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions(ZI)V

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-boolean v4, v4, Landroid/service/notification/ZenModeConfig;->allowCalls:Z

    if-eqz v4, :cond_2

    :cond_0
    const/4 v1, 0x0

    :goto_1
    const/4 v4, 0x6

    invoke-direct {p0, v1, v4}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions(ZI)V

    iget v4, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    const/4 v0, 0x1

    :goto_2
    const/4 v4, 0x4

    invoke-direct {p0, v0, v4}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions(ZI)V

    invoke-virtual {p0}, Lcom/android/server/notification/ZenModeHelper;->readAllowLightsFromSettings()V

    return-void

    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-boolean v4, v4, Landroid/service/notification/ZenModeConfig;->allowRepeatCallers:Z

    if-nez v4, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private applyRestrictions(ZI)V
    .locals 6

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mAppOps:Landroid/app/AppOpsManager;

    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    const/4 v5, 0x3

    invoke-virtual {v4, v5, p2, v1, v0}, Landroid/app/AppOpsManager;->setRestriction(III[Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mAppOps:Landroid/app/AppOpsManager;

    if-eqz p1, :cond_1

    :goto_1
    const/16 v3, 0x1c

    invoke-virtual {v1, v3, p2, v2, v0}, Landroid/app/AppOpsManager;->setRestriction(III[Ljava/lang/String;)V

    return-void

    :cond_0
    move v1, v3

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method private applyZenToRingerMode()V
    .locals 4

    const/4 v3, 0x0

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    if-nez v2, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    invoke-virtual {v2}, Landroid/media/AudioManagerInternal;->getRingerModeInternal()I

    move-result v1

    move v0, v1

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    packed-switch v2, :pswitch_data_0

    :cond_1
    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    const-string/jumbo v3, "ZenModeHelper"

    invoke-virtual {v2, v0, v3}, Landroid/media/AudioManagerInternal;->setRingerModeInternal(ILjava/lang/String;)V

    :cond_2
    return-void

    :pswitch_0
    if-eqz v1, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/server/notification/ZenModeHelper;->setPreviousRingerModeSetting(Ljava/lang/Integer;)V

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_1
    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->getPreviousRingerModeSetting()I

    move-result v0

    invoke-direct {p0, v3}, Lcom/android/server/notification/ZenModeHelper;->setPreviousRingerModeSetting(Ljava/lang/Integer;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private computeZenMode(Landroid/util/ArraySet;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArraySet",
            "<",
            "Landroid/service/notification/ZenModeConfig$ZenRule;",
            ">;)I"
        }
    .end annotation

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    if-nez v3, :cond_0

    const/4 v3, 0x0

    return v3

    :cond_0
    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-object v3, v3, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-object v3, v3, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    iget v3, v3, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    return v3

    :cond_1
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    iget-object v3, v3, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-virtual {v0}, Landroid/service/notification/ZenModeConfig$ZenRule;->isAutomaticActive()Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    invoke-static {v3}, Lcom/android/server/notification/ZenModeHelper;->zenSeverity(I)I

    move-result v3

    invoke-static {v2}, Lcom/android/server/notification/ZenModeHelper;->zenSeverity(I)I

    move-result v4

    if-le v3, v4, :cond_2

    iget v2, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    goto :goto_0

    :cond_3
    return v2
.end method

.method private dispatchOnConfigChanged()V
    .locals 3

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/notification/ZenModeHelper$Callback;

    invoke-virtual {v0}, Lcom/android/server/notification/ZenModeHelper$Callback;->onConfigChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private dispatchOnPolicyChanged()V
    .locals 3

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/notification/ZenModeHelper$Callback;

    invoke-virtual {v0}, Lcom/android/server/notification/ZenModeHelper$Callback;->onPolicyChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private dispatchOnZenModeChanged()V
    .locals 3

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/notification/ZenModeHelper$Callback;

    invoke-virtual {v0}, Lcom/android/server/notification/ZenModeHelper$Callback;->onZenModeChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static dump(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Landroid/service/notification/ZenModeConfig;)V
    .locals 6

    const/4 v5, 0x0

    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const/16 v2, 0x3d

    invoke-virtual {p0, v2}, Ljava/io/PrintWriter;->print(C)V

    if-nez p3, :cond_0

    invoke-virtual {p0, p3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    return-void

    :cond_0
    const-string/jumbo v2, "allow(calls=%s,callsFrom=%s,repeatCallers=%s,messages=%s,messagesFrom=%s,events=%s,reminders=%s)\n"

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    iget-boolean v4, p3, Landroid/service/notification/ZenModeConfig;->allowCalls:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    iget v4, p3, Landroid/service/notification/ZenModeConfig;->allowCallsFrom:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-boolean v4, p3, Landroid/service/notification/ZenModeConfig;->allowRepeatCallers:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget-boolean v4, p3, Landroid/service/notification/ZenModeConfig;->allowMessages:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget v4, p3, Landroid/service/notification/ZenModeConfig;->allowMessagesFrom:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    iget-boolean v4, p3, Landroid/service/notification/ZenModeConfig;->allowEvents:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x5

    aput-object v4, v3, v5

    iget-boolean v4, p3, Landroid/service/notification/ZenModeConfig;->allowReminders:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x6

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v2, "  manualRule="

    invoke-virtual {p0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v2, p3, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-virtual {p0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    iget-object v2, p3, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    :cond_1
    iget-object v2, p3, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    if-nez v1, :cond_2

    const-string/jumbo v2, "  automaticRules="

    :goto_1
    invoke-virtual {p0, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v2, p3, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string/jumbo v2, "                 "

    goto :goto_1

    :cond_3
    return-void
.end method

.method private evaluateZenMode(Ljava/lang/String;Z)Z
    .locals 4

    sget-boolean v2, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string/jumbo v2, "ZenModeHelper"

    const-string/jumbo v3, "evaluateZenMode"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    invoke-direct {p0, v0}, Lcom/android/server/notification/ZenModeHelper;->computeZenMode(Landroid/util/ArraySet;)I

    move-result v1

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    if-ne v1, v2, :cond_1

    const/4 v2, 0x0

    return v2

    :cond_1
    invoke-static {v1, p1}, Lcom/android/server/notification/ZenLog;->traceSetZenMode(ILjava/lang/String;)V

    iput v1, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->updateRingerModeAffectedStreams()V

    invoke-virtual {p0}, Lcom/android/server/notification/ZenModeHelper;->readAllowLightsFromSettings()V

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    invoke-direct {p0, v2}, Lcom/android/server/notification/ZenModeHelper;->setZenModeSetting(I)V

    if-eqz p2, :cond_2

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->applyZenToRingerMode()V

    :cond_2
    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions()V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    invoke-static {v2}, Lcom/android/server/notification/ZenModeHelper$H;->-wrap0(Lcom/android/server/notification/ZenModeHelper$H;)V

    const/4 v2, 0x1

    return v2
.end method

.method private static getNotificationPolicy(Landroid/service/notification/ZenModeConfig;)Landroid/app/NotificationManager$Policy;
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/service/notification/ZenModeConfig;->toNotificationPolicy()Landroid/app/NotificationManager$Policy;

    move-result-object v0

    goto :goto_0
.end method

.method private getPreviousRingerModeSetting()I
    .locals 3

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "zen_mode_ringer_level"

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getZenModeSetting()I
    .locals 3

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "zen_mode"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private readDefaultConfig(Landroid/content/res/Resources;)Landroid/service/notification/ZenModeConfig;
    .locals 5

    const/4 v2, 0x0

    const v3, 0x1110004

    :try_start_0
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigMigration:Landroid/service/notification/ZenModeConfig$Migration;

    invoke-static {v2, v3}, Landroid/service/notification/ZenModeConfig;->readXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/service/notification/ZenModeConfig$Migration;)Landroid/service/notification/ZenModeConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    return-object v0

    :cond_1
    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    :goto_0
    new-instance v3, Landroid/service/notification/ZenModeConfig;

    invoke-direct {v3}, Landroid/service/notification/ZenModeConfig;-><init>()V

    return-object v3

    :catch_0
    move-exception v1

    :try_start_1
    const-string/jumbo v3, "ZenModeHelper"

    const-string/jumbo v4, "Error reading default zen mode config from resource"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    throw v3
.end method

.method private setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;Z)Z
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/service/notification/ZenModeConfig;->isValid()Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p1, Landroid/service/notification/ZenModeConfig;->user:I

    iget v3, p0, Lcom/android/server/notification/ZenModeHelper;->mUser:I

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    iget v3, p1, Landroid/service/notification/ZenModeConfig;->user:I

    invoke-virtual {v2, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-boolean v2, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string/jumbo v2, "ZenModeHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setConfig: store config for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Landroid/service/notification/ZenModeConfig;->user:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v5

    :cond_1
    const-string/jumbo v2, "ZenModeHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid config in setConfig; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v6

    :cond_2
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConditions:Lcom/android/server/notification/ZenModeConditions;

    invoke-virtual {v2, p1, v6}, Lcom/android/server/notification/ZenModeConditions;->evaluateConfig(Landroid/service/notification/ZenModeConfig;Z)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    iget v3, p1, Landroid/service/notification/ZenModeConfig;->user:I

    invoke-virtual {v2, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {p1, v2}, Landroid/service/notification/ZenModeConfig;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    return v5

    :cond_3
    sget-boolean v2, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v2, :cond_4

    const-string/jumbo v2, "ZenModeHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setConfig reason="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/Throwable;

    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-static {p2, v2, p1}, Lcom/android/server/notification/ZenLog;->traceConfig(Ljava/lang/String;Landroid/service/notification/ZenModeConfig;Landroid/service/notification/ZenModeConfig;)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-static {v2}, Lcom/android/server/notification/ZenModeHelper;->getNotificationPolicy(Landroid/service/notification/ZenModeConfig;)Landroid/app/NotificationManager$Policy;

    move-result-object v2

    invoke-static {p1}, Lcom/android/server/notification/ZenModeHelper;->getNotificationPolicy(Landroid/service/notification/ZenModeConfig;)Landroid/app/NotificationManager$Policy;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v0, 0x0

    :goto_0
    iput-object p1, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->dispatchOnConfigChanged()V

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->dispatchOnPolicyChanged()V

    :cond_5
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v2}, Landroid/service/notification/ZenModeConfig;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "zen_mode_config_etag"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0, p2, p3}, Lcom/android/server/notification/ZenModeHelper;->evaluateZenMode(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions()V

    :cond_6
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConditions:Lcom/android/server/notification/ZenModeConditions;

    invoke-virtual {v2, p1, v5}, Lcom/android/server/notification/ZenModeConditions;->evaluateConfig(Landroid/service/notification/ZenModeConfig;Z)V

    return v5

    :cond_7
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private setManualZenMode(ILandroid/net/Uri;Ljava/lang/String;Z)V
    .locals 9

    const/4 v8, 0x0

    const/4 v7, 0x1

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    if-nez v4, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/provider/Settings$Global;->isValidZenMode(I)Z

    move-result v4

    if-nez v4, :cond_1

    return-void

    :cond_1
    sget-boolean v4, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string/jumbo v4, "ZenModeHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "setManualZenMode "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Landroid/provider/Settings$Global;->zenModeToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " conditionId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " reason="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " setRingerMode="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v4}, Landroid/service/notification/ZenModeConfig;->copy()Landroid/service/notification/ZenModeConfig;

    move-result-object v2

    if-nez p1, :cond_4

    iput-object v8, v2, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    iget-object v4, v2, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v4}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-virtual {v0}, Landroid/service/notification/ZenModeConfig$ZenRule;->isAutomaticActive()Z

    move-result v4

    if-eqz v4, :cond_3

    iput-boolean v7, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->snoozing:Z

    goto :goto_0

    :cond_4
    new-instance v3, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-direct {v3}, Landroid/service/notification/ZenModeConfig$ZenRule;-><init>()V

    iput-boolean v7, v3, Landroid/service/notification/ZenModeConfig$ZenRule;->enabled:Z

    iput p1, v3, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    iput-object p2, v3, Landroid/service/notification/ZenModeConfig$ZenRule;->conditionId:Landroid/net/Uri;

    iput-object v3, v2, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    :cond_5
    invoke-direct {p0, v2, p3, p4}, Lcom/android/server/notification/ZenModeHelper;->setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;Z)Z

    return-void
.end method

.method private setPreviousRingerModeSetting(Ljava/lang/Integer;)V
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "zen_mode_ringer_level"

    if-nez p1, :cond_0

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private setZenModeSetting(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "zen_mode"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method private updateRingerModeAffectedStreams()V
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    invoke-virtual {v0}, Landroid/media/AudioManagerInternal;->updateRingerModeAffectedStreamsInternal()V

    :cond_0
    return-void
.end method

.method private static zenSeverity(I)I
    .locals 1

    packed-switch p0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    const/4 v0, 0x1

    return v0

    :pswitch_1
    const/4 v0, 0x2

    return v0

    :pswitch_2
    const/4 v0, 0x3

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public addCallback(Lcom/android/server/notification/ZenModeHelper$Callback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 4

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v2, "mZenMode="

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    invoke-static {v2}, Landroid/provider/Settings$Global;->zenModeToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string/jumbo v2, "mDefaultConfig"

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    invoke-static {p1, p2, v2, v3}, Lcom/android/server/notification/ZenModeHelper;->dump(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Landroid/service/notification/ZenModeConfig;)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "mConfigs[u="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/service/notification/ZenModeConfig;

    invoke-static {p1, p2, v3, v2}, Lcom/android/server/notification/ZenModeHelper;->dump(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Landroid/service/notification/ZenModeConfig;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v2, "mUser="

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mUser:I

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(I)V

    const-string/jumbo v2, "mConfig"

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-static {p1, p2, v2, v3}, Lcom/android/server/notification/ZenModeHelper;->dump(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;Landroid/service/notification/ZenModeConfig;)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v2, "mEffectsSuppressed="

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/android/server/notification/ZenModeHelper;->mEffectsSuppressed:Z

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Z)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mFiltering:Lcom/android/server/notification/ZenModeFiltering;

    invoke-virtual {v2, p1, p2}, Lcom/android/server/notification/ZenModeFiltering;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConditions:Lcom/android/server/notification/ZenModeConditions;

    invoke-virtual {v2, p1, p2}, Lcom/android/server/notification/ZenModeConditions;->dump(Ljava/io/PrintWriter;Ljava/lang/String;)V

    return-void
.end method

.method public getAllowLights()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAllowLights:Z

    return v0
.end method

.method public getConfig()Landroid/service/notification/ZenModeConfig;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    return-object v0
.end method

.method public getLooper()Landroid/os/Looper;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    invoke-virtual {v0}, Lcom/android/server/notification/ZenModeHelper$H;->getLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public getNotificationPolicy()Landroid/app/NotificationManager$Policy;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-static {v0}, Lcom/android/server/notification/ZenModeHelper;->getNotificationPolicy(Landroid/service/notification/ZenModeConfig;)Landroid/app/NotificationManager$Policy;

    move-result-object v0

    return-object v0
.end method

.method public getZenMode()I
    .locals 1

    iget v0, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    return v0
.end method

.method public getZenModeListenerInterruptionFilter()I
    .locals 1

    iget v0, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    invoke-static {v0}, Landroid/app/NotificationManager;->zenModeToInterruptionFilter(I)I

    move-result v0

    return v0
.end method

.method public initZenMode()V
    .locals 2

    sget-boolean v0, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ZenModeHelper"

    const-string/jumbo v1, "initZenMode"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const-string/jumbo v0, "init"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/server/notification/ZenModeHelper;->evaluateZenMode(Ljava/lang/String;Z)Z

    return-void
.end method

.method public isCall(Lcom/android/server/notification/NotificationRecord;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mFiltering:Lcom/android/server/notification/ZenModeFiltering;

    invoke-virtual {v0, p1}, Lcom/android/server/notification/ZenModeFiltering;->isCall(Lcom/android/server/notification/NotificationRecord;)Z

    move-result v0

    return v0
.end method

.method public matchesCallFilter(Landroid/os/UserHandle;Landroid/os/Bundle;Lcom/android/server/notification/ValidateNotificationPeople;IF)Z
    .locals 8

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    invoke-static/range {v0 .. v7}, Lcom/android/server/notification/ZenModeFiltering;->matchesCallFilter(Landroid/content/Context;ILandroid/service/notification/ZenModeConfig;Landroid/os/UserHandle;Landroid/os/Bundle;Lcom/android/server/notification/ValidateNotificationPeople;IF)Z

    move-result v0

    return v0
.end method

.method public onSystemReady()V
    .locals 2

    sget-boolean v0, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "ZenModeHelper"

    const-string/jumbo v1, "onSystemReady"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const-class v0, Landroid/media/AudioManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManagerInternal;

    iput-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAudioManager:Landroid/media/AudioManagerInternal;

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mRingerModeDelegate:Lcom/android/server/notification/ZenModeHelper$RingerModeDelegate;

    invoke-virtual {v0, v1}, Landroid/media/AudioManagerInternal;->setRingerModeDelegate(Landroid/media/AudioManagerInternal$RingerModeDelegate;)V

    :cond_1
    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    invoke-static {v0}, Lcom/android/server/notification/ZenModeHelper$H;->-wrap1(Lcom/android/server/notification/ZenModeHelper$H;)V

    return-void
.end method

.method public onUserRemoved(I)V
    .locals 3

    if-gez p1, :cond_0

    return-void

    :cond_0
    sget-boolean v0, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "ZenModeHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onUserRemoved u="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    return-void
.end method

.method public onUserSwitched(I)V
    .locals 4

    iget v1, p0, Lcom/android/server/notification/ZenModeHelper;->mUser:I

    if-eq v1, p1, :cond_0

    if-gez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    iput p1, p0, Lcom/android/server/notification/ZenModeHelper;->mUser:I

    sget-boolean v1, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string/jumbo v1, "ZenModeHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onUserSwitched u="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/service/notification/ZenModeConfig;

    if-nez v0, :cond_4

    sget-boolean v1, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v1, :cond_3

    const-string/jumbo v1, "ZenModeHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onUserSwitched: generating default config for user "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mDefaultConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v1}, Landroid/service/notification/ZenModeConfig;->copy()Landroid/service/notification/ZenModeConfig;

    move-result-object v0

    iput p1, v0, Landroid/service/notification/ZenModeConfig;->user:I

    :cond_4
    const-string/jumbo v1, "onUserSwitched"

    invoke-virtual {p0, v0, v1}, Lcom/android/server/notification/ZenModeHelper;->setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)Z

    return-void
.end method

.method public readAllowLightsFromSettings()V
    .locals 4

    const/4 v1, 0x0

    const/4 v0, 0x1

    iget v2, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    packed-switch v2, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "allow_lights"

    invoke-static {v2, v3, v0}, Lcyanogenmod/providers/CMSettings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_1
    iput-boolean v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAllowLights:Z

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    :pswitch_1
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v3, "zen_priority_allow_lights"

    invoke-static {v2, v3, v0}, Lcyanogenmod/providers/CMSettings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_1

    :goto_2
    iput-boolean v0, p0, Lcom/android/server/notification/ZenModeHelper;->mAllowLights:Z

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public readXml(Lorg/xmlpull/v1/XmlPullParser;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v5, 0x0

    const/4 v4, 0x0

    iget-object v3, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigMigration:Landroid/service/notification/ZenModeConfig$Migration;

    invoke-static {p1, v3}, Landroid/service/notification/ZenModeConfig;->readXml(Lorg/xmlpull/v1/XmlPullParser;Landroid/service/notification/ZenModeConfig$Migration;)Landroid/service/notification/ZenModeConfig;

    move-result-object v2

    if-eqz v2, :cond_3

    if-eqz p2, :cond_1

    iget v3, v2, Landroid/service/notification/ZenModeConfig;->user:I

    if-eqz v3, :cond_0

    return-void

    :cond_0
    iput-object v4, v2, Landroid/service/notification/ZenModeConfig;->manualRule:Landroid/service/notification/ZenModeConfig$ZenRule;

    iget-object v3, v2, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    if-eqz v3, :cond_1

    iget-object v3, v2, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/service/notification/ZenModeConfig$ZenRule;

    iput-boolean v5, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->snoozing:Z

    iput-object v4, v0, Landroid/service/notification/ZenModeConfig$ZenRule;->condition:Landroid/service/notification/Condition;

    goto :goto_0

    :cond_1
    sget-boolean v3, Lcom/android/server/notification/ZenModeHelper;->DEBUG:Z

    if-eqz v3, :cond_2

    const-string/jumbo v3, "ZenModeHelper"

    const-string/jumbo v4, "readXml"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const-string/jumbo v3, "readXml"

    invoke-virtual {p0, v2, v3}, Lcom/android/server/notification/ZenModeHelper;->setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)Z

    :cond_3
    return-void
.end method

.method public removeCallback(Lcom/android/server/notification/ZenModeHelper$Callback;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public requestFromListener(Landroid/content/ComponentName;I)V
    .locals 4

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-static {p2, v1}, Landroid/app/NotificationManager;->zenModeFromInterruptionFilter(II)I

    move-result v0

    if-eq v0, v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "listener:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v2, v1}, Lcom/android/server/notification/ZenModeHelper;->setManualZenMode(ILandroid/net/Uri;Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    move-object v1, v2

    goto :goto_0
.end method

.method public requestZenModeConditions(Landroid/service/notification/IConditionListener;I)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mConditions:Lcom/android/server/notification/ZenModeConditions;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/notification/ZenModeConditions;->requestConditions(Landroid/service/notification/IConditionListener;I)V

    return-void
.end method

.method public setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/android/server/notification/ZenModeHelper;->setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setConfigAsync(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mHandler:Lcom/android/server/notification/ZenModeHelper$H;

    invoke-static {v0, p1, p2}, Lcom/android/server/notification/ZenModeHelper$H;->-wrap2(Lcom/android/server/notification/ZenModeHelper$H;Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)V

    return-void
.end method

.method public setEffectsSuppressed(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/server/notification/ZenModeHelper;->mEffectsSuppressed:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/android/server/notification/ZenModeHelper;->mEffectsSuppressed:Z

    invoke-direct {p0}, Lcom/android/server/notification/ZenModeHelper;->applyRestrictions()V

    return-void
.end method

.method public setManualZenMode(ILandroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/server/notification/ZenModeHelper;->setManualZenMode(ILandroid/net/Uri;Ljava/lang/String;Z)V

    return-void
.end method

.method public setNotificationPolicy(Landroid/app/NotificationManager$Policy;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    if-nez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v1}, Landroid/service/notification/ZenModeConfig;->copy()Landroid/service/notification/ZenModeConfig;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/service/notification/ZenModeConfig;->applyNotificationPolicy(Landroid/app/NotificationManager$Policy;)V

    const-string/jumbo v1, "setNotificationPolicy"

    invoke-virtual {p0, v0, v1}, Lcom/android/server/notification/ZenModeHelper;->setConfig(Landroid/service/notification/ZenModeConfig;Ljava/lang/String;)Z

    return-void
.end method

.method public shouldIntercept(Lcom/android/server/notification/NotificationRecord;)Z
    .locals 3

    iget-object v0, p0, Lcom/android/server/notification/ZenModeHelper;->mFiltering:Lcom/android/server/notification/ZenModeFiltering;

    iget v1, p0, Lcom/android/server/notification/ZenModeHelper;->mZenMode:I

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfig:Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/server/notification/ZenModeFiltering;->shouldIntercept(ILandroid/service/notification/ZenModeConfig;Lcom/android/server/notification/NotificationRecord;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "ZenModeHelper"

    return-object v0
.end method

.method public writeXml(Lorg/xmlpull/v1/XmlSerializer;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    if-eqz p2, :cond_0

    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    if-eqz v2, :cond_0

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/server/notification/ZenModeHelper;->mConfigs:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/service/notification/ZenModeConfig;

    invoke-virtual {v2, p1}, Landroid/service/notification/ZenModeConfig;->writeXml(Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_1

    :cond_1
    return-void
.end method
