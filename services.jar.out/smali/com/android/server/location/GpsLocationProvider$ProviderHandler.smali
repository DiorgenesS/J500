.class final Lcom/android/server/location/GpsLocationProvider$ProviderHandler;
.super Landroid/os/Handler;
.source "GpsLocationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/GpsLocationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ProviderHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/location/GpsLocationProvider;


# direct methods
.method public constructor <init>(Lcom/android/server/location/GpsLocationProvider;Landroid/os/Looper;)V
    .locals 2

    iput-object p1, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p2, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;Z)V

    return-void
.end method

.method private initialize()V
    .locals 12

    const/4 v11, 0x0

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v9}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v10}, Lcom/android/server/location/GpsLocationProvider;->-get9(Lcom/android/server/location/GpsLocationProvider;)Ljava/util/Properties;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/android/server/location/GpsLocationProvider;->-wrap25(Lcom/android/server/location/GpsLocationProvider;Landroid/content/Context;Ljava/util/Properties;)V

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v8}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v9}, Lcom/android/server/location/GpsLocationProvider;->-get7(Lcom/android/server/location/GpsLocationProvider;)Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/telephony/SubscriptionManager;->addOnSubscriptionsChangedListener(Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;)V

    invoke-static {}, Lcom/android/server/location/GpsLocationProvider;->-wrap1()Z

    move-result v8

    if-eqz v8, :cond_1

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v8, "android.intent.action.DATA_SMS_RECEIVED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "sms"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    const-string/jumbo v8, "localhost"

    const-string/jumbo v9, "7275"

    invoke-virtual {v1, v8, v9}, Landroid/content/IntentFilter;->addDataAuthority(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v8}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v9}, Lcom/android/server/location/GpsLocationProvider;->-get1(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/BroadcastReceiver;

    move-result-object v9

    invoke-virtual {v8, v9, v1, v11, p0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v8, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    :try_start_0
    const-string/jumbo v8, "application/vnd.omaloc-supl-init"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addDataType(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/IntentFilter$MalformedMimeTypeException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v8}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v9}, Lcom/android/server/location/GpsLocationProvider;->-get1(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/BroadcastReceiver;

    move-result-object v9

    invoke-virtual {v8, v9, v1, v11, p0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    :cond_0
    :goto_1
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v8, "com.android.internal.location.ALARM_WAKEUP"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "com.android.internal.location.ALARM_TIMEOUT"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.net.conn.CONNECTIVITY_CHANGE_SUPL"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.os.action.DEVICE_IDLE_MODE_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v8, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v1, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v8}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v9}, Lcom/android/server/location/GpsLocationProvider;->-get1(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/BroadcastReceiver;

    move-result-object v9

    invoke-virtual {v8, v9, v1, v11, p0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    iget-object v8, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v8}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v8

    const-string/jumbo v9, "location"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/LocationManager;

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const-string/jumbo v8, "passive"

    invoke-static {v8, v4, v5, v3, v6}, Landroid/location/LocationRequest;->createFromDeprecatedProvider(Ljava/lang/String;JFZ)Landroid/location/LocationRequest;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/location/LocationRequest;->setHideFromAppOps(Z)V

    new-instance v8, Lcom/android/server/location/GpsLocationProvider$NetworkLocationListener;

    iget-object v9, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-direct {v8, v9, v11}, Lcom/android/server/location/GpsLocationProvider$NetworkLocationListener;-><init>(Lcom/android/server/location/GpsLocationProvider;Lcom/android/server/location/GpsLocationProvider$NetworkLocationListener;)V

    invoke-virtual {p0}, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->getLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-virtual {v2, v7, v8, v9}, Landroid/location/LocationManager;->requestLocationUpdates(Landroid/location/LocationRequest;Landroid/location/LocationListener;Landroid/os/Looper;)V

    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v8, "GpsLocationProvider"

    const-string/jumbo v9, "Malformed SUPL init mime type"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_1
    invoke-static {}, Lcom/android/server/location/GpsLocationProvider;->-get0()Z

    move-result v8

    if-eqz v8, :cond_0

    const-string/jumbo v8, "GpsLocationProvider"

    const-string/jumbo v9, "Skipped registration for SMS/WAP-PUSH messages because AGPS Ril in GPS HAL is not supported"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    const/4 v3, 0x2

    const/4 v5, 0x1

    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    iget v2, p1, Landroid/os/Message;->arg2:I

    if-ne v2, v5, :cond_1

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get11(Lcom/android/server/location/GpsLocationProvider;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_1
    return-void

    :pswitch_1
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v5, :cond_2

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap16(Lcom/android/server/location/GpsLocationProvider;)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap14(Lcom/android/server/location/GpsLocationProvider;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/server/location/GpsLocationProvider$GpsRequest;

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget-object v3, v0, Lcom/android/server/location/GpsLocationProvider$GpsRequest;->request:Lcom/android/internal/location/ProviderRequest;

    iget-object v4, v0, Lcom/android/server/location/GpsLocationProvider$GpsRequest;->source:Landroid/os/WorkSource;

    invoke-static {v2, v3, v4}, Lcom/android/server/location/GpsLocationProvider;->-wrap18(Lcom/android/server/location/GpsLocationProvider;Lcom/android/internal/location/ProviderRequest;Landroid/os/WorkSource;)V

    goto :goto_0

    :pswitch_3
    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget v4, p1, Landroid/os/Message;->arg1:I

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    invoke-static {v3, v4, v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap20(Lcom/android/server/location/GpsLocationProvider;ILandroid/net/NetworkInfo;)V

    goto :goto_0

    :pswitch_4
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap17(Lcom/android/server/location/GpsLocationProvider;)V

    goto :goto_0

    :pswitch_5
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get10(Lcom/android/server/location/GpsLocationProvider;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap15(Lcom/android/server/location/GpsLocationProvider;)V

    goto :goto_0

    :pswitch_6
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2, v3}, Lcom/android/server/location/GpsLocationProvider;->-set1(Lcom/android/server/location/GpsLocationProvider;I)I

    goto :goto_0

    :pswitch_7
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2, v3}, Lcom/android/server/location/GpsLocationProvider;->-set0(Lcom/android/server/location/GpsLocationProvider;I)I

    goto :goto_0

    :pswitch_8
    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/location/Location;

    invoke-static {v3, v2}, Lcom/android/server/location/GpsLocationProvider;->-wrap19(Lcom/android/server/location/GpsLocationProvider;Landroid/location/Location;)V

    goto :goto_0

    :pswitch_9
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider;->-get2(Lcom/android/server/location/GpsLocationProvider;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/server/location/GpsLocationProvider;->-wrap28(Lcom/android/server/location/GpsLocationProvider;Landroid/content/Context;)V

    goto :goto_0

    :pswitch_a
    invoke-direct {p0}, Lcom/android/server/location/GpsLocationProvider$ProviderHandler;->initialize()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method
