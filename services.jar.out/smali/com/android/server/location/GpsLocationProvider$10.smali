.class Lcom/android/server/location/GpsLocationProvider$10;
.super Ljava/lang/Object;
.source "GpsLocationProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/location/GpsLocationProvider;->handleDownloadXtraData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/location/GpsLocationProvider;


# direct methods
.method constructor <init>(Lcom/android/server/location/GpsLocationProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v5, 0x0

    new-instance v1, Lcom/android/server/location/GpsXtraDownloader;

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get9(Lcom/android/server/location/GpsLocationProvider;)Ljava/util/Properties;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/server/location/GpsXtraDownloader;-><init>(Ljava/util/Properties;)V

    invoke-virtual {v1}, Lcom/android/server/location/GpsXtraDownloader;->downloadXtraData()[B

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/server/location/GpsLocationProvider;->-get0()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "GpsLocationProvider"

    const-string/jumbo v3, "calling native_inject_xtra_data"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    array-length v3, v0

    invoke-static {v2, v0, v3}, Lcom/android/server/location/GpsLocationProvider;->-wrap23(Lcom/android/server/location/GpsLocationProvider;[BI)V

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get12(Lcom/android/server/location/GpsLocationProvider;)Lcom/android/server/location/GpsLocationProvider$BackOff;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/location/GpsLocationProvider$BackOff;->reset()V

    :cond_1
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    const/16 v3, 0xb

    const/4 v4, 0x0

    invoke-static {v2, v3, v4, v5}, Lcom/android/server/location/GpsLocationProvider;->-wrap26(Lcom/android/server/location/GpsLocationProvider;IILjava/lang/Object;)V

    if-nez v0, :cond_2

    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get3(Lcom/android/server/location/GpsLocationProvider;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v3}, Lcom/android/server/location/GpsLocationProvider;->-get12(Lcom/android/server/location/GpsLocationProvider;)Lcom/android/server/location/GpsLocationProvider$BackOff;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/location/GpsLocationProvider$BackOff;->nextBackoffMillis()J

    move-result-wide v4

    const/4 v3, 0x6

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_2
    iget-object v2, p0, Lcom/android/server/location/GpsLocationProvider$10;->this$0:Lcom/android/server/location/GpsLocationProvider;

    invoke-static {v2}, Lcom/android/server/location/GpsLocationProvider;->-get11(Lcom/android/server/location/GpsLocationProvider;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    return-void
.end method
