.class Lcom/android/server/input/InputManagerService$6;
.super Ljava/lang/Object;
.source "InputManagerService.java"

# interfaces
.implements Lcom/android/server/input/InputManagerService$KeyboardLayoutVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/input/InputManagerService;->getKeyboardLayout(Ljava/lang/String;)Landroid/hardware/input/KeyboardLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/input/InputManagerService;

.field final synthetic val$result:[Landroid/hardware/input/KeyboardLayout;


# direct methods
.method constructor <init>(Lcom/android/server/input/InputManagerService;[Landroid/hardware/input/KeyboardLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/input/InputManagerService$6;->this$0:Lcom/android/server/input/InputManagerService;

    iput-object p2, p0, Lcom/android/server/input/InputManagerService$6;->val$result:[Landroid/hardware/input/KeyboardLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visitKeyboardLayout(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 3

    iget-object v0, p0, Lcom/android/server/input/InputManagerService$6;->val$result:[Landroid/hardware/input/KeyboardLayout;

    new-instance v1, Landroid/hardware/input/KeyboardLayout;

    invoke-direct {v1, p2, p3, p4, p6}, Landroid/hardware/input/KeyboardLayout;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    return-void
.end method
