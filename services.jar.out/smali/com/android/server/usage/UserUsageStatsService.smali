.class Lcom/android/server/usage/UserUsageStatsService;
.super Ljava/lang/Object;
.source "UserUsageStatsService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;,
        Lcom/android/server/usage/UserUsageStatsService$1;,
        Lcom/android/server/usage/UserUsageStatsService$2;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "UsageStatsService"

.field private static final sConfigStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/server/usage/UsageStatsDatabase$StatCombiner",
            "<",
            "Landroid/app/usage/ConfigurationStats;",
            ">;"
        }
    .end annotation
.end field

.field private static final sDateFormat:Ljava/text/SimpleDateFormat;

.field private static final sDateFormatFlags:I = 0x20015

.field private static final sUsageStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/server/usage/UsageStatsDatabase$StatCombiner",
            "<",
            "Landroid/app/usage/UsageStats;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

.field private final mContext:Landroid/content/Context;

.field private final mCurrentStats:[Lcom/android/server/usage/IntervalStats;

.field private final mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

.field private final mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

.field private final mListener:Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;

.field private final mLogPrefix:Ljava/lang/String;

.field private mStatsChanged:Z

.field private final mUserId:I


# direct methods
.method static synthetic -wrap0(Lcom/android/server/usage/IntervalStats;Lcom/android/server/usage/IntervalStats;J)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/android/server/usage/UserUsageStatsService;->mergePackageStats(Lcom/android/server/usage/IntervalStats;Lcom/android/server/usage/IntervalStats;J)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/usage/UserUsageStatsService;->sDateFormat:Ljava/text/SimpleDateFormat;

    new-instance v0, Lcom/android/server/usage/UserUsageStatsService$1;

    invoke-direct {v0}, Lcom/android/server/usage/UserUsageStatsService$1;-><init>()V

    sput-object v0, Lcom/android/server/usage/UserUsageStatsService;->sUsageStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;

    new-instance v0, Lcom/android/server/usage/UserUsageStatsService$2;

    invoke-direct {v0}, Lcom/android/server/usage/UserUsageStatsService$2;-><init>()V

    sput-object v0, Lcom/android/server/usage/UserUsageStatsService;->sConfigStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;ILjava/io/File;Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    iput-object p1, p0, Lcom/android/server/usage/UserUsageStatsService;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/android/server/usage/UnixCalendar;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Lcom/android/server/usage/UnixCalendar;-><init>(J)V

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    new-instance v0, Lcom/android/server/usage/UsageStatsDatabase;

    invoke-direct {v0, p3}, Lcom/android/server/usage/UsageStatsDatabase;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/android/server/usage/IntervalStats;

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    iput-object p4, p0, Lcom/android/server/usage/UserUsageStatsService;->mListener:Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "User["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    iput p2, p0, Lcom/android/server/usage/UserUsageStatsService;->mUserId:I

    return-void
.end method

.method private static eventToString(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const-string/jumbo v0, "UNKNOWN"

    return-object v0

    :pswitch_0
    const-string/jumbo v0, "NONE"

    return-object v0

    :pswitch_1
    const-string/jumbo v0, "MOVE_TO_BACKGROUND"

    return-object v0

    :pswitch_2
    const-string/jumbo v0, "MOVE_TO_FOREGROUND"

    return-object v0

    :pswitch_3
    const-string/jumbo v0, "END_OF_DAY"

    return-object v0

    :pswitch_4
    const-string/jumbo v0, "CONTINUE_PREVIOUS_DAY"

    return-object v0

    :pswitch_5
    const-string/jumbo v0, "CONFIGURATION_CHANGE"

    return-object v0

    :pswitch_6
    const-string/jumbo v0, "SYSTEM_INTERACTION"

    return-object v0

    :pswitch_7
    const-string/jumbo v0, "USER_INTERACTION"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private formatDateTime(JZ)Ljava/lang/String;
    .locals 3

    if-eqz p3, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mContext:Landroid/content/Context;

    const v2, 0x20015

    invoke-static {v1, p1, p2, v2}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private formatElapsedTime(JZ)Ljava/lang/String;
    .locals 5

    if-eqz p3, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    div-long v2, p1, v2

    invoke-static {v2, v3}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initializeDefaultsForApps(JJZ)V
    .locals 15

    iget-object v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    iget v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mUserId:I

    const/4 v10, 0x0

    invoke-virtual {v7, v10, v9}, Landroid/content/pm/PackageManager;->getInstalledPackages(II)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_3

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/PackageInfo;

    iget-object v4, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iget-object v9, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v9, :cond_2

    if-nez p5, :cond_0

    iget-object v9, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v9}, Landroid/content/pm/ApplicationInfo;->isSystemApp()Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_0
    invoke-virtual {p0, v4}, Lcom/android/server/usage/UserUsageStatsService;->getBeginIdleTime(Ljava/lang/String;)J

    move-result-wide v10

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-nez v9, :cond_2

    iget-object v10, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v9, 0x0

    array-length v11, v10

    :goto_1
    if-ge v9, v11, :cond_1

    aget-object v8, v10, v9

    const/4 v12, 0x6

    move-wide/from16 v0, p1

    invoke-virtual {v8, v4, v0, v1, v12}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    move-wide/from16 v0, p3

    invoke-virtual {v8, v4, v0, v1}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_1
    iget-object v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    const/4 v10, 0x6

    move-wide/from16 v0, p1

    invoke-virtual {v9, v4, v0, v1, v10}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    iget-object v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    move-wide/from16 v0, p3

    invoke-virtual {v9, v4, v0, v1}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/android/server/usage/UserUsageStatsService;->persistActiveStats()V

    return-void
.end method

.method private static intervalToString(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const-string/jumbo v0, "?"

    return-object v0

    :pswitch_0
    const-string/jumbo v0, "daily"

    return-object v0

    :pswitch_1
    const-string/jumbo v0, "weekly"

    return-object v0

    :pswitch_2
    const-string/jumbo v0, "monthly"

    return-object v0

    :pswitch_3
    const-string/jumbo v0, "yearly"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private loadActiveStats(JZZ)V
    .locals 13

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    const/4 v0, 0x0

    :goto_0
    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v6, v6

    if-ge v0, v6, :cond_4

    invoke-virtual {v1, p1, p2}, Lcom/android/server/usage/UnixCalendar;->setTimeInMillis(J)V

    invoke-static {v1, v0}, Lcom/android/server/usage/UnixCalendar;->truncateTo(Lcom/android/server/usage/UnixCalendar;I)V

    if-nez p3, :cond_1

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    iget-wide v6, v6, Lcom/android/server/usage/IntervalStats;->beginTime:J

    invoke-virtual {v1}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-nez v6, :cond_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    invoke-virtual {v6, v0}, Lcom/android/server/usage/UsageStatsDatabase;->getLatestUsageStatsBeginTime(I)J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v6

    cmp-long v6, v2, v6

    if-ltz v6, :cond_3

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    iget-object v7, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    invoke-virtual {v7, v0}, Lcom/android/server/usage/UsageStatsDatabase;->getLatestUsageStats(I)Lcom/android/server/usage/IntervalStats;

    move-result-object v7

    aput-object v7, v6, v0

    :goto_1
    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    if-nez v6, :cond_2

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    new-instance v7, Lcom/android/server/usage/IntervalStats;

    invoke-direct {v7}, Lcom/android/server/usage/IntervalStats;-><init>()V

    aput-object v7, v6, v0

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    invoke-virtual {v1}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v8

    iput-wide v8, v6, Lcom/android/server/usage/IntervalStats;->beginTime:J

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    iput-wide p1, v6, Lcom/android/server/usage/IntervalStats;->endTime:J

    :cond_2
    if-eqz p4, :cond_0

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v6, v6, v0

    iget-object v6, v6, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v6}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/usage/UsageStats;

    const-wide/16 v6, 0x0

    iput-wide v6, v4, Landroid/app/usage/UsageStats;->mBeginIdleTime:J

    goto :goto_2

    :cond_3
    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v7, 0x0

    aput-object v7, v6, v0

    goto :goto_1

    :cond_4
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v6, p1, p2}, Lcom/android/server/usage/UnixCalendar;->setTimeInMillis(J)V

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/android/server/usage/UnixCalendar;->addDays(I)V

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v6}, Lcom/android/server/usage/UnixCalendar;->truncateToDay()V

    const-string/jumbo v6, "UsageStatsService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "Rollover scheduled @ "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lcom/android/server/usage/UserUsageStatsService;->sDateFormat:Ljava/text/SimpleDateFormat;

    iget-object v9, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v9}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mListener:Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;

    invoke-interface {v6}, Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;->onStatsReloaded()V

    return-void
