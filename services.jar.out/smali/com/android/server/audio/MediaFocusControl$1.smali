.class Lcom/android/server/audio/MediaFocusControl$1;
.super Landroid/telephony/PhoneStateListener;
.source "MediaFocusControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/audio/MediaFocusControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/audio/MediaFocusControl;


# direct methods
.method constructor <init>(Lcom/android/server/audio/MediaFocusControl;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/audio/MediaFocusControl$1;->this$0:Lcom/android/server/audio/MediaFocusControl;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 3

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    invoke-static {}, Lcom/android/server/audio/MediaFocusControl;->-get8()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/audio/MediaFocusControl$1;->this$0:Lcom/android/server/audio/MediaFocusControl;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/android/server/audio/MediaFocusControl;->-set0(Lcom/android/server/audio/MediaFocusControl;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    if-nez p1, :cond_0

    :cond_2
    invoke-static {}, Lcom/android/server/audio/MediaFocusControl;->-get8()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/android/server/audio/MediaFocusControl$1;->this$0:Lcom/android/server/audio/MediaFocusControl;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/android/server/audio/MediaFocusControl;->-set0(Lcom/android/server/audio/MediaFocusControl;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method
