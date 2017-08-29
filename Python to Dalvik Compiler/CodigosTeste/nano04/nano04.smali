.class public Lnano04;
.super Ljava/lang/Object;
.source "nano04.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 1
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 6
    move-object v0, p0

    const/4 v2, 0x3

    move v1, v2

    .line 7
    return-void
.end method