.end method

.method private static mergePackageStats(Lcom/android/server/usage/IntervalStats;Lcom/android/server/usage/IntervalStats;J)V
    .locals 10

    iget-wide v6, p0, Lcom/android/server/usage/IntervalStats;->endTime:J

    iget-wide v8, p1, Lcom/android/server/usage/IntervalStats;->endTime:J

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/server/usage/IntervalStats;->endTime:J

    iget-object v5, p1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5}, Landroid/util/ArrayMap;->size()I

    move-result v3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_2

    iget-object v5, p1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5, v1}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v5, p1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/usage/UsageStats;

    iget-object v5, p0, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/usage/UsageStats;

    if-nez v0, :cond_1

    new-instance v0, Landroid/app/usage/UsageStats;

    invoke-direct {v0, v4}, Landroid/app/usage/UsageStats;-><init>(Landroid/app/usage/UsageStats;)V

    iget-object v5, p0, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5, v2, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    iget-wide v6, v0, Landroid/app/usage/UsageStats;->mBeginIdleTime:J

    cmp-long v5, v6, p2

    if-lez v5, :cond_0

    iput-wide p2, v0, Landroid/app/usage/UsageStats;->mBeginIdleTime:J

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v5, p1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v5, v1}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/usage/UsageStats;

    invoke-virtual {v0, v5}, Landroid/app/usage/UsageStats;->add(Landroid/app/usage/UsageStats;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method private notifyStatsChanged()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mListener:Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;

    invoke-interface {v0}, Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;->onStatsUpdated()V

    :cond_0
    return-void
.end method

.method private queryStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IJJ",
            "Lcom/android/server/usage/UsageStatsDatabase$StatCombiner",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v2, 0x4

    if-ne p1, v2, :cond_0

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    move-wide/from16 v0, p4

    invoke-virtual {v2, p2, p3, v0, v1}, Lcom/android/server/usage/UsageStatsDatabase;->findBestFitBucket(JJ)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    if-ltz p1, :cond_1

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v2, v2

    if-lt p1, v2, :cond_2

    :cond_1
    return-object v4

    :cond_2
    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v9, v2, p1

    iget-wide v2, v9, Lcom/android/server/usage/IntervalStats;->endTime:J

    cmp-long v2, p2, v2

    if-ltz v2, :cond_3

    return-object v4

    :cond_3
    iget-wide v2, v9, Lcom/android/server/usage/IntervalStats;->beginTime:J

    move-wide/from16 v0, p4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    move v3, p1

    move-wide v4, p2

    move-object/from16 v8, p6

    invoke-virtual/range {v2 .. v8}, Lcom/android/server/usage/UsageStatsDatabase;->queryUsageStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;

    move-result-object v10

    iget-wide v2, v9, Lcom/android/server/usage/IntervalStats;->endTime:J

    cmp-long v2, p2, v2

    if-gez v2, :cond_5

    iget-wide v2, v9, Lcom/android/server/usage/IntervalStats;->beginTime:J

    cmp-long v2, p4, v2

    if-lez v2, :cond_5

    if-nez v10, :cond_4

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    :cond_4
    const/4 v2, 0x1

    move-object/from16 v0, p6

    invoke-interface {v0, v9, v2, v10}, Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;->combine(Lcom/android/server/usage/IntervalStats;ZLjava/util/List;)V

    :cond_5
    return-object v10
.end method

.method private rolloverStats(JJ)V
    .locals 29

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v16

    const-string/jumbo v20, "UsageStatsService"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, "Rolling over usage stats"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget-object v20, v20, v21

    move-object/from16 v0, v20

    iget-object v14, v0, Lcom/android/server/usage/IntervalStats;->activeConfiguration:Landroid/content/res/Configuration;

    new-instance v9, Landroid/util/ArraySet;

    invoke-direct {v9}, Landroid/util/ArraySet;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    move-object/from16 v21, v0

    const/16 v20, 0x0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    :goto_0
    move/from16 v0, v20

    move/from16 v1, v22

    if-ge v0, v1, :cond_3

    aget-object v15, v21, v20

    iget-object v0, v15, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/util/ArrayMap;->size()I

    move-result v12

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v12, :cond_2

    iget-object v0, v15, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/usage/UsageStats;

    iget v0, v13, Landroid/app/usage/UsageStats;->mLastEvent:I

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    iget v0, v13, Landroid/app/usage/UsageStats;->mLastEvent:I

    move/from16 v23, v0

    const/16 v24, 0x4

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, v13, Landroid/app/usage/UsageStats;->mPackageName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    iget-object v0, v13, Landroid/app/usage/UsageStats;->mPackageName:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v24

    const-wide/16 v26, 0x1

    sub-long v24, v24, v26

    const/16 v26, 0x3

    move-object/from16 v0, v23

    move-wide/from16 v1, v24

    move/from16 v3, v26

    invoke-virtual {v15, v0, v1, v2, v3}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v24

    const-wide/16 v26, 0x1

    sub-long v24, v24, v26

    const/16 v23, 0x0

    move-object/from16 v0, v23

    move-wide/from16 v1, v24

    invoke-virtual {v15, v0, v1, v2}, Lcom/android/server/usage/IntervalStats;->updateConfigurationStats(Landroid/content/res/Configuration;J)V

    add-int/lit8 v20, v20, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/usage/UserUsageStatsService;->persistActiveStats()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/android/server/usage/UsageStatsDatabase;->prune(J)V

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/usage/UserUsageStatsService;->loadActiveStats(JZZ)V

    invoke-virtual {v9}, Landroid/util/ArraySet;->size()I

    move-result v8

    const/4 v10, 0x0

    :goto_2
    if-ge v10, v8, :cond_5

    invoke-virtual {v9, v10}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget-object v20, v20, v21

    move-object/from16 v0, v20

    iget-wide v6, v0, Lcom/android/server/usage/IntervalStats;->beginTime:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    move-object/from16 v21, v0

    const/16 v20, 0x0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    :goto_3
    move/from16 v0, v20

    move/from16 v1, v22

    if-ge v0, v1, :cond_4

    aget-object v15, v21, v20

    const/16 v23, 0x4

    move/from16 v0, v23

    invoke-virtual {v15, v11, v6, v7, v0}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    invoke-virtual {v15, v14, v6, v7}, Lcom/android/server/usage/IntervalStats;->updateConfigurationStats(Landroid/content/res/Configuration;J)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    add-int/lit8 v20, v20, 0x1

    goto :goto_3

    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/usage/UserUsageStatsService;->persistActiveStats()V

    invoke-virtual/range {p0 .. p4}, Lcom/android/server/usage/UserUsageStatsService;->refreshAppIdleRollingWindow(JJ)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v20

    sub-long v18, v20, v16

    const-string/jumbo v20, "UsageStatsService"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, "Rolling over usage stats complete. Took "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " milliseconds"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method checkin(Lcom/android/internal/util/IndentingPrintWriter;J)V
    .locals 2

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    new-instance v1, Lcom/android/server/usage/UserUsageStatsService$5;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/server/usage/UserUsageStatsService$5;-><init>(Lcom/android/server/usage/UserUsageStatsService;Lcom/android/internal/util/IndentingPrintWriter;J)V

    invoke-virtual {v0, v1}, Lcom/android/server/usage/UsageStatsDatabase;->checkinDailyFiles(Lcom/android/server/usage/UsageStatsDatabase$CheckinAction;)Z

    return-void
.end method

.method dump(Lcom/android/internal/util/IndentingPrintWriter;J)V
    .locals 8

    const/4 v6, 0x1

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const-string/jumbo v1, "In-memory "

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/android/server/usage/UserUsageStatsService;->intervalToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v1, " stats"

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v3, v1, v0

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p2

    invoke-virtual/range {v1 .. v6}, Lcom/android/server/usage/UserUsageStatsService;->printIntervalStats(Lcom/android/internal/util/IndentingPrintWriter;Lcom/android/server/usage/IntervalStats;JZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "AppIdleRollingWindow cache"

    invoke-virtual {p1, v1}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p2

    invoke-virtual/range {v1 .. v6}, Lcom/android/server/usage/UserUsageStatsService;->printIntervalStats(Lcom/android/internal/util/IndentingPrintWriter;Lcom/android/server/usage/IntervalStats;JZ)V

    return-void
.end method

.method getBeginIdleTime(Ljava/lang/String;)J
    .locals 4

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v1, v1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/usage/UsageStats;

    if-nez v0, :cond_0

    const-wide/16 v2, -0x1

    return-wide v2

    :cond_0
    invoke-virtual {v0}, Landroid/app/usage/UsageStats;->getBeginIdleTime()J

    move-result-wide v2

    return-wide v2
.end method

.method getSystemLastUsedTime(Ljava/lang/String;)J
    .locals 4

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v1, v1, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/usage/UsageStats;

    if-nez v0, :cond_0

    const-wide/16 v2, -0x1

    return-wide v2

    :cond_0
    invoke-virtual {v0}, Landroid/app/usage/UsageStats;->getLastTimeSystemUsed()J

    move-result-wide v2

    return-wide v2
.end method

.method init(JJ)V
    .locals 19

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    move-wide/from16 v0, p1

    invoke-virtual {v5, v0, v1}, Lcom/android/server/usage/UsageStatsDatabase;->init(J)V

    const/4 v11, 0x0

    const/4 v4, 0x0

    :goto_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v5, v5

    if-ge v4, v5, :cond_1

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    invoke-virtual {v6, v4}, Lcom/android/server/usage/UsageStatsDatabase;->getLatestUsageStats(I)Lcom/android/server/usage/IntervalStats;

    move-result-object v6

    aput-object v6, v5, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v5, v5, v4

    if-nez v5, :cond_0

    add-int/lit8 v11, v11, 0x1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    if-lez v11, :cond_5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v5, v5

    if-eq v11, v5, :cond_2

    const-string/jumbo v5, "UsageStatsService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "Some stats have no latest available"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/android/server/usage/UserUsageStatsService;->loadActiveStats(JZZ)V

    :goto_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v5, 0x0

    array-length v7, v6

    :goto_2
    if-ge v5, v7, :cond_7

    aget-object v14, v6, v5

    iget-object v8, v14, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v8}, Landroid/util/ArrayMap;->size()I

    move-result v12

    const/4 v4, 0x0

    :goto_3
    if-ge v4, v12, :cond_6

    iget-object v8, v14, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    invoke-virtual {v8, v4}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/usage/UsageStats;

    iget v8, v13, Landroid/app/usage/UsageStats;->mLastEvent:I

    const/4 v9, 0x1

    if-eq v8, v9, :cond_3

    iget v8, v13, Landroid/app/usage/UsageStats;->mLastEvent:I

    const/4 v9, 0x4

    if-ne v8, v9, :cond_4

    :cond_3
    iget-object v8, v13, Landroid/app/usage/UsageStats;->mPackageName:Ljava/lang/String;

    iget-wide v0, v14, Lcom/android/server/usage/IntervalStats;->lastTimeSaved:J

    move-wide/from16 v16, v0

    const/4 v9, 0x3

    move-wide/from16 v0, v16

    invoke-virtual {v14, v8, v0, v1, v9}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v7, 0x0

    aget-object v6, v6, v7

    iget-wide v6, v6, Lcom/android/server/usage/IntervalStats;->beginTime:J

    invoke-virtual {v5, v6, v7}, Lcom/android/server/usage/UnixCalendar;->setTimeInMillis(J)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/android/server/usage/UnixCalendar;->addDays(I)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v5}, Lcom/android/server/usage/UnixCalendar;->truncateToDay()V

    const-string/jumbo v5, "UsageStatsService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "Rollover scheduled @ "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/android/server/usage/UserUsageStatsService;->sDateFormat:Ljava/text/SimpleDateFormat;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v8}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v7}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_6
    iget-wide v8, v14, Lcom/android/server/usage/IntervalStats;->lastTimeSaved:J

    const/4 v10, 0x0

    invoke-virtual {v14, v10, v8, v9}, Lcom/android/server/usage/IntervalStats;->updateConfigurationStats(Landroid/content/res/Configuration;J)V

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    :cond_7
    invoke-virtual/range {p0 .. p4}, Lcom/android/server/usage/UserUsageStatsService;->refreshAppIdleRollingWindow(JJ)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    invoke-virtual {v5}, Lcom/android/server/usage/UsageStatsDatabase;->isNewUpdate()Z

    move-result v5

    if-eqz v5, :cond_8

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    invoke-virtual {v5}, Lcom/android/server/usage/UsageStatsDatabase;->isFirstUpdate()Z

    move-result v10

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    invoke-direct/range {v5 .. v10}, Lcom/android/server/usage/UserUsageStatsService;->initializeDefaultsForApps(JJZ)V

    :cond_8
    return-void
