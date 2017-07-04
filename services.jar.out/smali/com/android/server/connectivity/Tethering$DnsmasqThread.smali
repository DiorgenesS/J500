.class Lcom/android/server/connectivity/Tethering$DnsmasqThread;
.super Ljava/lang/Thread;
.source "Tethering.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/connectivity/Tethering;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DnsmasqThread"
.end annotation


# instance fields
.field private mDevice:Landroid/net/wifi/WifiDevice;

.field private mInterval:I

.field private mMaxTimes:I

.field private final mTethering:Lcom/android/server/connectivity/Tethering;


# direct methods
.method public constructor <init>(Lcom/android/server/connectivity/Tethering;Landroid/net/wifi/WifiDevice;II)V
    .locals 1

    const-string/jumbo v0, "Tethering"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mTethering:Lcom/android/server/connectivity/Tethering;

    iput p3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mInterval:I

    iput p4, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mMaxTimes:I

    iput-object p2, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    iget v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mMaxTimes:I

    if-lez v3, :cond_0

    iget-object v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mTethering:Lcom/android/server/connectivity/Tethering;

    iget-object v4, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    invoke-static {v3, v4}, Lcom/android/server/connectivity/Tethering;->-wrap3(Lcom/android/server/connectivity/Tethering;Landroid/net/wifi/WifiDevice;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v3, "Tethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Successfully poll device info for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v5, v5, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    if-nez v2, :cond_1

    const-string/jumbo v3, "Tethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Pulling timeout, suppose STA uses static ip "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v5, v5, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mTethering:Lcom/android/server/connectivity/Tethering;

    invoke-static {v3}, Lcom/android/server/connectivity/Tethering;->-get5(Lcom/android/server/connectivity/Tethering;)Ljava/util/HashMap;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v4, v4, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiDevice;

    if-eqz v1, :cond_3

    iget v3, v1, Landroid/net/wifi/WifiDevice;->deviceState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mTethering:Lcom/android/server/connectivity/Tethering;

    invoke-static {v3}, Lcom/android/server/connectivity/Tethering;->-get0(Lcom/android/server/connectivity/Tethering;)Ljava/util/HashMap;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v4, v4, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mTethering:Lcom/android/server/connectivity/Tethering;

    invoke-static {v3}, Lcom/android/server/connectivity/Tethering;->-wrap4(Lcom/android/server/connectivity/Tethering;)V

    :goto_2
    return-void

    :cond_2
    :try_start_1
    iget v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mMaxTimes:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mMaxTimes:I

    iget v3, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mInterval:I

    int-to-long v4, v3

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    const/4 v2, 0x0

    const-string/jumbo v3, "Tethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Pulling "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v5, v5, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "error"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_3
    const-string/jumbo v3, "Tethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Device "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/connectivity/Tethering$DnsmasqThread;->mDevice:Landroid/net/wifi/WifiDevice;

    iget-object v5, v5, Landroid/net/wifi/WifiDevice;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "already disconnected, ignoring"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method
