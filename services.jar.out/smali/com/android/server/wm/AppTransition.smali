.class public Lcom/android/server/wm/AppTransition;
.super Ljava/lang/Object;
.source "AppTransition.java"

# interfaces
.implements Lcom/android/internal/util/DumpUtils$Dump;


# static fields
.field private static final APP_STATE_IDLE:I = 0x0

.field private static final APP_STATE_READY:I = 0x1

.field private static final APP_STATE_RUNNING:I = 0x2

.field private static final APP_STATE_TIMEOUT:I = 0x3

.field private static final CLIP_REVEAL_TRANSLATION_Y_DP:I = 0x8

.field private static final DEBUG_ANIM:Z = false

.field private static final DEBUG_APP_TRANSITIONS:Z = false

.field private static final DEFAULT_APP_TRANSITION_DURATION:I = 0x150

.field private static final NEXT_TRANSIT_TYPE_CLIP_REVEAL:I = 0x8

.field private static final NEXT_TRANSIT_TYPE_CUSTOM:I = 0x1

.field private static final NEXT_TRANSIT_TYPE_CUSTOM_IN_PLACE:I = 0x7

.field private static final NEXT_TRANSIT_TYPE_NONE:I = 0x0

.field private static final NEXT_TRANSIT_TYPE_SCALE_UP:I = 0x2

.field private static final NEXT_TRANSIT_TYPE_THUMBNAIL_ASPECT_SCALE_DOWN:I = 0x6

.field private static final NEXT_TRANSIT_TYPE_THUMBNAIL_ASPECT_SCALE_UP:I = 0x5

.field private static final NEXT_TRANSIT_TYPE_THUMBNAIL_SCALE_DOWN:I = 0x4

.field private static final NEXT_TRANSIT_TYPE_THUMBNAIL_SCALE_UP:I = 0x3

.field private static final RECENTS_THUMBNAIL_FADEIN_FRACTION:F = 0.5f

.field private static final RECENTS_THUMBNAIL_FADEOUT_FRACTION:F = 0.5f

.field private static final TAG:Ljava/lang/String; = "AppTransition"

.field private static final THUMBNAIL_APP_TRANSITION_ALPHA_DURATION:I = 0x150

.field private static final THUMBNAIL_APP_TRANSITION_DURATION:I = 0x150

.field private static final THUMBNAIL_TRANSITION_ENTER_SCALE_DOWN:I = 0x2

.field private static final THUMBNAIL_TRANSITION_ENTER_SCALE_UP:I = 0x0

.field private static final THUMBNAIL_TRANSITION_EXIT_SCALE_DOWN:I = 0x3

.field private static final THUMBNAIL_TRANSITION_EXIT_SCALE_UP:I = 0x1

.field public static final TRANSIT_ACTIVITY_CLOSE:I = 0x7

.field public static final TRANSIT_ACTIVITY_OPEN:I = 0x6

.field public static final TRANSIT_NONE:I = 0x0

.field public static final TRANSIT_TASK_CLOSE:I = 0x9

.field public static final TRANSIT_TASK_IN_PLACE:I = 0x11

.field public static final TRANSIT_TASK_OPEN:I = 0x8

.field public static final TRANSIT_TASK_OPEN_BEHIND:I = 0x10

.field public static final TRANSIT_TASK_TO_BACK:I = 0xb

.field public static final TRANSIT_TASK_TO_FRONT:I = 0xa

.field public static final TRANSIT_UNSET:I = -0x1

.field public static final TRANSIT_WALLPAPER_CLOSE:I = 0xc

.field public static final TRANSIT_WALLPAPER_INTRA_CLOSE:I = 0xf

.field public static final TRANSIT_WALLPAPER_INTRA_OPEN:I = 0xe

.field public static final TRANSIT_WALLPAPER_OPEN:I = 0xd


# instance fields
.field private mAppTransitionState:I

.field private final mClipHorizontalInterpolator:Landroid/view/animation/Interpolator;

.field private final mClipRevealTranslationY:I

.field private final mConfigShortAnimTime:I

.field private final mContext:Landroid/content/Context;

.field private mCurrentUserId:I

.field private final mDecelerateInterpolator:Landroid/view/animation/Interpolator;

.field private final mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

.field private final mH:Landroid/os/Handler;

.field private final mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

.field private final mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/WindowManagerInternal$AppTransitionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mNextAppTransition:I

.field private mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

.field private mNextAppTransitionEnter:I

.field private mNextAppTransitionExit:I

.field private mNextAppTransitionInPlace:I

.field private mNextAppTransitionInsets:Landroid/graphics/Rect;

.field private mNextAppTransitionPackage:Ljava/lang/String;

.field private mNextAppTransitionScaleUp:Z

.field private mNextAppTransitionStartHeight:I

.field private mNextAppTransitionStartWidth:I

.field private mNextAppTransitionStartX:I

.field private mNextAppTransitionStartY:I

.field private mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

.field private mNextAppTransitionType:I

.field private final mThumbnailFadeInInterpolator:Landroid/view/animation/Interpolator;

.field private final mThumbnailFadeOutInterpolator:Landroid/view/animation/Interpolator;

.field private mTmpFromClipRect:Landroid/graphics/Rect;

.field private mTmpToClipRect:Landroid/graphics/Rect;

