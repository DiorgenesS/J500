.class Lcom/android/server/LockSettingsService$1;
.super Landroid/content/BroadcastReceiver;
.source "LockSettingsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/LockSettingsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/LockSettingsService;


# direct methods
.method constructor <init>(Lcom/android/server/LockSettingsService;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/LockSettingsService$1;->this$0:Lcom/android/server/LockSettingsService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8

    const/4 v7, 0x0

    const-string/jumbo v5, "android.intent.action.USER_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, "android.intent.extra.user_handle"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    iget-object v5, p0, Lcom/android/server/LockSettingsService$1;->this$0:Lcom/android/server/LockSettingsService;

    invoke-static {v5}, Lcom/android/server/LockSettingsService;->-get0(Lcom/android/server/LockSettingsService;)Landroid/content/Context;

    move-result-object v5

    const-string/jumbo v6, "user"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/UserManager;

    invoke-virtual {v3, v4}, Landroid/os/UserManager;->getProfileParent(I)Landroid/content/pm/UserInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    iget v1, v2, Landroid/content/pm/UserInfo;->id:I

    :goto_0
    invoke-virtual {v0, v4, v1}, Landroid/security/KeyStore;->onUserAdded(II)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v1, -0x1

    goto :goto_0

    :cond_2
    const-string/jumbo v5, "android.intent.action.USER_STARTING"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string/jumbo v5, "android.intent.extra.user_handle"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iget-object v5, p0, Lcom/android/server/LockSettingsService$1;->this$0:Lcom/android/server/LockSettingsService;

    invoke-static {v5}, Lcom/android/server/LockSettingsService;->-get3(Lcom/android/server/LockSettingsService;)Lcom/android/server/LockSettingsStorage;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/android/server/LockSettingsStorage;->prefetchUser(I)V

    goto :goto_1

    :cond_3
    const-string/jumbo v5, "android.intent.action.USER_PRESENT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/android/server/LockSettingsService$1;->this$0:Lcom/android/server/LockSettingsService;

    invoke-static {v5}, Lcom/android/server/LockSettingsService;->-get4(Lcom/android/server/LockSettingsService;)Lcom/android/server/LockSettingsStrongAuth;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/server/LockSettingsService$1;->getSendingUserId()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/server/LockSettingsStrongAuth;->reportUnlock(I)V

    goto :goto_1

    :cond_4
    const-string/jumbo v5, "android.intent.action.USER_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "android.intent.extra.user_handle"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-lez v4, :cond_0

    iget-object v5, p0, Lcom/android/server/LockSettingsService$1;->this$0:Lcom/android/server/LockSettingsService;

    invoke-static {v5, v4}, Lcom/android/server/LockSettingsService;->-wrap0(Lcom/android/server/LockSettingsService;I)V

    goto :goto_1
.end method
