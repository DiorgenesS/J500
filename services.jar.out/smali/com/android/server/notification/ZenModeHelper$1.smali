.class Lcom/android/server/notification/ZenModeHelper$1;
.super Ljava/lang/Object;
.source "ZenModeHelper.java"

# interfaces
.implements Landroid/service/notification/ZenModeConfig$Migration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/notification/ZenModeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/notification/ZenModeHelper;


# direct methods
.method constructor <init>(Lcom/android/server/notification/ZenModeHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/notification/ZenModeHelper$1;->this$0:Lcom/android/server/notification/ZenModeHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public migrate(Landroid/service/notification/ZenModeConfig$XmlV1;)Landroid/service/notification/ZenModeConfig;
    .locals 7

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez p1, :cond_0

    return-object v5

    :cond_0
    new-instance v1, Landroid/service/notification/ZenModeConfig;

    invoke-direct {v1}, Landroid/service/notification/ZenModeConfig;-><init>()V

    iget-boolean v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowCalls:Z

    iput-boolean v5, v1, Landroid/service/notification/ZenModeConfig;->allowCalls:Z

    iget-boolean v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowEvents:Z

    iput-boolean v5, v1, Landroid/service/notification/ZenModeConfig;->allowEvents:Z

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowFrom:I

    iput v5, v1, Landroid/service/notification/ZenModeConfig;->allowCallsFrom:I

    iget-boolean v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowMessages:Z

    iput-boolean v5, v1, Landroid/service/notification/ZenModeConfig;->allowMessages:Z

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowFrom:I

    iput v5, v1, Landroid/service/notification/ZenModeConfig;->allowMessagesFrom:I

    iget-boolean v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->allowReminders:Z

    iput-boolean v5, v1, Landroid/service/notification/ZenModeConfig;->allowReminders:Z

    iget-object v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepMode:Ljava/lang/String;

    invoke-static {v5}, Landroid/service/notification/ZenModeConfig$XmlV1;->tryParseDays(Ljava/lang/String;)[I

    move-result-object v0

    if-eqz v0, :cond_2

    array-length v5, v0

    if-lez v5, :cond_2

    const-string/jumbo v5, "ZenModeHelper"

    const-string/jumbo v6, "Migrating existing V1 downtime to single schedule"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;

    invoke-direct {v3}, Landroid/service/notification/ZenModeConfig$ScheduleInfo;-><init>()V

    iput-object v0, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->days:[I

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepStartHour:I

    iput v5, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->startHour:I

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepStartMinute:I

    iput v5, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->startMinute:I

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepEndHour:I

    iput v5, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->endHour:I

    iget v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepEndMinute:I

    iput v5, v3, Landroid/service/notification/ZenModeConfig$ScheduleInfo;->endMinute:I

    new-instance v2, Landroid/service/notification/ZenModeConfig$ZenRule;

    invoke-direct {v2}, Landroid/service/notification/ZenModeConfig$ZenRule;-><init>()V

    iput-boolean v4, v2, Landroid/service/notification/ZenModeConfig$ZenRule;->enabled:Z

    iget-object v5, p0, Lcom/android/server/notification/ZenModeHelper$1;->this$0:Lcom/android/server/notification/ZenModeHelper;

    invoke-static {v5}, Lcom/android/server/notification/ZenModeHelper;->-get0(Lcom/android/server/notification/ZenModeHelper;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x10405ff

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Landroid/service/notification/ZenModeConfig$ZenRule;->name:Ljava/lang/String;

    invoke-static {v3}, Landroid/service/notification/ZenModeConfig;->toScheduleConditionId(Landroid/service/notification/ZenModeConfig$ScheduleInfo;)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, v2, Landroid/service/notification/ZenModeConfig$ZenRule;->conditionId:Landroid/net/Uri;

    iget-boolean v5, p1, Landroid/service/notification/ZenModeConfig$XmlV1;->sleepNone:Z

    if-eqz v5, :cond_1

    const/4 v4, 0x2

    :cond_1
    iput v4, v2, Landroid/service/notification/ZenModeConfig$ZenRule;->zenMode:I

    iget-object v4, v1, Landroid/service/notification/ZenModeConfig;->automaticRules:Landroid/util/ArrayMap;

    invoke-virtual {v1}, Landroid/service/notification/ZenModeConfig;->newRuleId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper$1;->this$0:Lcom/android/server/notification/ZenModeHelper;

    invoke-static {v4, v1}, Lcom/android/server/notification/ZenModeHelper;->-wrap1(Lcom/android/server/notification/ZenModeHelper;Landroid/service/notification/ZenModeConfig;)V

    return-object v1

    :cond_2
    const-string/jumbo v4, "ZenModeHelper"

    const-string/jumbo v5, "No existing V1 downtime found, generating default schedules"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/android/server/notification/ZenModeHelper$1;->this$0:Lcom/android/server/notification/ZenModeHelper;

    invoke-static {v4, v1}, Lcom/android/server/notification/ZenModeHelper;->-wrap2(Lcom/android/server/notification/ZenModeHelper;Landroid/service/notification/ZenModeConfig;)V

    goto :goto_0
.end method