.field private final mTouchResponseInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method static synthetic -get0(Lcom/android/server/wm/AppTransition;)Landroid/view/animation/Interpolator;
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/wm/AppTransition;)Landroid/view/animation/Interpolator;
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 6

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    iput v4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInsets:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    iput v4, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3ecccccd    # 0.4f

    invoke-direct {v0, v3, v3, v1, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mClipHorizontalInterpolator:Landroid/view/animation/Interpolator;

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3e99999a    # 0.3f

    const v2, 0x3dcccccd    # 0.1f

    invoke-direct {v0, v1, v3, v2, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    iput v4, p0, Lcom/android/server/wm/AppTransition;->mCurrentUserId:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/android/server/wm/AppTransition;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/wm/AppTransition;->mH:Landroid/os/Handler;

    const v0, 0x10c000e

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    const v0, 0x10c000f

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mConfigShortAnimTime:I

    const v0, 0x10c0003

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    new-instance v0, Lcom/android/server/wm/AppTransition$1;

    invoke-direct {v0, p0}, Lcom/android/server/wm/AppTransition$1;-><init>(Lcom/android/server/wm/AppTransition;)V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeInInterpolator:Landroid/view/animation/Interpolator;

    new-instance v0, Lcom/android/server/wm/AppTransition$2;

    invoke-direct {v0, p0}, Lcom/android/server/wm/AppTransition$2;-><init>(Lcom/android/server/wm/AppTransition;)V

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeOutInterpolator:Landroid/view/animation/Interpolator;

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41000000    # 8.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mClipRevealTranslationY:I

    return-void
.end method

.method private appStateToString()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "unknown state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_0
    const-string/jumbo v0, "APP_STATE_IDLE"

    return-object v0

    :pswitch_1
    const-string/jumbo v0, "APP_STATE_READY"

    return-object v0

    :pswitch_2
    const-string/jumbo v0, "APP_STATE_RUNNING"

    return-object v0

    :pswitch_3
    const-string/jumbo v0, "APP_STATE_TIMEOUT"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static appTransitionToString(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const-string/jumbo v0, "<UNKNOWN>"

    return-object v0

    :pswitch_1
    const-string/jumbo v0, "TRANSIT_UNSET"

    return-object v0

    :pswitch_2
    const-string/jumbo v0, "TRANSIT_NONE"

    return-object v0

    :pswitch_3
    const-string/jumbo v0, "TRANSIT_ACTIVITY_OPEN"

    return-object v0

    :pswitch_4
    const-string/jumbo v0, "TRANSIT_ACTIVITY_CLOSE"

    return-object v0

    :pswitch_5
    const-string/jumbo v0, "TRANSIT_TASK_OPEN"

    return-object v0

    :pswitch_6
    const-string/jumbo v0, "TRANSIT_TASK_CLOSE"

    return-object v0

    :pswitch_7
    const-string/jumbo v0, "TRANSIT_TASK_TO_FRONT"

    return-object v0

    :pswitch_8
    const-string/jumbo v0, "TRANSIT_TASK_TO_BACK"

    return-object v0

    :pswitch_9
    const-string/jumbo v0, "TRANSIT_WALLPAPER_CLOSE"

    return-object v0

    :pswitch_a
    const-string/jumbo v0, "TRANSIT_WALLPAPER_OPEN"

    return-object v0

    :pswitch_b
    const-string/jumbo v0, "TRANSIT_WALLPAPER_INTRA_OPEN"

    return-object v0

    :pswitch_c
    const-string/jumbo v0, "TRANSIT_WALLPAPER_INTRA_CLOSE"

    return-object v0

    :pswitch_d
    const-string/jumbo v0, "TRANSIT_TASK_OPEN_BEHIND"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method private static computePivot(IF)F
    .locals 3

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, p1, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x38d1b717    # 1.0E-4f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    int-to-float v1, p0

    return v1

    :cond_0
    neg-int v1, p0

    int-to-float v1, v1

    div-float/2addr v1, v0

    return v1
.end method

.method private createClipRevealAnimationLocked(IZLandroid/graphics/Rect;)Landroid/view/animation/Animation;
    .locals 25

    if-eqz p2, :cond_1

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->width()I

    move-result v10

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->height()I

    move-result v9

    const/16 v18, 0x0

    if-lez v9, :cond_0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    int-to-float v0, v9

    move/from16 v22, v0

    div-float v18, v21, v22

    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mClipRevealTranslationY:I

    move/from16 v21, v0

    int-to-float v0, v9

    move/from16 v22, v0

    const/high16 v23, 0x40e00000    # 7.0f

    div-float v22, v22, v23

    mul-float v22, v22, v18

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    add-int v20, v21, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    add-int v11, v21, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    add-int v12, v21, v22

    new-instance v13, Landroid/view/animation/ClipRectLRAnimation;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    move/from16 v21, v0

    div-int/lit8 v21, v21, 0x2

    sub-int v21, v11, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    add-int v22, v22, v11

    const/16 v23, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v13, v0, v1, v2, v10}, Landroid/view/animation/ClipRectLRAnimation;-><init>(IIII)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/AppTransition;->mClipHorizontalInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v22, 0x86

    move-wide/from16 v0, v22

    invoke-virtual {v13, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v14, Landroid/view/animation/ClipRectTBAnimation;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    move/from16 v21, v0

    div-int/lit8 v21, v21, 0x2

    sub-int v21, v12, v21

    sub-int v21, v21, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    move/from16 v22, v0

    div-int/lit8 v22, v22, 0x2

    add-int v22, v22, v12

    sub-int v22, v22, v20

    const/16 v23, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v14, v0, v1, v2, v9}, Landroid/view/animation/ClipRectTBAnimation;-><init>(IIII)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v22, 0x150

    move-wide/from16 v0, v22

    invoke-virtual {v14, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v19, Landroid/view/animation/TranslateYAnimation;

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v23

    move/from16 v2, v21

    move/from16 v3, v24

    move/from16 v4, v22

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/TranslateYAnimation;-><init>(IFIF)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/AppTransition;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateYAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v22, 0x150

    move-object/from16 v0, v19

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateYAnimation;->setDuration(J)V

    const/16 v7, 0x54

    new-instance v6, Landroid/view/animation/AlphaAnimation;

    const/high16 v21, 0x3f800000    # 1.0f

    const/high16 v22, 0x3f000000    # 0.5f

    move/from16 v0, v22

    move/from16 v1, v21

    invoke-direct {v6, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v22, 0x54

    move-wide/from16 v0, v22

    invoke-virtual {v6, v0, v1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/AppTransition;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v15, Landroid/view/animation/AnimationSet;

    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-direct {v15, v0}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v15, v13}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v15, v14}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v15, v6}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Landroid/view/animation/AnimationSet;->setZAdjustment(I)V

    invoke-virtual {v15, v10, v9, v10, v9}, Landroid/view/animation/AnimationSet;->initialize(IIII)V

    move-object v8, v15

    :goto_0
    return-object v8

    :cond_1
    packed-switch p1, :pswitch_data_0

    const-wide/16 v16, 0x150

    :goto_1
    const/16 v21, 0xe

    move/from16 v0, p1

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    const/16 v21, 0xf

    move/from16 v0, p1

    move/from16 v1, v21

    if-ne v0, v1, :cond_3

    :cond_2
    new-instance v8, Landroid/view/animation/AlphaAnimation;

    const/high16 v21, 0x3f800000    # 1.0f

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v8, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v8, v0}, Landroid/view/animation/Animation;->setDetachWallpaper(Z)V

    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    move-wide/from16 v0, v16

    invoke-virtual {v8, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v8, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    goto :goto_0

    :pswitch_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mConfigShortAnimTime:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v16, v0

    goto :goto_1

    :cond_3
    new-instance v8, Landroid/view/animation/AlphaAnimation;

    const/high16 v21, 0x3f800000    # 1.0f

    const/high16 v22, 0x3f800000    # 1.0f

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v8, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private createScaleUpAnimationLocked(IZII)Landroid/view/animation/Animation;
    .locals 16

    const/4 v11, 0x0

    if-eqz p2, :cond_0

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    int-to-float v6, v6

    move/from16 v0, p3

    int-to-float v8, v0

    div-float v5, v6, v8

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    int-to-float v6, v6

    move/from16 v0, p4

    int-to-float v8, v0

    div-float v7, v6, v8

    new-instance v4, Landroid/view/animation/ScaleAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-static {v9, v5}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v9

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-static {v10, v7}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v10

    invoke-direct/range {v4 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v4, v6}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v12, Landroid/view/animation/AlphaAnimation;

    const/4 v6, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v12, v6, v8}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v12, v6}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v13, Landroid/view/animation/AnimationSet;

    const/4 v6, 0x0

    invoke-direct {v13, v6}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v13, v4}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v13, v12}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    const/4 v6, 0x1

    invoke-virtual {v13, v6}, Landroid/view/animation/AnimationSet;->setDetachWallpaper(Z)V

    move-object v11, v13

    :goto_0
    packed-switch p1, :pswitch_data_0

    const-wide/16 v14, 0x150

    :goto_1
    invoke-virtual {v11, v14, v15}, Landroid/view/animation/Animation;->setDuration(J)V

    const/4 v6, 0x1

    invoke-virtual {v11, v6}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, v6}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    move/from16 v0, p3

    move/from16 v1, p4

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v11, v0, v1, v2, v3}, Landroid/view/animation/Animation;->initialize(IIII)V

    return-object v11

    :cond_0
    const/16 v6, 0xe

    move/from16 v0, p1

    if-eq v0, v6, :cond_1

    const/16 v6, 0xf

    move/from16 v0, p1

    if-ne v0, v6, :cond_2

    :cond_1
    new-instance v11, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    invoke-direct {v11, v6, v8}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const/4 v6, 0x1

    invoke-virtual {v11, v6}, Landroid/view/animation/Animation;->setDetachWallpaper(Z)V

    goto :goto_0

    :cond_2
    new-instance v11, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v11, v6, v8}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_0

    :pswitch_0
    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mConfigShortAnimTime:I

    int-to-long v14, v6

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private getCachedAnimations(Landroid/view/WindowManager$LayoutParams;)Lcom/android/server/AttributeCache$Entry;
    .locals 5

    const/4 v3, 0x0

    if-eqz p1, :cond_2

    iget v2, p1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    if-eqz v2, :cond_2

    iget-object v2, p1, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v0, p1, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    :goto_0
    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    const/high16 v2, -0x1000000

    and-int/2addr v2, v1

    const/high16 v3, 0x1000000

    if-ne v2, v3, :cond_0

    const-string/jumbo v0, "android"

    :cond_0
    invoke-static {}, Lcom/android/server/AttributeCache;->instance()Lcom/android/server/AttributeCache;

    move-result-object v2

    sget-object v3, Lcom/android/internal/R$styleable;->WindowAnimation:[I

    iget v4, p0, Lcom/android/server/wm/AppTransition;->mCurrentUserId:I

    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/android/server/AttributeCache;->get(Ljava/lang/String;I[II)Lcom/android/server/AttributeCache$Entry;

    move-result-object v2

    return-object v2

    :cond_1
    const-string/jumbo v0, "android"

    goto :goto_0

    :cond_2
    return-object v3
.end method

.method private getCachedAnimations(Ljava/lang/String;I)Lcom/android/server/AttributeCache$Entry;
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const/high16 v0, -0x1000000

    and-int/2addr v0, p2

    const/high16 v1, 0x1000000

    if-ne v0, v1, :cond_0

    const-string/jumbo p1, "android"

    :cond_0
    invoke-static {}, Lcom/android/server/AttributeCache;->instance()Lcom/android/server/AttributeCache;

    move-result-object v0

    sget-object v1, Lcom/android/internal/R$styleable;->WindowAnimation:[I

    iget v2, p0, Lcom/android/server/wm/AppTransition;->mCurrentUserId:I

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/android/server/AttributeCache;->get(Ljava/lang/String;I[II)Lcom/android/server/AttributeCache$Entry;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v0
.end method

.method private loadAnimationRes(Ljava/lang/String;I)Landroid/view/animation/Animation;
    .locals 4

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mContext:Landroid/content/Context;

    if-ltz p2, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/android/server/wm/AppTransition;->getCachedAnimations(Ljava/lang/String;I)Lcom/android/server/AttributeCache$Entry;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v1, v2, Lcom/android/server/AttributeCache$Entry;->context:Landroid/content/Context;

    move v0, p2

    :cond_0
    if-eqz v0, :cond_1

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    return-object v3

    :cond_1
    return-object v3
.end method

.method private notifyAppTransitionCancelledLocked()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManagerInternal$AppTransitionListener;

    invoke-virtual {v1}, Landroid/view/WindowManagerInternal$AppTransitionListener;->onAppTransitionCancelledLocked()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private notifyAppTransitionPendingLocked()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManagerInternal$AppTransitionListener;

    invoke-virtual {v1}, Landroid/view/WindowManagerInternal$AppTransitionListener;->onAppTransitionPendingLocked()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private notifyAppTransitionStartingLocked(Landroid/os/IBinder;Landroid/os/IBinder;Landroid/view/animation/Animation;Landroid/view/animation/Animation;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManagerInternal$AppTransitionListener;

    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/view/WindowManagerInternal$AppTransitionListener;->onAppTransitionStartingLocked(Landroid/os/IBinder;Landroid/os/IBinder;Landroid/view/animation/Animation;Landroid/view/animation/Animation;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private transitTypeToString()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "unknown type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_0
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_NONE"

    return-object v0

    :pswitch_1
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_CUSTOM"

    return-object v0

    :pswitch_2
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_CUSTOM_IN_PLACE"

    return-object v0

    :pswitch_3
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_SCALE_UP"

    return-object v0

    :pswitch_4
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_THUMBNAIL_SCALE_UP"

    return-object v0

    :pswitch_5
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_THUMBNAIL_SCALE_DOWN"

    return-object v0

    :pswitch_6
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_THUMBNAIL_ASPECT_SCALE_UP"

    return-object v0

    :pswitch_7
    const-string/jumbo v0, "NEXT_TRANSIT_TYPE_THUMBNAIL_ASPECT_SCALE_DOWN"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method canSkipFirstFrame()Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    if-eq v2, v0, :cond_1

    iget v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v3, 0x7

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method clear()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    iput-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    return-void
.end method

.method createAspectScaledThumbnailEnterExitAnimationLocked(IIIIILandroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/view/animation/Animation;
    .locals 20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    move/from16 v16, v0

    if-lez v16, :cond_0

    :goto_0
    move/from16 v0, v16

    int-to-float v15, v0

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    if-lez v14, :cond_1

    :goto_1
    int-to-float v13, v14

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    packed-switch p1, :pswitch_data_0

    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "Invalid thumbnail transition state"

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    const/16 v16, 0x1

    goto :goto_0

    :cond_1
    const/4 v14, 0x1

    goto :goto_1

    :pswitch_0
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_2

    move/from16 v0, p2

    int-to-float v3, v0

    div-float v2, v15, v3

    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    mul-float/2addr v3, v2

    float-to-int v11, v3

    div-float v3, v13, v2

    float-to-int v0, v3

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int v5, v5, v18

    iput v5, v3, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    :goto_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p7

    iget v5, v0, Landroid/graphics/Rect;->top:I

    iput v5, v3, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInsets:Landroid/graphics/Rect;

    move-object/from16 v0, p7

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-static {v6, v2}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v6

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-static {v8, v2}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v7

    move v4, v2

    invoke-direct/range {v1 .. v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    new-instance v10, Landroid/view/animation/ClipRectAnimation;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    invoke-direct {v10, v3, v5}, Landroid/view/animation/ClipRectAnimation;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    new-instance v17, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v5, 0x0

    neg-int v6, v11

    int-to-float v6, v6

    const/4 v8, 0x0

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v5, v6, v8}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    new-instance v12, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x1

    invoke-direct {v12, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v12, v10}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v12, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object v4, v12

    :goto_3
    const/16 v3, 0x150

    const/16 v5, 0x150

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v3, p0

    move/from16 v5, p2

    move/from16 v6, p3

    invoke-virtual/range {v3 .. v8}, Lcom/android/server/wm/AppTransition;->prepareThumbnailAnimationWithDuration(Landroid/view/animation/Animation;IIILandroid/view/animation/Interpolator;)Landroid/view/animation/Animation;

    move-result-object v3

    return-object v3

    :cond_2
    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    sub-int v3, p3, v3

    int-to-float v3, v3

    div-float v2, v13, v3

    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    mul-float/2addr v3, v2

    float-to-int v11, v3

    div-float v3, v15, v2

    float-to-int v0, v3

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int v5, v5, v19

    iput v5, v3, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto/16 :goto_2

    :pswitch_1
    const/16 v3, 0xe

    move/from16 v0, p5

    if-ne v0, v3, :cond_3

    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_3

    :cond_3
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_3

    :pswitch_2
    const/16 v3, 0xe

    move/from16 v0, p5

    if-ne v0, v3, :cond_4

    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_3

    :cond_4
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_3

    :pswitch_3
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_5

    move/from16 v0, p2

    int-to-float v3, v0

    div-float v2, v15, v3

    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    mul-float/2addr v3, v2

    float-to-int v11, v3

    div-float v3, v13, v2

    float-to-int v0, v3

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int v5, v5, v18

    iput v5, v3, Landroid/graphics/Rect;->bottom:I

    :goto_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p7

    iget v5, v0, Landroid/graphics/Rect;->top:I

    iput v5, v3, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInsets:Landroid/graphics/Rect;

    move-object/from16 v0, p7

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-static {v3, v2}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v8

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-static {v3, v2}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v9

    move-object v3, v1

    move v5, v2

    move v7, v2

    invoke-direct/range {v3 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    new-instance v10, Landroid/view/animation/ClipRectAnimation;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    invoke-direct {v10, v3, v5}, Landroid/view/animation/ClipRectAnimation;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    new-instance v17, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    neg-int v8, v11

    int-to-float v8, v8

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v5, v6, v8}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    new-instance v12, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x1

    invoke-direct {v12, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v12, v10}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v12, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object v4, v12

    const/4 v3, 0x1

    invoke-virtual {v4, v3}, Landroid/view/animation/Animation;->setZAdjustment(I)V

    goto/16 :goto_3

    :cond_5
    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    sub-int v3, p3, v3

    int-to-float v3, v3

    div-float v2, v13, v3

    move-object/from16 v0, p7

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    mul-float/2addr v3, v2

    float-to-int v11, v3

    div-float v3, v15, v2

    float-to-int v0, v3

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpFromClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p6

    invoke-virtual {v3, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/wm/AppTransition;->mTmpToClipRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int v5, v5, v19

    iput v5, v3, Landroid/graphics/Rect;->right:I

    goto/16 :goto_4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method createThumbnailAspectScaleAnimationLocked(IIII)Landroid/view/animation/Animation;
    .locals 21

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v16

    if-lez v16, :cond_0

    :goto_0
    move/from16 v0, v16

    int-to-float v15, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    if-lez v14, :cond_1

    :goto_1
    int-to-float v13, v14

    move/from16 v0, p3

    int-to-float v3, v0

    div-float v4, v3, v15

    move/from16 v0, p3

    int-to-float v0, v0

    move/from16 v20, v0

    mul-float v18, v13, v4

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    int-to-float v3, v3

    sub-float v5, v18, v13

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v5, v7

    sub-float v19, v3, v5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    if-eqz v3, :cond_2

    new-instance v2, Landroid/view/animation/ScaleAnimation;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v15, v5

    add-float v7, v3, v5

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v13, v5

    add-float v8, v3, v5

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move v6, v4

    invoke-direct/range {v2 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    invoke-virtual {v2, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v11, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v11, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    invoke-virtual {v11, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v17, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    move/from16 v0, v19

    neg-float v8, v0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInsets:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    add-float/2addr v8, v9

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v5, v7, v8}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v12, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x0

    invoke-direct {v12, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v12, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v12, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object v6, v12

    :goto_2
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    const/4 v9, 0x0

    move-object/from16 v5, p0

    move/from16 v7, p1

    move/from16 v8, p2

    invoke-virtual/range {v5 .. v10}, Lcom/android/server/wm/AppTransition;->prepareThumbnailAnimationWithDuration(Landroid/view/animation/Animation;IIILandroid/view/animation/Interpolator;)Landroid/view/animation/Animation;

    move-result-object v3

    return-object v3

    :cond_0
    const/16 v16, 0x1

    goto/16 :goto_0

    :cond_1
    const/4 v14, 0x1

    goto/16 :goto_1

    :cond_2
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v15, v5

    add-float v8, v3, v5

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v13, v5

    add-float v9, v3, v5

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move-object v3, v2

    move v6, v4

    invoke-direct/range {v3 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    invoke-virtual {v2, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v11, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v11, v3, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeInInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    invoke-virtual {v11, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v17, Landroid/view/animation/TranslateAnimation;

    const/4 v3, 0x0

    const/4 v5, 0x0

    move/from16 v0, v19

    neg-float v7, v0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInsets:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    add-float/2addr v7, v8

    const/4 v8, 0x0

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v5, v7, v8}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/wm/AppTransition;->mTouchResponseInterpolator:Landroid/view/animation/Interpolator;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v8, 0x150

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    new-instance v12, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x0

    invoke-direct {v12, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v12, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v12, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object v6, v12

    goto/16 :goto_2
.end method

.method createThumbnailEnterExitAnimationLocked(IIII)Landroid/view/animation/Animation;
    .locals 21

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    if-lez v20, :cond_0

    :goto_0
    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v18

    if-lez v18, :cond_1

    :goto_1
    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v17, v0

    packed-switch p1, :pswitch_data_0

    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v9, "Invalid thumbnail transition state"

    invoke-direct {v6, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_0
    const/16 v20, 0x1

    goto :goto_0

    :cond_1
    const/16 v18, 0x1

    goto :goto_1

    :pswitch_0
    move/from16 v0, p2

    int-to-float v6, v0

    div-float v5, v19, v6

    move/from16 v0, p3

    int-to-float v6, v0

    div-float v7, v17, v6

    new-instance v4, Landroid/view/animation/ScaleAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-static {v9, v5}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v9

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-static {v10, v7}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v10

    invoke-direct/range {v4 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/android/server/wm/AppTransition;->prepareThumbnailAnimation(Landroid/view/animation/Animation;III)Landroid/view/animation/Animation;

    move-result-object v6

    return-object v6

    :pswitch_1
    const/16 v6, 0xe

    move/from16 v0, p4

    if-ne v0, v6, :cond_2

    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v4, v6, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_2

    :cond_2
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_2

    :pswitch_2
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_2

    :pswitch_3
    move/from16 v0, p2

    int-to-float v6, v0

    div-float v5, v19, v6

    move/from16 v0, p3

    int-to-float v6, v0

    div-float v7, v17, v6

    new-instance v8, Landroid/view/animation/ScaleAnimation;

    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v11, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-static {v6, v5}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v13

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-static {v6, v7}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v14

    move v10, v5

    move v12, v7

    invoke-direct/range {v8 .. v14}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    new-instance v15, Landroid/view/animation/AlphaAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v15, v6, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    new-instance v16, Landroid/view/animation/AnimationSet;

    const/4 v6, 0x1

    move-object/from16 v0, v16

    invoke-direct {v0, v6}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    const/4 v6, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Landroid/view/animation/AnimationSet;->setZAdjustment(I)V

    move-object/from16 v4, v16

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method createThumbnailScaleAnimationLocked(III)Landroid/view/animation/Animation;
    .locals 19

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    if-lez v17, :cond_0

    :goto_0
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    if-lez v15, :cond_1

    :goto_1
    int-to-float v14, v15

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    if-eqz v7, :cond_2

    move/from16 v0, p1

    int-to-float v7, v0

    div-float v6, v7, v16

    move/from16 v0, p2

    int-to-float v7, v0

    div-float v8, v7, v14

    new-instance v4, Landroid/view/animation/ScaleAnimation;

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    const/high16 v10, 0x3f800000    # 1.0f

    div-float/2addr v10, v6

    invoke-static {v9, v10}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v9

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    const/high16 v11, 0x3f800000    # 1.0f

    div-float/2addr v11, v8

    invoke-static {v10, v11}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v10

    invoke-direct/range {v4 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v4, v7}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v12, Landroid/view/animation/AlphaAnimation;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v12, v7, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/wm/AppTransition;->mThumbnailFadeOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v12, v7}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v13, Landroid/view/animation/AnimationSet;

    const/4 v7, 0x0

    invoke-direct {v13, v7}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    invoke-virtual {v13, v4}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v13, v12}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    move-object v5, v13

    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/android/server/wm/AppTransition;->prepareThumbnailAnimation(Landroid/view/animation/Animation;III)Landroid/view/animation/Animation;

    move-result-object v7

    return-object v7

    :cond_0
    const/16 v17, 0x1

    goto :goto_0

    :cond_1
    const/4 v15, 0x1

    goto :goto_1

    :cond_2
    move/from16 v0, p1

    int-to-float v7, v0

    div-float v6, v7, v16

    move/from16 v0, p2

    int-to-float v7, v0

    div-float v8, v7, v14

    new-instance v5, Landroid/view/animation/ScaleAnimation;

    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v9, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    const/high16 v11, 0x3f800000    # 1.0f

    div-float/2addr v11, v6

    invoke-static {v10, v11}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v10

    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    const/high16 v18, 0x3f800000    # 1.0f

    div-float v18, v18, v8

    move/from16 v0, v18

    invoke-static {v11, v0}, Lcom/android/server/wm/AppTransition;->computePivot(IF)F

    move-result v11

    invoke-direct/range {v5 .. v11}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    goto :goto_2
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mAppTransitionState="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/server/wm/AppTransition;->appStateToString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionType="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/android/server/wm/AppTransition;->transitTypeToString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_0
    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    if-eqz v0, :cond_1

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionCallback="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_1
    return-void

    :pswitch_0
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionPackage="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionEnter=0x"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionEnter:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, " mNextAppTransitionExit=0x"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionExit:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionPackage="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionInPlace=0x"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInPlace:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionStartX="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v0, " mNextAppTransitionStartY="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionStartWidth="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v0, " mNextAppTransitionStartHeight="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    goto/16 :goto_0

    :pswitch_3
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionThumbnail="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string/jumbo v0, " mNextAppTransitionStartX="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v0, " mNextAppTransitionStartY="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionStartWidth="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string/jumbo v0, " mNextAppTransitionStartHeight="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo v0, "mNextAppTransitionScaleUp="

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Z)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method freeze()V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/server/wm/AppTransition;->setAppTransition(I)V

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->clear()V

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->setReady()V

    invoke-direct {p0}, Lcom/android/server/wm/AppTransition;->notifyAppTransitionCancelledLocked()V

    return-void
.end method

.method getAppTransition()I
    .locals 1

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    return v0
.end method

.method getNextAppTransitionThumbnail()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getStartingX()I
    .locals 1

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    return v0
.end method

.method getStartingY()I
    .locals 1

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    return v0
.end method

.method getThumbnailTransitionState(Z)I
    .locals 1

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x2

    return v0

    :cond_1
    iget-boolean v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x3

    return v0
.end method

.method goodToGo(Lcom/android/server/wm/AppWindowAnimator;Lcom/android/server/wm/AppWindowAnimator;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, -0x1

    iput v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    if-eqz p1, :cond_1

    iget-object v1, p1, Lcom/android/server/wm/AppWindowAnimator;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v1, v1, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object v3, v1

    :goto_0
    if-eqz p2, :cond_2

    iget-object v1, p2, Lcom/android/server/wm/AppWindowAnimator;->mAppToken:Lcom/android/server/wm/AppWindowToken;

    iget-object v1, v1, Lcom/android/server/wm/AppWindowToken;->token:Landroid/os/IBinder;

    move-object v2, v1

    :goto_1
    if-eqz p1, :cond_3

    iget-object v1, p1, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    :goto_2
    if-eqz p2, :cond_0

    iget-object v0, p2, Lcom/android/server/wm/AppWindowAnimator;->animation:Landroid/view/animation/Animation;

    :cond_0
    invoke-direct {p0, v3, v2, v1, v0}, Lcom/android/server/wm/AppTransition;->notifyAppTransitionStartingLocked(Landroid/os/IBinder;Landroid/os/IBinder;Landroid/view/animation/Animation;Landroid/view/animation/Animation;)V

    return-void

    :cond_1
    move-object v3, v0

    goto :goto_0

    :cond_2
    move-object v2, v0

    goto :goto_1

    :cond_3
    move-object v1, v0

    goto :goto_2
.end method

.method isNextThumbnailTransitionAspectScaled()Z
    .locals 3

    const/4 v0, 0x1

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isNextThumbnailTransitionScaleUp()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    return v0
.end method

.method isReady()Z
    .locals 3

    const/4 v0, 0x1

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    if-eq v1, v0, :cond_0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isRunning()Z
    .locals 2

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isTimeout()Z
    .locals 2

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isTransitionEqual(I)Z
    .locals 1

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isTransitionNone()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method isTransitionSet()Z
    .locals 2

    iget v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method loadAnimation(Landroid/view/WindowManager$LayoutParams;IZIIILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Z)Landroid/view/animation/Animation;
    .locals 11

    if-eqz p10, :cond_2

    const/4 v1, 0x6

    if-eq p2, v1, :cond_0

    const/16 v1, 0x8

    if-ne p2, v1, :cond_1

    :cond_0
    if-eqz p3, :cond_4

    const v1, 0x10a0081

    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/android/server/wm/AppTransition;->loadAnimationRes(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;

    move-result-object v9

    :goto_1
    return-object v9

    :cond_1
    const/16 v1, 0xa

    if-eq p2, v1, :cond_0

    :cond_2
    if-eqz p10, :cond_6

    const/4 v1, 0x7

    if-eq p2, v1, :cond_3

    const/16 v1, 0x9

    if-ne p2, v1, :cond_5

    :cond_3
    if-eqz p3, :cond_7

    const v1, 0x10a007f

    :goto_2
    invoke-virtual {p0, p1, v1}, Lcom/android/server/wm/AppTransition;->loadAnimationRes(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_4
    const v1, 0x10a0082

    goto :goto_0

    :cond_5
    const/16 v1, 0xb

    if-eq p2, v1, :cond_3

    :cond_6
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_9

    iget-object v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    if-eqz p3, :cond_8

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionEnter:I

    :goto_3
    invoke-direct {p0, v2, v1}, Lcom/android/server/wm/AppTransition;->loadAnimationRes(Ljava/lang/String;I)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_7
    const v1, 0x10a0080

    goto :goto_2

    :cond_8
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionExit:I

    goto :goto_3

    :cond_9
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x7

    if-ne v1, v2, :cond_a

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iget v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInPlace:I

    invoke-direct {p0, v1, v2}, Lcom/android/server/wm/AppTransition;->loadAnimationRes(Ljava/lang/String;I)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_a
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_b

    move-object/from16 v0, p9

    invoke-direct {p0, p2, p3, v0}, Lcom/android/server/wm/AppTransition;->createClipRevealAnimationLocked(IZLandroid/graphics/Rect;)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_b
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_c

    move/from16 v0, p5

    invoke-direct {p0, p2, p3, p4, v0}, Lcom/android/server/wm/AppTransition;->createScaleUpAnimationLocked(IZII)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_c
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_d

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_f

    :cond_d
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_e

    const/4 v1, 0x1

    :goto_4
    iput-boolean v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    invoke-virtual {p0, p3}, Lcom/android/server/wm/AppTransition;->getThumbnailTransitionState(Z)I

    move-result v1

    move/from16 v0, p5

    invoke-virtual {p0, v1, p4, v0, p2}, Lcom/android/server/wm/AppTransition;->createThumbnailEnterExitAnimationLocked(IIII)Landroid/view/animation/Animation;

    move-result-object v9

    goto :goto_1

    :cond_e
    const/4 v1, 0x0

    goto :goto_4

    :cond_f
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_10

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_12

    :cond_10
    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_11

    const/4 v1, 0x1

    :goto_5
    iput-boolean v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    invoke-virtual {p0, p3}, Lcom/android/server/wm/AppTransition;->getThumbnailTransitionState(Z)I

    move-result v2

    move-object v1, p0

    move v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    move v6, p2

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-virtual/range {v1 .. v8}, Lcom/android/server/wm/AppTransition;->createAspectScaledThumbnailEnterExitAnimationLocked(IIIIILandroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/view/animation/Animation;

    move-result-object v9

    goto/16 :goto_1

    :cond_11
    const/4 v1, 0x0

    goto :goto_5

    :cond_12
    const/4 v10, 0x0

    packed-switch p2, :pswitch_data_0

    :goto_6
    if-eqz v10, :cond_1e

    invoke-virtual {p0, p1, v10}, Lcom/android/server/wm/AppTransition;->loadAnimationAttr(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;

    move-result-object v9

    goto/16 :goto_1

    :pswitch_0
    if-eqz p3, :cond_13

    const/4 v10, 0x4

    goto :goto_6

    :cond_13
    const/4 v10, 0x5

    goto :goto_6

    :pswitch_1
    if-eqz p3, :cond_14

    const/4 v10, 0x6

    goto :goto_6

    :cond_14
    const/4 v10, 0x7

    goto :goto_6

    :pswitch_2
    if-eqz p3, :cond_15

    const/16 v10, 0x8

    goto :goto_6

    :cond_15
    const/16 v10, 0x9

    goto :goto_6

    :pswitch_3
    if-eqz p3, :cond_16

    const/16 v10, 0xa

    goto :goto_6

    :cond_16
    const/16 v10, 0xb

    goto :goto_6

    :pswitch_4
    if-eqz p3, :cond_17

    const/16 v10, 0xc

    goto :goto_6

    :cond_17
    const/16 v10, 0xd

    goto :goto_6

    :pswitch_5
    if-eqz p3, :cond_18

    const/16 v10, 0xe

    goto :goto_6

    :cond_18
    const/16 v10, 0xf

    goto :goto_6

    :pswitch_6
    if-eqz p3, :cond_19

    const/16 v10, 0x10

    goto :goto_6

    :cond_19
    const/16 v10, 0x11

    goto :goto_6

    :pswitch_7
    if-eqz p3, :cond_1a

    const/16 v10, 0x12

    goto :goto_6

    :cond_1a
    const/16 v10, 0x13

    goto :goto_6

    :pswitch_8
    if-eqz p3, :cond_1b

    const/16 v10, 0x14

    goto :goto_6

    :cond_1b
    const/16 v10, 0x15

    goto :goto_6

    :pswitch_9
    if-eqz p3, :cond_1c

    const/16 v10, 0x16

    goto :goto_6

    :cond_1c
    const/16 v10, 0x17

    goto :goto_6

    :pswitch_a
    if-eqz p3, :cond_1d

    const/16 v10, 0x19

    goto :goto_6

    :cond_1d
    const/16 v10, 0x18

    goto :goto_6

    :cond_1e
    const/4 v9, 0x0

    goto/16 :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_6
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method loadAnimationAttr(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mContext:Landroid/content/Context;

    if-ltz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/android/server/wm/AppTransition;->getCachedAnimations(Landroid/view/WindowManager$LayoutParams;)Lcom/android/server/AttributeCache$Entry;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v1, v2, Lcom/android/server/AttributeCache$Entry;->context:Landroid/content/Context;

    iget-object v3, v2, Lcom/android/server/AttributeCache$Entry;->array:Landroid/content/res/TypedArray;

    invoke-virtual {v3, p2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    :cond_0
    if-eqz v0, :cond_1

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    return-object v3

    :cond_1
    return-object v5
.end method

.method loadAnimationRes(Landroid/view/WindowManager$LayoutParams;I)Landroid/view/animation/Animation;
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mContext:Landroid/content/Context;

    if-ltz p2, :cond_1

    invoke-direct {p0, p1}, Lcom/android/server/wm/AppTransition;->getCachedAnimations(Landroid/view/WindowManager$LayoutParams;)Lcom/android/server/AttributeCache$Entry;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, v1, Lcom/android/server/AttributeCache$Entry;->context:Landroid/content/Context;

    :cond_0
    invoke-static {v0, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    return-object v2

    :cond_1
    return-object v2
.end method

.method public notifyAppTransitionFinishedLocked(Landroid/os/IBinder;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManagerInternal$AppTransitionListener;

    invoke-virtual {v1, p1}, Landroid/view/WindowManagerInternal$AppTransitionListener;->onAppTransitionFinishedLocked(Landroid/os/IBinder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method overrideInPlaceAppTransition(Ljava/lang/String;I)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    iput-object p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionInPlace:I

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    goto :goto_0
.end method

.method overridePendingAppTransition(Ljava/lang/String;IILandroid/os/IRemoteCallback;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    iput-object p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionEnter:I

    iput p3, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionExit:I

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    iput-object p4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    goto :goto_0
.end method

.method overridePendingAppTransitionAspectScaledThumb(Landroid/graphics/Bitmap;IIIILandroid/os/IRemoteCallback;Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p7, :cond_0

    const/4 v0, 0x5

    :goto_0
    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    iput-boolean p7, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    iput p3, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    iput p4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    iput p5, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    iput-object p6, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x6

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    goto :goto_1
.end method

.method overridePendingAppTransitionClipReveal(IIII)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    iput p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    iput p3, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    iput p4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :cond_0
    return-void
.end method

.method overridePendingAppTransitionScaleUp(IIII)V
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    iput-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    iput p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    iput p3, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartWidth:I

    iput p4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartHeight:I

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    iput-object v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :cond_0
    return-void
.end method

.method overridePendingAppTransitionThumb(Landroid/graphics/Bitmap;IILandroid/os/IRemoteCallback;Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isTransitionSet()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p5, :cond_0

    const/4 v0, 0x3

    :goto_0
    iput v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionType:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionPackage:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionThumbnail:Landroid/graphics/Bitmap;

    iput-boolean p5, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionScaleUp:Z

    iput p2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartX:I

    iput p3, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionStartY:I

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    iput-object p4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :goto_1
    return-void

    :cond_0
    const/4 v0, 0x4

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->postAnimationCallback()V

    goto :goto_1
.end method

.method postAnimationCallback()V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mH:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/wm/AppTransition;->mH:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    const/16 v3, 0x1a

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    iput-object v4, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransitionCallback:Landroid/os/IRemoteCallback;

    :cond_0
    return-void
.end method

.method prepare()Z
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/server/wm/AppTransition;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    iput v1, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    invoke-direct {p0}, Lcom/android/server/wm/AppTransition;->notifyAppTransitionPendingLocked()V

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method prepareThumbnailAnimation(Landroid/view/animation/Animation;III)Landroid/view/animation/Animation;
    .locals 6

    packed-switch p4, :pswitch_data_0

    const/16 v4, 0x150

    :goto_0
    iget-object v5, p0, Lcom/android/server/wm/AppTransition;->mDecelerateInterpolator:Landroid/view/animation/Interpolator;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/wm/AppTransition;->prepareThumbnailAnimationWithDuration(Landroid/view/animation/Animation;IIILandroid/view/animation/Interpolator;)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0

    :pswitch_0
    iget v4, p0, Lcom/android/server/wm/AppTransition;->mConfigShortAnimTime:I

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method prepareThumbnailAnimationWithDuration(Landroid/view/animation/Animation;IIILandroid/view/animation/Interpolator;)Landroid/view/animation/Animation;
    .locals 2

    if-lez p4, :cond_0

    int-to-long v0, p4

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    invoke-virtual {p1, p5}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {p1, p2, p3, p2, p3}, Landroid/view/animation/Animation;->initialize(IIII)V

    return-object p1
.end method

.method registerListenerLocked(Landroid/view/WindowManagerInternal$AppTransitionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/android/server/wm/AppTransition;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method setAppTransition(I)V
    .locals 0

    iput p1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    return-void
.end method

.method public setCurrentUser(I)V
    .locals 0

    iput p1, p0, Lcom/android/server/wm/AppTransition;->mCurrentUserId:I

    return-void
.end method

.method setIdle()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    return-void
.end method

.method setReady()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    return-void
.end method

.method setTimeout()V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/server/wm/AppTransition;->mAppTransitionState:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "mNextAppTransition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/wm/AppTransition;->mNextAppTransition:I

    invoke-static {v1}, Lcom/android/server/wm/AppTransition;->appTransitionToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