.end method

.method onTimeChanged(JJJZ)V
    .locals 5

    invoke-virtual {p0}, Lcom/android/server/usage/UserUsageStatsService;->persistActiveStats()V

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    sub-long v2, p3, p1

    invoke-virtual {v0, v2, v3}, Lcom/android/server/usage/UsageStatsDatabase;->onTimeChanged(J)V

    const/4 v0, 0x1

    invoke-direct {p0, p3, p4, v0, p7}, Lcom/android/server/usage/UserUsageStatsService;->loadActiveStats(JZZ)V

    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/android/server/usage/UserUsageStatsService;->refreshAppIdleRollingWindow(JJ)V

    return-void
.end method

.method persistActiveStats()V
    .locals 5

    iget-boolean v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z

    if-eqz v2, :cond_1

    const-string/jumbo v2, "UsageStatsService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Flushing usage stats to disk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    iget-object v3, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v3, v3, v1

    invoke-virtual {v2, v1, v3}, Lcom/android/server/usage/UsageStatsDatabase;->putUsageStats(ILcom/android/server/usage/IntervalStats;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mStatsChanged:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v2, "UsageStatsService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/android/server/usage/UserUsageStatsService;->mLogPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Failed to persist active stats"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method printIntervalStats(Lcom/android/internal/util/IndentingPrintWriter;Lcom/android/server/usage/IntervalStats;JZ)V
    .locals 21

    if-eqz p5, :cond_0

    const-string/jumbo v18, "timeRange"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/usage/UserUsageStatsService;->mContext:Landroid/content/Context;

    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/android/server/usage/IntervalStats;->beginTime:J

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/android/server/usage/IntervalStats;->endTime:J

    const v8, 0x20015

    invoke-static/range {v3 .. v8}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;JJI)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v3}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V

    const-string/jumbo v3, "packages"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/android/server/usage/IntervalStats;->packageStats:Landroid/util/ArrayMap;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/util/ArrayMap;->size()I

    move-result v15

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v15, :cond_1

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/app/usage/UsageStats;

    const-string/jumbo v3, "package"

    move-object/from16 v0, v17

    iget-object v4, v0, Landroid/app/usage/UsageStats;->mPackageName:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "totalTime"

    move-object/from16 v0, v17

    iget-wide v4, v0, Landroid/app/usage/UsageStats;->mTotalTimeInForeground:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatElapsedTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "lastTime"

    move-object/from16 v0, v17

    iget-wide v4, v0, Landroid/app/usage/UsageStats;->mLastTimeUsed:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatDateTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "lastTimeSystem"

    move-object/from16 v0, v17

    iget-wide v4, v0, Landroid/app/usage/UsageStats;->mLastTimeSystemUsed:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatDateTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "inactiveTime"

    move-object/from16 v0, v17

    iget-wide v4, v0, Landroid/app/usage/UsageStats;->mBeginIdleTime:J

    sub-long v4, p3, v4

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatElapsedTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :cond_0
    const-string/jumbo v3, "beginTime"

    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/android/server/usage/IntervalStats;->beginTime:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "endTime"

    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/android/server/usage/IntervalStats;->endTime:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    const-string/jumbo v3, "configurations"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V

    move-object/from16 v0, p2

    iget-object v10, v0, Lcom/android/server/usage/IntervalStats;->configurations:Landroid/util/ArrayMap;

    invoke-virtual {v10}, Landroid/util/ArrayMap;->size()I

    move-result v9

    const/4 v14, 0x0

    :goto_2
    if-ge v14, v9, :cond_2

    invoke-virtual {v10, v14}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/usage/ConfigurationStats;

    const-string/jumbo v3, "config"

    iget-object v4, v2, Landroid/app/usage/ConfigurationStats;->mConfiguration:Landroid/content/res/Configuration;

    invoke-static {v4}, Landroid/content/res/Configuration;->resourceQualifierString(Landroid/content/res/Configuration;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "totalTime"

    iget-wide v4, v2, Landroid/app/usage/ConfigurationStats;->mTotalTimeActive:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatElapsedTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "lastTime"

    iget-wide v4, v2, Landroid/app/usage/ConfigurationStats;->mLastTimeActive:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatDateTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "count"

    iget v4, v2, Landroid/app/usage/ConfigurationStats;->mActivationCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    const-string/jumbo v3, "events"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->increaseIndent()V

    move-object/from16 v0, p2

    iget-object v13, v0, Lcom/android/server/usage/IntervalStats;->events:Landroid/app/usage/TimeSparseArray;

    if-eqz v13, :cond_5

    invoke-virtual {v13}, Landroid/app/usage/TimeSparseArray;->size()I

    move-result v12

    :goto_3
    const/4 v14, 0x0

    :goto_4
    if-ge v14, v12, :cond_6

    invoke-virtual {v13, v14}, Landroid/app/usage/TimeSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/usage/UsageEvents$Event;

    const-string/jumbo v3, "time"

    iget-wide v4, v11, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v4, v5, v1}, Lcom/android/server/usage/UserUsageStatsService;->formatDateTime(JZ)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "type"

    iget v4, v11, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    invoke-static {v4}, Lcom/android/server/usage/UserUsageStatsService;->eventToString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "package"

    iget-object v4, v11, Landroid/app/usage/UsageEvents$Event;->mPackage:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, v11, Landroid/app/usage/UsageEvents$Event;->mClass:Ljava/lang/String;

    if-eqz v3, :cond_3

    const-string/jumbo v3, "class"

    iget-object v4, v11, Landroid/app/usage/UsageEvents$Event;->mClass:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    iget-object v3, v11, Landroid/app/usage/UsageEvents$Event;->mConfiguration:Landroid/content/res/Configuration;

    if-eqz v3, :cond_4

    const-string/jumbo v3, "config"

    iget-object v4, v11, Landroid/app/usage/UsageEvents$Event;->mConfiguration:Landroid/content/res/Configuration;

    invoke-static {v4}, Landroid/content/res/Configuration;->resourceQualifierString(Landroid/content/res/Configuration;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/util/IndentingPrintWriter;->printPair(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->println()V

    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    :cond_5
    const/4 v12, 0x0

    goto :goto_3

    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/util/IndentingPrintWriter;->decreaseIndent()V

    return-void
.end method

.method queryConfigurationStats(IJJ)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJJ)",
            "Ljava/util/List",
            "<",
            "Landroid/app/usage/ConfigurationStats;",
            ">;"
        }
    .end annotation

    sget-object v6, Lcom/android/server/usage/UserUsageStatsService;->sConfigStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/server/usage/UserUsageStatsService;->queryStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method queryEvents(JJ)Landroid/app/usage/UsageEvents;
    .locals 17

    new-instance v6, Landroid/util/ArraySet;

    invoke-direct {v6}, Landroid/util/ArraySet;-><init>()V

    new-instance v0, Lcom/android/server/usage/UserUsageStatsService$3;

    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    move-wide/from16 v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/server/usage/UserUsageStatsService$3;-><init>(Lcom/android/server/usage/UserUsageStatsService;JJLandroid/util/ArraySet;)V

    const/4 v9, 0x0

    move-object/from16 v8, p0

    move-wide/from16 v10, p1

    move-wide/from16 v12, p3

    move-object v14, v0

    invoke-direct/range {v8 .. v14}, Lcom/android/server/usage/UserUsageStatsService;->queryStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    return-object v0

    :cond_1
    invoke-virtual {v6}, Landroid/util/ArraySet;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v6, v0}, Landroid/util/ArraySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Ljava/lang/String;

    invoke-static {v15}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    new-instance v0, Landroid/app/usage/UsageEvents;

    invoke-direct {v0, v7, v15}, Landroid/app/usage/UsageEvents;-><init>(Ljava/util/List;[Ljava/lang/String;)V

    return-object v0
.end method

.method queryUsageStats(IJJ)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJJ)",
            "Ljava/util/List",
            "<",
            "Landroid/app/usage/UsageStats;",
            ">;"
        }
    .end annotation

    sget-object v6, Lcom/android/server/usage/UserUsageStatsService;->sUsageStatsCombiner:Lcom/android/server/usage/UsageStatsDatabase$StatCombiner;

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/server/usage/UserUsageStatsService;->queryStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method refreshAppIdleRollingWindow(JJ)V
    .locals 9

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mListener:Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;

    invoke-interface {v0}, Lcom/android/server/usage/UserUsageStatsService$StatsUpdatedListener;->getAppIdleRollingWindowDurationMillis()J

    move-result-wide v4

    sub-long v2, p1, v4

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mDatabase:Lcom/android/server/usage/UsageStatsDatabase;

    new-instance v6, Lcom/android/server/usage/UserUsageStatsService$4;

    invoke-direct {v6, p0, p3, p4}, Lcom/android/server/usage/UserUsageStatsService$4;-><init>(Lcom/android/server/usage/UserUsageStatsService;J)V

    move-wide v4, p1

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/usage/UsageStatsDatabase;->queryUsageStats(IJJLcom/android/server/usage/UsageStatsDatabase$StatCombiner;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lcom/android/server/usage/IntervalStats;

    invoke-direct {v0}, Lcom/android/server/usage/IntervalStats;-><init>()V

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v4, 0x3

    aget-object v1, v1, v4

    invoke-static {v0, v1, p3, p4}, Lcom/android/server/usage/UserUsageStatsService;->mergePackageStats(Lcom/android/server/usage/IntervalStats;Lcom/android/server/usage/IntervalStats;J)V

    :goto_0
    return-void

    :cond_1
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usage/IntervalStats;

    iput-object v0, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    goto :goto_0
.end method

.method reportEvent(Landroid/app/usage/UsageEvents$Event;J)V
    .locals 12

    const/4 v3, 0x0

    const/4 v10, 0x5

    iget-wide v4, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    iget-object v6, p0, Lcom/android/server/usage/UserUsageStatsService;->mDailyExpiryDate:Lcom/android/server/usage/UnixCalendar;

    invoke-virtual {v6}, Lcom/android/server/usage/UnixCalendar;->getTimeInMillis()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    iget-wide v4, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    invoke-direct {p0, v4, v5, p2, p3}, Lcom/android/server/usage/UserUsageStatsService;->rolloverStats(JJ)V

    :cond_0
    iget-object v4, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    aget-object v0, v4, v3

    iget-object v1, p1, Landroid/app/usage/UsageEvents$Event;->mConfiguration:Landroid/content/res/Configuration;

    iget v4, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    if-ne v4, v10, :cond_1

    iget-object v4, v0, Lcom/android/server/usage/IntervalStats;->activeConfiguration:Landroid/content/res/Configuration;

    if-eqz v4, :cond_1

    iget-object v4, v0, Lcom/android/server/usage/IntervalStats;->activeConfiguration:Landroid/content/res/Configuration;

    invoke-static {v4, v1}, Landroid/content/res/Configuration;->generateDelta(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v4

    iput-object v4, p1, Landroid/app/usage/UsageEvents$Event;->mConfiguration:Landroid/content/res/Configuration;

    :cond_1
    iget-object v4, v0, Lcom/android/server/usage/IntervalStats;->events:Landroid/app/usage/TimeSparseArray;

    if-nez v4, :cond_2

    new-instance v4, Landroid/app/usage/TimeSparseArray;

    invoke-direct {v4}, Landroid/app/usage/TimeSparseArray;-><init>()V

    iput-object v4, v0, Lcom/android/server/usage/IntervalStats;->events:Landroid/app/usage/TimeSparseArray;

    :cond_2
    iget v4, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_3

    iget-object v4, v0, Lcom/android/server/usage/IntervalStats;->events:Landroid/app/usage/TimeSparseArray;

    iget-wide v6, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    invoke-virtual {v4, v6, v7, p1}, Landroid/app/usage/TimeSparseArray;->put(JLjava/lang/Object;)V

    :cond_3
    iget-object v4, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    array-length v5, v4

    :goto_0
    if-ge v3, v5, :cond_5

    aget-object v2, v4, v3

    iget v6, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    if-ne v6, v10, :cond_4

    iget-wide v6, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    invoke-virtual {v2, v1, v6, v7}, Lcom/android/server/usage/IntervalStats;->updateConfigurationStats(Landroid/content/res/Configuration;J)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    iget-object v6, p1, Landroid/app/usage/UsageEvents$Event;->mPackage:Ljava/lang/String;

    iget-wide v8, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    iget v7, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    invoke-virtual {v2, v6, v8, v9, v7}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    iget-object v6, p1, Landroid/app/usage/UsageEvents$Event;->mPackage:Ljava/lang/String;

    invoke-virtual {v2, v6, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    goto :goto_1

    :cond_5
    iget v3, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    if-eq v3, v10, :cond_6

    iget-object v3, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v4, p1, Landroid/app/usage/UsageEvents$Event;->mPackage:Ljava/lang/String;

    iget-wide v6, p1, Landroid/app/usage/UsageEvents$Event;->mTimeStamp:J

    iget v5, p1, Landroid/app/usage/UsageEvents$Event;->mEventType:I

    invoke-virtual {v3, v4, v6, v7, v5}, Lcom/android/server/usage/IntervalStats;->update(Ljava/lang/String;JI)V

    iget-object v3, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    iget-object v4, p1, Landroid/app/usage/UsageEvents$Event;->mPackage:Ljava/lang/String;

    invoke-virtual {v3, v4, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    :cond_6
    invoke-direct {p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    return-void
.end method

.method setBeginIdleTime(Ljava/lang/String;J)V
    .locals 4

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v1, 0x0

    array-length v3, v2

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateBeginIdleTime(Ljava/lang/String;J)V

    invoke-direct {p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    return-void
.end method

.method setSystemLastUsedTime(Ljava/lang/String;J)V
    .locals 4

    iget-object v2, p0, Lcom/android/server/usage/UserUsageStatsService;->mCurrentStats:[Lcom/android/server/usage/IntervalStats;

    const/4 v1, 0x0

    array-length v3, v2

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateSystemLastUsedTime(Ljava/lang/String;J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/server/usage/UserUsageStatsService;->mAppIdleRollingWindow:Lcom/android/server/usage/IntervalStats;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/server/usage/IntervalStats;->updateSystemLastUsedTime(Ljava/lang/String;J)V

    invoke-direct {p0}, Lcom/android/server/usage/UserUsageStatsService;->notifyStatsChanged()V

    return-void
.end method
