.class Lcom/android/server/location/GeoFencerProxy$1;
.super Ljava/lang/Object;
.source "GeoFencerProxy.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/GeoFencerProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/location/GeoFencerProxy;


# direct methods
.method constructor <init>(Lcom/android/server/location/GeoFencerProxy;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/location/GeoFencerProxy$1;->this$0:Lcom/android/server/location/GeoFencerProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy$1;->this$0:Lcom/android/server/location/GeoFencerProxy;

    invoke-static {p2}, Landroid/location/IGeoFencer$Stub;->asInterface(Landroid/os/IBinder;)Landroid/location/IGeoFencer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/server/location/GeoFencerProxy;->-set0(Lcom/android/server/location/GeoFencerProxy;Landroid/location/IGeoFencer;)Landroid/location/IGeoFencer;

    invoke-virtual {p0}, Lcom/android/server/location/GeoFencerProxy$1;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const-string/jumbo v0, "GeoFencerProxy"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onServiceConnected: mGeoFencer - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/location/GeoFencerProxy$1;->this$0:Lcom/android/server/location/GeoFencerProxy;

    invoke-static {v2}, Lcom/android/server/location/GeoFencerProxy;->-get0(Lcom/android/server/location/GeoFencerProxy;)Landroid/location/IGeoFencer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/server/location/GeoFencerProxy$1;->this$0:Lcom/android/server/location/GeoFencerProxy;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/server/location/GeoFencerProxy;->-set0(Lcom/android/server/location/GeoFencerProxy;Landroid/location/IGeoFencer;)Landroid/location/IGeoFencer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const-string/jumbo v0, "GeoFencerProxy"

    const-string/jumbo v1, "onServiceDisconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
