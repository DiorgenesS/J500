.class public Lcom/android/server/PermissionDialog;
.super Lcom/android/server/BasePermissionDialog;
.source "PermissionDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/PermissionDialog$1;
    }
.end annotation


# static fields
.field static final ACTION_ALLOWED:I = 0x2

.field static final ACTION_IGNORED:I = 0x4

.field static final ACTION_IGNORED_TIMEOUT:I = 0x8

.field static final DISMISS_TIMEOUT:J = 0x3a98L

.field private static final TAG:Ljava/lang/String; = "PermissionDialog"


# instance fields
.field private mChoice:Landroid/widget/CheckBox;

.field private final mCode:I

.field private mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field final mOpLabels:[Ljava/lang/CharSequence;

.field private final mPackageName:Ljava/lang/String;

.field private final mService:Lcom/android/server/AppOpsService;

.field private mUid:I

.field private mView:Landroid/view/View;


# direct methods
.method static synthetic -get0(Lcom/android/server/PermissionDialog;)Landroid/widget/CheckBox;
    .locals 1

    iget-object v0, p0, Lcom/android/server/PermissionDialog;->mChoice:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/PermissionDialog;)I
    .locals 1

    iget v0, p0, Lcom/android/server/PermissionDialog;->mCode:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/server/PermissionDialog;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/server/PermissionDialog;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/server/PermissionDialog;)Lcom/android/server/AppOpsService;
    .locals 1

    iget-object v0, p0, Lcom/android/server/PermissionDialog;->mService:Lcom/android/server/AppOpsService;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/server/PermissionDialog;)I
    .locals 1

    iget v0, p0, Lcom/android/server/PermissionDialog;->mUid:I

    return v0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/AppOpsService;IILjava/lang/String;)V
    .locals 10

    const/4 v9, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x0

    invoke-direct {p0, p1}, Lcom/android/server/BasePermissionDialog;-><init>(Landroid/content/Context;)V

    new-instance v4, Lcom/android/server/PermissionDialog$1;

    invoke-direct {v4, p0}, Lcom/android/server/PermissionDialog$1;-><init>(Lcom/android/server/PermissionDialog;)V

    iput-object v4, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/server/PermissionDialog;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iput-object p2, p0, Lcom/android/server/PermissionDialog;->mService:Lcom/android/server/AppOpsService;

    iput p3, p0, Lcom/android/server/PermissionDialog;->mCode:I

    iput-object p5, p0, Lcom/android/server/PermissionDialog;->mPackageName:Ljava/lang/String;

    iput p4, p0, Lcom/android/server/PermissionDialog;->mUid:I

    const v4, 0x107000f

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, p0, Lcom/android/server/PermissionDialog;->mOpLabels:[Ljava/lang/CharSequence;

    invoke-virtual {p0, v7}, Lcom/android/server/PermissionDialog;->setCancelable(Z)V

    const v4, 0x10404aa

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    const/4 v6, -0x1

    invoke-virtual {p0, v6, v4, v5}, Lcom/android/server/PermissionDialog;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    const v4, 0x10404ab

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    const/4 v6, -0x2

    invoke-virtual {p0, v6, v4, v5}, Lcom/android/server/PermissionDialog;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    const v4, 0x1040042

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/server/PermissionDialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/android/server/PermissionDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Permission info: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/PermissionDialog;->mPackageName:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/android/server/PermissionDialog;->getAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    iget v4, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    or-int/lit16 v4, v4, 0x110

    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    invoke-virtual {p0}, Lcom/android/server/PermissionDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {p0}, Lcom/android/server/PermissionDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x1090098

    invoke-virtual {v4, v5, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/android/server/PermissionDialog;->mView:Landroid/view/View;

    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mView:Landroid/view/View;

    const v5, 0x102038f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mView:Landroid/view/View;

    const v5, 0x1020391

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    iput-object v4, p0, Lcom/android/server/PermissionDialog;->mChoice:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mPackageName:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/server/PermissionDialog;->getAppName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/server/PermissionDialog;->mPackageName:Ljava/lang/String;

    :cond_0
    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mContext:Landroid/content/Context;

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v1, v5, v7

    iget-object v6, p0, Lcom/android/server/PermissionDialog;->mOpLabels:[Ljava/lang/CharSequence;

    iget v7, p0, Lcom/android/server/PermissionDialog;->mCode:I

    aget-object v6, v6, v7

    const/4 v7, 0x1

    aput-object v6, v5, v7

    const v6, 0x1040043

    invoke-virtual {v4, v6, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mView:Landroid/view/View;

    invoke-virtual {p0, v4}, Lcom/android/server/PermissionDialog;->setView(Landroid/view/View;)V

    iget-object v4, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    const-wide/16 v6, 0x3a98

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method private getAppName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/4 v4, 0x0

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/android/server/PermissionDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/16 v3, 0x2200

    :try_start_0
    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    return-object v3

    :catch_0
    move-exception v1

    return-object v4

    :cond_0
    return-object v4
.end method


# virtual methods
.method public ignore()V
    .locals 3

    iget-object v0, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/PermissionDialog;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
