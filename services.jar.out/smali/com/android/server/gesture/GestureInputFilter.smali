.class public Lcom/android/server/gesture/GestureInputFilter;
.super Ljava/lang/Object;
.source "GestureInputFilter.java"

# interfaces
.implements Landroid/view/IInputFilter;
.implements Landroid/view/GestureDetector$OnGestureListener;
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "GestureInputFilter"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDoubleClickPendingIntent:Landroid/app/PendingIntent;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGesturePadHeight:F

.field private mGesturePadWidth:F

.field private mHost:Landroid/view/IInputFilterHost;

.field private mInputManager:Landroid/hardware/input/InputManager;

.field private mLongPressPendingIntent:Landroid/app/PendingIntent;

.field private mOrientation:I

.field private mOrientationListener:Landroid/view/OrientationEventListener;

.field private final mScreenHeight:I

.field private final mScreenWidth:I

.field private mTouchSlop:I


# direct methods
.method static synthetic -set0(Lcom/android/server/gesture/GestureInputFilter;I)I
    .locals 0

    iput p1, p0, Lcom/android/server/gesture/GestureInputFilter;->mOrientation:I

    return p1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v5, 0x0

    iput-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mHost:Landroid/view/IInputFilterHost;

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mInputManager:Landroid/hardware/input/InputManager;

    iput-object p1, p0, Lcom/android/server/gesture/GestureInputFilter;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v5}, Landroid/hardware/input/InputManager;->getInputDeviceIds()[I

    move-result-object v7

    array-length v8, v7

    move v5, v6

    :goto_0
    if-ge v5, v8, :cond_0

    aget v1, v7, v5

    iget-object v9, p0, Lcom/android/server/gesture/GestureInputFilter;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v9, v1}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/InputDevice;->getSources()I

    move-result v9

    const/high16 v10, 0x10000000

    and-int/2addr v9, v10

    iget-object v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mInputManager:Landroid/hardware/input/InputManager;

    invoke-virtual {v10, v1}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/InputDevice;->getSources()I

    move-result v10

    if-ne v9, v10, :cond_1

    invoke-virtual {v2, v6}, Landroid/view/InputDevice;->getMotionRange(I)Landroid/view/InputDevice$MotionRange;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMax()F

    move-result v5

    iput v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadWidth:F

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/view/InputDevice;->getMotionRange(I)Landroid/view/InputDevice$MotionRange;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/InputDevice$MotionRange;->getMax()F

    move-result v5

    iput v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    :cond_0
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v5

    iput v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    const-string/jumbo v5, "window"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v5

    iput v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenWidth:I

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v5

    iput v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenHeight:I

    new-instance v5, Landroid/view/GestureDetector;

    invoke-direct {v5, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v5, p0}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    new-instance v5, Lcom/android/server/gesture/GestureInputFilter$1;

    invoke-direct {v5, p0, p1}, Lcom/android/server/gesture/GestureInputFilter$1;-><init>(Lcom/android/server/gesture/GestureInputFilter;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/android/server/gesture/GestureInputFilter;->mOrientationListener:Landroid/view/OrientationEventListener;

    return-void

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private generateSwipe(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 13

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mOrientation:I

    sparse-switch v10, :sswitch_data_0

    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    cmpg-float v10, v0, v10

    if-gez v10, :cond_0

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    cmpg-float v10, v1, v10

    if-gez v10, :cond_0

    const/4 v10, 0x0

    return v10

    :sswitch_0
    const-string/jumbo v10, "GestureInputFilter"

    const-string/jumbo v11, "Adjusting motion for 90 degrees"

    invoke-static {v10, v11}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    invoke-virtual {p1, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_0

    :sswitch_1
    const-string/jumbo v10, "GestureInputFilter"

    const-string/jumbo v11, "Adjusting motion for 180 degrees"

    invoke-static {v10, v11}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadWidth:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    iget v11, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {p1, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadWidth:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    iget v11, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_0

    :sswitch_2
    const-string/jumbo v10, "GestureInputFilter"

    const-string/jumbo v11, "Adjusting motion for 270 degrees"

    invoke-static {v10, v11}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    invoke-virtual {p1, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto/16 :goto_0

    :cond_0
    cmpl-float v10, v0, v1

    if-lez v10, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    :cond_1
    :goto_1
    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenWidth:I

    int-to-float v10, v10

    iget v11, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadWidth:F

    div-float v8, v10, v11

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenHeight:I

    int-to-float v10, v10

    iget v11, p0, Lcom/android/server/gesture/GestureInputFilter;->mGesturePadHeight:F

    div-float v9, v10, v11

    mul-float v4, v0, v8

    mul-float v5, v1, v9

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenWidth:I

    div-int/lit8 v10, v10, 0x2

    int-to-float v6, v10

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mScreenHeight:I

    div-int/lit8 v10, v10, 0x2

    int-to-float v7, v10

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_3

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    add-float/2addr v10, v6

    const/high16 v11, 0x40a00000    # 5.0f

    add-float v2, v10, v11

    add-float v3, v7, v5

    :goto_2
    invoke-direct {p0, v6, v7, v2, v3}, Lcom/android/server/gesture/GestureInputFilter;->sendSwipe(FFFF)V

    const/4 v10, 0x1

    return v10

    :cond_2
    cmpl-float v10, v1, v0

    if-lez v10, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_1

    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    cmpg-float v10, v10, v11

    if-gez v10, :cond_4

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    add-float/2addr v10, v6

    const/high16 v11, 0x40a00000    # 5.0f

    add-float v2, v10, v11

    sub-float v3, v7, v5

    goto :goto_2

    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_5

    add-float v2, v6, v4

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    add-float/2addr v10, v7

    const/high16 v11, 0x40a00000    # 5.0f

    add-float v3, v10, v11

    goto :goto_2

    :cond_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    cmpg-float v10, v10, v11

    if-gez v10, :cond_6

    sub-float v2, v6, v4

    iget v10, p0, Lcom/android/server/gesture/GestureInputFilter;->mTouchSlop:I

    int-to-float v10, v10

    add-float/2addr v10, v7

    const/high16 v11, 0x40a00000    # 5.0f

    add-float v3, v10, v11

    goto :goto_2

    :cond_6
    const/4 v10, 0x0

    return v10

    nop

    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_0
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_2
    .end sparse-switch
.end method

.method private static final lerp(FFF)F
    .locals 1

    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method

.method private sendInputEvent(Landroid/view/InputEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/android/server/gesture/GestureInputFilter;->mInputManager:Landroid/hardware/input/InputManager;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    return-void
.end method

.method private sendMotionEvent(IJFFF)V
    .locals 24

    const/high16 v21, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    const/high16 v19, 0x3f800000    # 1.0f

    const/high16 v20, 0x3f800000    # 1.0f

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-wide/from16 v2, p2

    move-wide/from16 v4, p2

    move/from16 v6, p1

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-static/range {v2 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFFFIFFII)Landroid/view/MotionEvent;

    move-result-object v22

    const/16 v2, 0x1002

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->setSource(I)V

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/android/server/gesture/GestureInputFilter;->sendInputEvent(Landroid/view/InputEvent;)V

    return-void
.end method

.method private sendSwipe(FFFF)V
    .locals 18

    const-wide/16 v10, 0x64

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    move-wide/from16 v16, v4

    const-wide/16 v2, 0x64

    add-long v14, v16, v2

    const/4 v3, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v2, p0

    move/from16 v6, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v8}, Lcom/android/server/gesture/GestureInputFilter;->sendMotionEvent(IJFFF)V

    :goto_0
    cmp-long v2, v4, v14

    if-gez v2, :cond_0

    sub-long v12, v4, v16

    long-to-float v2, v12

    const/high16 v3, 0x42c80000    # 100.0f

    div-float v9, v2, v3

    move/from16 v0, p1

    move/from16 v1, p3

    invoke-static {v0, v1, v9}, Lcom/android/server/gesture/GestureInputFilter;->lerp(FFF)F

    move-result v6

    move/from16 v0, p2

    move/from16 v1, p4

    invoke-static {v0, v1, v9}, Lcom/android/server/gesture/GestureInputFilter;->lerp(FFF)F

    move-result v7

    const/4 v3, 0x2

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/server/gesture/GestureInputFilter;->sendMotionEvent(IJFFF)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v2, p0

    move/from16 v6, p3

    move/from16 v7, p4

    invoke-direct/range {v2 .. v8}, Lcom/android/server/gesture/GestureInputFilter;->sendMotionEvent(IJFFF)V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public filterInputEvent(Landroid/view/InputEvent;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p1}, Landroid/view/InputEvent;->getSource()I

    move-result v3

    const/high16 v4, 0x10000000

    if-ne v3, v4, :cond_0

    instance-of v3, p1, Landroid/view/MotionEvent;

    if-eqz v3, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/view/MotionEvent;

    move-object v2, v0

    iget-object v3, p0, Lcom/android/server/gesture/GestureInputFilter;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/view/InputEvent;->recycle()V

    return-void

    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/android/server/gesture/GestureInputFilter;->mHost:Landroid/view/IInputFilterHost;

    invoke-interface {v3, p1, p2}, Landroid/view/IInputFilterHost;->sendInputEvent(Landroid/view/InputEvent;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {p1}, Landroid/view/InputEvent;->recycle()V

    return-void

    :catchall_0
    move-exception v3

    invoke-virtual {p1}, Landroid/view/InputEvent;->recycle()V

    throw v3

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public install(Landroid/view/IInputFilterHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iput-object p1, p0, Lcom/android/server/gesture/GestureInputFilter;->mHost:Landroid/view/IInputFilterHost;

    iget-object v0, p0, Lcom/android/server/gesture/GestureInputFilter;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    return-void
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mDoubleClickPendingIntent:Landroid/app/PendingIntent;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mDoubleClickPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    return v1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/app/PendingIntent$CanceledException;->printStackTrace()V

    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/android/server/gesture/GestureInputFilter;->generateSwipe(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mLongPressPendingIntent:Landroid/app/PendingIntent;

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mLongPressPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/app/PendingIntent$CanceledException;->printStackTrace()V

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setOnDoubleClickPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/gesture/GestureInputFilter;->mDoubleClickPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method public setOnLongPressPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/gesture/GestureInputFilter;->mLongPressPendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method public uninstall()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mHost:Landroid/view/IInputFilterHost;

    iget-object v0, p0, Lcom/android/server/gesture/GestureInputFilter;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    iput-object v1, p0, Lcom/android/server/gesture/GestureInputFilter;->mContext:Landroid/content/Context;

    return-void
.end method
