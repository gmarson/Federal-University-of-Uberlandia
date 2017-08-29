.class public Lnano05;
.super Ljava/lang/Object;
.source "nano05.java"


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
    .registers 5

    .prologue
    .line 6
    move-object v0, p0

    const/4 v2, 0x2

    move v1, v2

    .line 7
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move v3, v1

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(I)V

    .line 8
    return-void
.end method
