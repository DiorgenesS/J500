.class Lcom/android/server/audio/AudioService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/audio/AudioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/audio/AudioService;


# direct methods
.method constructor <init>(Lcom/android/server/audio/AudioService;)V
    .locals 3

    const/4 v2, 0x0

    iput-object p1, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    invoke-static {p1}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "mode_ringer_streams_affected"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-static {p1}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "dock_audio_media_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-static {p1}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "volume_link_notification"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-static {p1}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "volume_keys_control_ring_stream"

    invoke-static {v1}, Lcyanogenmod/providers/CMSettings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 9

    const/4 v2, 0x0

    const/4 v1, 0x1

    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    iget-object v3, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v3}, Lcom/android/server/audio/AudioService;->-get34(Lcom/android/server/audio/AudioService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    :try_start_0
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v4}, Lcom/android/server/audio/AudioService;->-wrap2(Lcom/android/server/audio/AudioService;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    iget-object v5, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-virtual {v5}, Lcom/android/server/audio/AudioService;->getRingerModeInternal()I

    move-result v5

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lcom/android/server/audio/AudioService;->-wrap39(Lcom/android/server/audio/AudioService;IZ)V

    :cond_0
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    iget-object v5, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v5}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/server/audio/AudioService;->-wrap33(Lcom/android/server/audio/AudioService;Landroid/content/ContentResolver;)V

    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v4}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v4

    const-string/jumbo v5, "volume_link_notification"

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v1, :cond_2

    const/4 v0, 0x1

    :goto_0
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v4}, Lcom/android/server/audio/AudioService;->-get26(Lcom/android/server/audio/AudioService;)Z

    move-result v4

    if-eq v0, v4, :cond_1

    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v4, v0}, Lcom/android/server/audio/AudioService;->-set8(Lcom/android/server/audio/AudioService;Z)Z

    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v4}, Lcom/android/server/audio/AudioService;->-wrap13(Lcom/android/server/audio/AudioService;)V

    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    const-string/jumbo v5, "AudioService"

    const/4 v6, 0x1

    invoke-static {v4, v6, v5}, Lcom/android/server/audio/AudioService;->-wrap41(Lcom/android/server/audio/AudioService;ZLjava/lang/String;)V

    :cond_1
    iget-object v4, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    iget-object v5, p0, Lcom/android/server/audio/AudioService$SettingsObserver;->this$0:Lcom/android/server/audio/AudioService;

    invoke-static {v5}, Lcom/android/server/audio/AudioService;->-get16(Lcom/android/server/audio/AudioService;)Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "volume_keys_control_ring_stream"

    const/4 v7, 0x1

    const/4 v8, -0x2

    invoke-static {v5, v6, v7, v8}, Lcyanogenmod/providers/CMSettings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v5

    if-ne v5, v1, :cond_3

    :goto_1
    invoke-static {v4, v1}, Lcom/android/server/audio/AudioService;->-set17(Lcom/android/server/audio/AudioService;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    move v1, v2

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v3

    throw v1
.end method
