.class Lcom/android/server/audio/MediaFocusControl$NotificationListenerObserver;
.super Landroid/database/ContentObserver;
.source "MediaFocusControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/audio/MediaFocusControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotificationListenerObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/audio/MediaFocusControl;


# direct methods
.method constructor <init>(Lcom/android/server/audio/MediaFocusControl;)V
    .locals 3

    iput-object p1, p0, Lcom/android/server/audio/MediaFocusControl$NotificationListenerObserver;->this$0:Lcom/android/server/audio/MediaFocusControl;

    invoke-static {p1}, Lcom/android/server/audio/MediaFocusControl;->-get3(Lcom/android/server/audio/MediaFocusControl;)Lcom/android/server/audio/MediaFocusControl$MediaEventHandler;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    invoke-static {p1}, Lcom/android/server/audio/MediaFocusControl;->-get2(Lcom/android/server/audio/MediaFocusControl;)Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "enabled_notification_listeners"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1

    invoke-static {}, Lcom/android/server/audio/MediaFocusControl;->-get0()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/server/audio/MediaFocusControl$NotificationListenerObserver;->this$0:Lcom/android/server/audio/MediaFocusControl;

    invoke-static {v0}, Lcom/android/server/audio/MediaFocusControl;->-wrap9(Lcom/android/server/audio/MediaFocusControl;)V

    return-void
.end method
