.class final Lcom/android/server/MountService$MountServiceInternalImpl;
.super Landroid/os/storage/MountServiceInternal;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MountServiceInternalImpl"
.end annotation


# instance fields
.field private final mPolicies:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method private constructor <init>(Lcom/android/server/MountService;)V
    .locals 1

    iput-object p1, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->this$0:Lcom/android/server/MountService;

    invoke-direct {p0}, Landroid/os/storage/MountServiceInternal;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->mPolicies:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/MountService;Lcom/android/server/MountService$MountServiceInternalImpl;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/server/MountService$MountServiceInternalImpl;-><init>(Lcom/android/server/MountService;)V

    return-void
.end method


# virtual methods
.method public addExternalStoragePolicy(Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->mPolicies:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getExternalStorageMountMode(ILjava/lang/String;)I
    .locals 6

    const/4 v5, 0x0

    const v0, 0x7fffffff

    iget-object v4, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->mPolicies:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;

    invoke-interface {v1, p1, p2}, Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;->getMountMode(ILjava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    return v5

    :cond_0
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    :cond_1
    const v4, 0x7fffffff

    if-ne v0, v4, :cond_2

    return v5

    :cond_2
    return v0
.end method

.method public hasExternalStorage(ILjava/lang/String;)Z
    .locals 5

    const/4 v4, 0x1

    const/16 v3, 0x3e8

    if-ne p1, v3, :cond_0

    return v4

    :cond_0
    iget-object v3, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->mPolicies:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;

    invoke-interface {v0, p1, p2}, Landroid/os/storage/MountServiceInternal$ExternalStorageMountPolicy;->hasExternalStorage(ILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v3, 0x0

    return v3

    :cond_2
    return v4
.end method

.method public onExternalStoragePolicyChanged(ILjava/lang/String;)V
    .locals 2

    invoke-virtual {p0, p1, p2}, Lcom/android/server/MountService$MountServiceInternalImpl;->getExternalStorageMountMode(ILjava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/android/server/MountService$MountServiceInternalImpl;->this$0:Lcom/android/server/MountService;

    invoke-static {v1, p1, v0}, Lcom/android/server/MountService;->-wrap9(Lcom/android/server/MountService;II)V

    return-void
.end method
