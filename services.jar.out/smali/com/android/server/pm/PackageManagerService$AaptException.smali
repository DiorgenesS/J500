.class public Lcom/android/server/pm/PackageManagerService$AaptException;
.super Ljava/lang/Exception;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AaptException"
.end annotation


# instance fields
.field isCommon:Z

.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/server/pm/PackageManagerService$AaptException;-><init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$AaptException;->this$0:Lcom/android/server/pm/PackageManagerService;

    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-boolean p3, p0, Lcom/android/server/pm/PackageManagerService$AaptException;->isCommon:Z

    return-void
.end method
